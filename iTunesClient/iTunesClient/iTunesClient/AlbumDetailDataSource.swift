//
//  AlbumDetailDataSource.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/9/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource {
    
    var songs: [Song]
    
    struct Constants {
        static let songCellIdentifier = "SongCell"
    }
    
    init(songs: [Song]) {
        self.songs = songs
        super.init()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Tracks"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let songCell = tableView.dequeueReusableCell(withIdentifier: Constants.songCellIdentifier, for: indexPath) as! SongCell
        
        let song = songs[indexPath.row]
        let viewModel = SongViewModel(with: song)
        songCell.songNameLabel.text = viewModel.name
        songCell.trackTimeLabel.text = viewModel.trackTime
        
        return songCell
    }
    
    func update(with songs: [Song]) {
        self.songs = songs
    }
    

}
