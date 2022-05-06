//
//  ArtistQuery.swift
//  MusicFetcher
//
//  Created by André Levi Oliveira Silva on 05/05/22.
//

import UIKit
import Combine

struct ArtistInfo: Codable {
  let biography: String
  let photo: String
}

struct Token: Codable {
  let location: String
}

final class ArtistQuery: ObservableObject {
  
  @Published var photo = UIImage(named: "c_urlsession_card_artwork")!
  @Published var bio = ""
  
  var cancellables: Set<AnyCancellable> = []
  
  init() {
    let locationUrl = URL(string: "https://api.npoint.io/e0b6213b830ade9ac1f8")!
    let artistInfoPublisher = URLSession.shared.dataTaskPublisher(for: locationUrl)
      .map(\.data)
      .decode(type: Token.self, decoder: JSONDecoder())
      .flatMap { item in
        self.getArtistInfo(forLocation: item.location)
      }
    
    let photoPublisher = artistInfoPublisher
      .compactMap { URL(string: $0.photo )}
      .flatMap { photoUrl in
        URLSession.shared.dataTaskPublisher(for: photoUrl)
          .compactMap { UIImage(data: $0.data) }
          .mapError { $0 as Error }
      }
    
    Publishers.Zip(artistInfoPublisher, photoPublisher)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
          print(completion)
        },
        receiveValue: { info, photo in
          self.photo = photo
          self.bio = info.biography
        }
      ).store(in: &cancellables)
    
  }
  
  func getArtistInfo(forLocation location: String) -> AnyPublisher<ArtistInfo, Error> {
    
    let artistUrl = URL(string: "https://api.npoint.io/\(location)")!
    return URLSession.shared.dataTaskPublisher(for: artistUrl)
      .map { $0.data }
      .decode(type: ArtistInfo.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
  
}
