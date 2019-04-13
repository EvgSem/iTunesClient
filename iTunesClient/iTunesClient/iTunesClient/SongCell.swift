//
//  SongCell.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/9/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var trackTimeLabel: UILabel!
    
    var viewModel: SongViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if let viewModel = viewModel {
            configure(with: viewModel)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(with viewModel: SongViewModel) {
        
        songNameLabel.text = viewModel.name
        trackTimeLabel.text = viewModel.trackTime
    }

}
