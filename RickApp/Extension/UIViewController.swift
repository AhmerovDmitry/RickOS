import UIKit

// MARK: - Add() and remove() child UIViewController
@nonobjc extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
        print("Controller \(child) - init")
    }

    func remove(controller: UIViewController) {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
        print("Controller \(controller) - deinit")
    }
}
