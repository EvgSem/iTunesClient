import Foundation
import UIKit


class ArtworkDownloader: Operation {
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    
    override func main() {
        if self.isCancelled {
            return
        }
        
        guard let url = URL(string: album.artworkUrl) else {
            return
        }
        
        let imageData = try! Data(contentsOf: url)
        
        if self.isCancelled {
            return
        }
        
        if imageData.count > 0 {
            album.artWork = UIImage(data: imageData)
            album.artworkState = .downloaded
        } else {
            album.artworkState = .failed
        }
    }
    
    
}
