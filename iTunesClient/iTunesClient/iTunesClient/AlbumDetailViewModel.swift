//
//  AlbumCellViewModel.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/8/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import Foundation


struct AlbumDetailViewModel {
    
    let title: String
    let releasedDate: String
    let genre: String
}

extension AlbumDetailViewModel {
    
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMM dd, yyyy"
        
        self.releasedDate = formatter.string(from: album.releaseDate)
    }
}

