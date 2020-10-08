import UIKit

extension DetailPopController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize()
        switch indexPath.row {
        case 3: cellSize = CGSize(width: 220, height: 100)
        default: cellSize = CGSize(width: 100, height: 100)
        }

        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailCustomCell
        cell.data = self.data[indexPath.row]
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 20
        
        switch indexPath.row {
        case 0 : cell.cellButton.addTarget(self, action: #selector(memoryButton), for: .touchUpInside)
        case 1 : cell.cellButton.addTarget(self, action: #selector(cloningButton), for: .touchUpInside)
        case 2 : cell.cellButton.addTarget(self, action: #selector(callJessicaButton), for: .touchUpInside)
        case 3 : cell.cellButton.addTarget(self, action: #selector(unknownButton), for: .touchUpInside)
        case 4 : cell.cellButton.addTarget(self, action: #selector(chatRickButton), for: .touchUpInside)
        default: break
        }
        
        return cell
    }
}

// MARK: - @objc extension for button
@objc extension DetailPopController {
    func memoryButton() {
        if let url = URL(string:UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    func cloningButton() {
    }
    func callJessicaButton() {
        guard let url = URL(string: "tel://+79834102463") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    func unknownButton() {
    }
    func chatRickButton() {
        let chatView = ChatViewController()
        chatView.modalPresentationStyle = .overFullScreen
        present(chatView, animated: true)
    }
}
