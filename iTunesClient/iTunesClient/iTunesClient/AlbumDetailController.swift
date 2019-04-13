
import UIKit

class AlbumDetailController: UITableViewController {

    var dataSource = AlbumDetailDataSource(songs: [])
    
    
    var album: Album? {
        didSet{
            configure(with: self.album!)
            self.dataSource.update(with: album!.songs)
            tableView.reloadData()
        }
    }
    
    
    
    @IBOutlet weak var artworkImageView: UIImageView!
    
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var releasedDateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let album = album {
            configure(with: album)
        }
        
        tableView.dataSource = dataSource
 
    }
    
    
    
    func configure(with album: Album) {
        
        let viewModel = AlbumDetailViewModel(album: album)
        
        albumTitleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releasedDateLabel.text = viewModel.releasedDate
    }
}
