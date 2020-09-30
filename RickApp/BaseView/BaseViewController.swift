import UIKit

// MARK: - BaseViewController
class BaseViewController: UIViewController {
    // MARK: - Properties
    var isMove = false
    var data = [
        BaseViewData(text: "", image: nil),
        BaseViewData(text: "", image: UIImage(systemName: "person")),
        BaseViewData(text: "", image: UIImage(systemName: "airplane")),
        BaseViewData(text: "", image: UIImage(systemName: "map")),
        BaseViewData(text: "", image: nil)
    ]
    // MARK: - collectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(BaseViewCell.self, forCellWithReuseIdentifier: "cell")

        return cv
    }()
    // MARK: - backgroundView
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundMain")!)
        
        return view
    }()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BaseViewController - init")
        
        view.addSubview(backgroundView)
        backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        backgroundView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    deinit {
        print("BaseViewController - deinit")
    }
}
// MARK: - Delegate method
extension BaseViewController: BaseViewControllerDelegate {
    func update(image: UIImage) {
        data[2].image = image
        collectionView.reloadData()
    }
}
