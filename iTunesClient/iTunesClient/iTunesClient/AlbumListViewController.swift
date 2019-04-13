//
//  AlbumListViewController.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/5/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import UIKit

class AlbumListViewController: UITableViewController {
    
    private struct Constants {
        static let AlbumCellHeight: CGFloat = 80
    }
    
    var client = ITunesAPIClient()
    
    var artist: Artist? {
        didSet{
            self.title = artist?.name
            dataSource.update(with: artist!.albums)
            tableView.reloadData()
        }
    }
    
    lazy var dataSource : AlbumListDataSource = {
        return AlbumListDataSource(albums: [], tableView: self.tableView)
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource

    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                let album = dataSource.album(at: selectedIndexPath)
                let albumDetailcontroller = segue.destination as! AlbumDetailController
                client.lookupAlbum(withId: album.id) { album, error in
                    albumDetailcontroller.album = album
                    albumDetailcontroller.tableView.reloadData()
                    
                }
            }
        }
    }
}
