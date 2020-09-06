import UIKit

extension BaseViewController {
    func showChildController(shouldMove: Bool, controller: UIViewController) {
        switch shouldMove {
        case true:
            add(controller)
            UIView.animate(withDuration: 0.40,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            self.children[0].view.frame.origin.y = 368
            },
                           completion: { _ in
                            print("Child controller init")
            })
        
        case false:
            UIView.animate(withDuration: 0.25,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            self.children[0].view.frame.origin.y += 368
            },
                           completion: { _ in
                            self.children[0].remove(controller: self)
                            print("Child controller deinit")
            })
        }
    }
}
