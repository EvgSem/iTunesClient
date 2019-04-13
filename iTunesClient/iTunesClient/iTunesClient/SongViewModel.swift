//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/9/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import Foundation

struct SongViewModel {
    var name: String
    var trackTime: String
}

extension SongViewModel {
    init(with song: Song) {
        self.name = song.censoredName
        
        
        let timeInSeconds = song.trackTime/1000
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        self.trackTime = "\(minutes):\(seconds)"
    }
}
