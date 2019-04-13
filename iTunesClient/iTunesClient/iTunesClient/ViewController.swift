//
//  ViewController.swift
//  iTunesClient
//
//  Created by Screencast on 3/30/17.
//  Copyright © 2017 Treehouse Island. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let search = Itunes.search(term: "taylor swift", media: .music(entity: .musicArtist, attribute: .artistTerm))
        print(search.request)
        
        let lookup = Itunes.lookup(id: 159260351, entity: MusicEntity.album)
        print(lookup.request)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

