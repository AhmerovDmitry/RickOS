import UIKit

// MARK: - Add() and remove() child UIViewController
@nonobjc extension UIViewController {
    func add(parent: UIViewController, child: UIViewController) {
        parent.view.addSubview(child.view)
        parent.addChild(child)
        child.didMove(toParent: parent)
    }
    func remove() {
        children.forEach({
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        })
    }
}
