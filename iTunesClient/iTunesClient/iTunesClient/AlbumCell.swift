//
//  AlbumCell.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/8/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    
    @IBOutlet weak var artworkView: UIImageView!
    
    
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    @IBOutlet weak var genreTitleLable: UILabel!
    
    @IBOutlet weak var releasedDateLabel: UILabel!
    
    static let reuseIdentifier = "AlbumCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(with viewModel: AlbumCellViewModel) {
        artworkView.image = viewModel.artwork
        albumTitleLabel.text = viewModel.title
        genreTitleLable.text = viewModel.genre
        releasedDateLabel.text = viewModel.releasedDate
    }

}
