import UIKit

// MARK: - BaseViewController
class BaseViewController: UIViewController {
    // MARK: - Properties
    let cellCornerRadius: CGFloat = 40
    var isMove = false
    let data = [
        BaseViewData(text: "", image: nil),
        BaseViewData(text: "", image: UIImage(named: "mortyImage")),
        BaseViewData(text: "", image: UIImage(named: "rocketImage")),
        BaseViewData(text: "", image: UIImage(named: "blasterImage")),
        BaseViewData(text: "", image: nil)
    ]
    // MARK: - collectionView
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(BaseViewCell.self, forCellWithReuseIdentifier: "cell")

        return cv
    }()
    // MARK: - backgroundImage
    fileprivate let backgroundImage: UIImageView = {
        var img = UIImageView()
        img = UIImageView(image: #imageLiteral(resourceName: "background_main"))
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
                
        [backgroundImage, collectionView].forEach { view.addSubview($0) }
        
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

