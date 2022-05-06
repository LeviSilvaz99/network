//
//  ContentView.swift
//  MusicFetcher
//
//  Created by André Levi Oliveira Silva on 05/05/22.
//

import SwiftUI
import Combine

struct ContentView: View {
  
  @ObservedObject var artistInfo = ArtistQuery()
  
    var body: some View {
        VStack {
          Image(uiImage: artistInfo.photo)
            .resizable()
            .aspectRatio(contentMode: .fit)
          Text("Leonard Cohen")
          Text(self.artistInfo.bio)
            .padding()
          Spacer()
        }
      }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
