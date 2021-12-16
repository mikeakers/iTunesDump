//
//  main.swift
//  iTunesDump
//
//  Created by Mike Akers on 12/16/21.
//

import Foundation
import iTunesLibrary

guard let library = try? ITLibrary(apiVersion: "1.0") else { exit(1) }

let playlists = library.allPlaylists
let mediaItems = library.allMediaItems

for mediaItem in mediaItems {
  guard
    let artist = mediaItem.artist?.name,
    let albumTitle = mediaItem.album.title
  else {
    print("Oops something was missing for \(mediaItem.title)")
    exit(1)
  }
    
  print("\(artist), \(albumTitle), \(mediaItem.title)")
}
