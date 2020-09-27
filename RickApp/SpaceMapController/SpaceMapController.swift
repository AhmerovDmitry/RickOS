import UIKit

class SpaceMapController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SpaceMapController - init")
        view.backgroundColor = .yellow
    }
    
    deinit {
        print("SpaceMapController - deinit")
    }
}
