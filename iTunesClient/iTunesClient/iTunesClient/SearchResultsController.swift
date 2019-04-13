//
//  SearchResultsController.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/4/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    let dataSource = SearchResultsDataSource()
    let searchController = UISearchController(searchResultsController: nil)
    var client = ITunesAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dissmissSearchResultsControll))
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
        tableView.dataSource = dataSource
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
    }

    
    func dissmissSearchResultsControll(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: -Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbums" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = dataSource.artists(at: indexPath)
                let albumListController = segue.destination as! AlbumListViewController
                client.lookupArtists(withId: artist.id) { artist, error in
                    albumListController.artist = artist
                    albumListController.tableView.reloadData()
                }
            }
            
        }
    }
}


extension SearchResultsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
//        dataSource.update(with: [Stub.artist])
//        tableView.reloadData()
        
        client.searchForArtist(withTerm: searchController.searchBar.text!) { [weak self] artists, error in
             self?.dataSource.update(with: artists)
            self?.tableView.reloadData()
        }
    }
    
}
