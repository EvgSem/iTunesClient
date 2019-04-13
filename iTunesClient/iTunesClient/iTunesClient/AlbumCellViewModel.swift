//
//  AlbumCellViewModel.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/8/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import Foundation
import UIKit

struct AlbumCellViewModel {
    
    let title: String
    let releasedDate: String
    let genre: String
    let artwork: UIImage
}

extension AlbumCellViewModel {
    
    init(album: Album) {
        self.artwork = album.artworkState == .downloaded ? album.artWork! :  UIImage(imageLiteralResourceName: "AlbumPlaceholder") 
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "DDD dd, yyyy"
        
        self.releasedDate = formatter.string(from: album.releaseDate)
    }
}

