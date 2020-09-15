import UIKit

extension BaseViewController {
    func showChildController(shouldMove: Bool) {
        switch shouldMove {
        case true:
            add(parent: self, child: DetailPopController())
            UIView.animate(withDuration: 0.40,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            self.children[0].view.frame.origin.y = 368
                            //self.children[0].view.frame.origin.y = UIScreen.main.bounds.height - 280
            })
        
        case false:
            UIView.animate(withDuration: 0.25,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            self.children[0].view.frame.origin.y += 368
            },
                           completion: { _ in
                            self.remove()
            })
        }
    }
}
