

import Foundation


class PendingOperations {
    var downLoadsProgress = [IndexPath: Operation] ()
    var downloadQueue = OperationQueue()
}
