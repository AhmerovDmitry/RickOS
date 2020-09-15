import UIKit

class DetailPopController: UIViewController {
    let data = [
        DetailPopData(text: "Memory"),
        DetailPopData(text: "Cloning"),
        DetailPopData(text: "Call Jessica"),
        DetailPopData(text: "..."),
        DetailPopData(text: "Chat Rick")
    ]
    // MARK: - collectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(DetailCustomCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .clear
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailPopController - init")
        
        self.view.frame = CGRect(
            x: 7,
            y: 368 * 2,
            width: 400,
            height: 370
        )
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 40
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    deinit {
        print("DetailPopController - deinit")
    }
}
