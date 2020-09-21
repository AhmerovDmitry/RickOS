import UIKit

// MARK: - UICollectionViewDataSource
extension BaseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize()
        switch indexPath.row {
        case 0: cellSize = CGSize(width: 160, height: 160)
        case 4: cellSize = CGSize(width: 160, height: 160)
        default: cellSize = CGSize(width: 80, height: 160)
        }
        
        return cellSize
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BaseViewCell
        cell.data = self.data[indexPath.row]
        cell.layer.cornerRadius = BaseViewController.cellCornerRadius
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        
        switch indexPath.row {
        case 0:
            cell.cellButton.removeFromSuperview()
            cell.backgroundColor = UIColor(red: 77/255, green: 177/255, blue: 177/255, alpha: 1)
        case 1:
            cell.addButton.removeFromSuperview()
            cell.backgroundColor = UIColor.white
            cell.cellButton.addTarget(self, action: #selector(showDetailController), for: .touchUpInside)
        case 2:
            cell.addButton.removeFromSuperview()
            cell.backgroundColor = UIColor.white
            cell.cellButton.addTarget(self, action: #selector(showSpaceshipBuilderController), for: .touchUpInside)
        case 4:
            cell.cellButton.removeFromSuperview()
            cell.backgroundColor = UIColor(red: 77/255, green: 177/255, blue: 177/255, alpha: 1)
        default:
            cell.addButton.removeFromSuperview()
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - @objc methods
@objc extension BaseViewController {
    func showDetailController() {
        isMove = !isMove
        showChildController(shouldMove: isMove)
    }
    
    func showSpaceshipBuilderController() {
        let spaceshipBuilder = SpaceshipBuilderController()
        present(spaceshipBuilder, animated: true)
    }
}
