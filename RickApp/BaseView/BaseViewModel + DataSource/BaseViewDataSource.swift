import UIKit

// MARK: - UICollectionViewDataSource
extension BaseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize()
        switch indexPath.item {
        case 0, 4: cellSize = CGSize(width: 160, height: 160)
        default: cellSize = CGSize(width: 80, height: 160)
        }
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BaseViewCell
        cell.data = self.data[indexPath.item]
        cell.layer.cornerRadius = 40
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        
        switch indexPath.item {
        case 0:
            cell.addButton.isHidden = false
            cell.cellButton.isHidden = true
            cell.backgroundColor = UIColor(red: 77/255, green: 177/255, blue: 177/255, alpha: 1)
            cell.addButton.removeTarget(nil, action: nil, for: .allEvents)
        case 1:
            cell.addButton.isHidden = true
            cell.cellButton.isHidden = false
            cell.backgroundColor = UIColor.white
            cell.cellButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.cellButton.addTarget(self, action: #selector(showDetailController), for: .touchUpInside)
        case 2:
            cell.addButton.isHidden = true
            cell.cellButton.isHidden = false
            cell.backgroundColor = UIColor.white
            cell.cellButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.cellButton.addTarget(self, action: #selector(showSpaceshipBuilderController), for: .touchUpInside)
        case 3:
            cell.addButton.isHidden = true
            cell.cellButton.isHidden = false
            cell.backgroundColor = UIColor.white
            cell.cellButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.cellButton.addTarget(self, action: #selector(showSpaceMapController), for: .touchUpInside)
        case 4:
            cell.addButton.isHidden = false
            cell.cellButton.isHidden = true
            cell.backgroundColor = UIColor(red: 77/255, green: 177/255, blue: 177/255, alpha: 1)
        default: break
        }
        
        return cell
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
        spaceshipBuilder.modalPresentationStyle = .overFullScreen
        spaceshipBuilder.delegate = self
        present(spaceshipBuilder, animated: true)
    }
    
    func showSpaceMapController() {
        let spaceMapController = SpaceMapController()
        spaceMapController.modalPresentationStyle = .overFullScreen
        present(spaceMapController, animated: true)
    }
}
