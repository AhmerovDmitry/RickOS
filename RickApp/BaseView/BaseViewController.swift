import UIKit

// MARK: - BaseViewController
class BaseViewController: UIViewController {
    // MARK: - Properties
    var isMove = false
    var data = [
        BaseViewData(text: "", image: nil),
        BaseViewData(text: "", image: UIImage(named: "avatar")),
        BaseViewData(text: "", image: UIImage(named: "spaceship")),
        BaseViewData(text: "", image: UIImage(named: "map")),
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
    let avatarButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(fetchImage), for: .touchUpInside)
        btn.setTitle("PRESS", for: .normal)
        
        return btn
    }()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BaseViewController - init")
        
        backgroundView.addSubview(avatarButton)
        avatarButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 50).isActive = true
        avatarButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        avatarButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        avatarButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        
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
    func update(avatar: UIImage) {
        data[1].image = avatar
        collectionView.reloadData()
    }
}

@objc extension BaseViewController {
    func fetchImage() {
        let imagePicker = ImagePickerController()
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker, animated: true, completion: nil)
    }
}
