//
//  ContentView.swift
//  MusicFetcher
//
//  Created by André Levi Oliveira Silva on 05/05/22.
//

import SwiftUI
import Combine

struct ContentView: View {
  
  @ObservedObject var mediaQuery = MediaQuery()
  
  var body: some View {
    NavigationView {
      VStack {
        TextField("Search", text: $mediaQuery.itunesQuery)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()
        List(mediaQuery.searchResults) { item in
          VStack(alignment: .leading) {
            Text(item.trackName).font(.headline)
            Text(item.artistName).font(.subheadline)
          }
        }
      }
      .navigationBarTitle("Search Music")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
