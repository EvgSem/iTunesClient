//
//  AlbumListDataSource.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/8/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {
    
    
    private var albums: [Album]
    
    let pendingOperations = PendingOperations()
    
    let tableView: UITableView
    
    
    
    init(albums: [Album], tableView: UITableView){
        self.albums = albums
        self.tableView = tableView
        super.init()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as! AlbumCell
        
        let album = albums[indexPath.row]
        let viewModel = AlbumCellViewModel(album: album)
        albumCell.configure(with: viewModel)
        albumCell.accessoryType = .disclosureIndicator
        
        if album.artworkState == .placeholder {
            downloadArtworkForAlbum(album, atIndexPath: indexPath)
        }
        
        return albumCell
        
    }
    
    
    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }
    
    func update(with albums: [Album]) {
        self.albums = albums
    }
    
    
    func downloadArtworkForAlbum(_ album: Album, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downLoadsProgress[indexPath] {
            return
        }
        
        let downloader = ArtworkDownloader(album: album)
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            
            DispatchQueue.main.async {
                self.pendingOperations.downLoadsProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        pendingOperations.downLoadsProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
}
