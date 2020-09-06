import UIKit

class BaseViewCell: UICollectionViewCell {
    var data: BaseViewData? {
        didSet {
            guard let data = data else { return }
            cellButton.setTitle(data.text, for: .normal)
            cellButton.setImage(data.image, for: .normal)
        }
    }
    // MARK: - Button Settings
    let cellButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 35
        
        return btn
    }()
    // MARK: - Add button
    let addButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.backgroundColor = UIColor(red: 255/255, green: 190/255, blue: 110/255, alpha: 1)
        btn.layer.cornerRadius = 40
        btn.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("＋", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Futura", size: 40)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        
        return btn
    }()
    // MARK: - Init contentView
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [cellButton, addButton].forEach( { contentView.addSubview($0) })
        
        cellButton.topAnchor.constraint(equalTo: contentView.topAnchor,
                                        constant: 5).isActive = true
        cellButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                            constant: 5).isActive = true
        cellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                             constant: -5).isActive = true
        cellButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                           constant: -85).isActive = true
        
        addButton.topAnchor.constraint(equalTo: contentView.topAnchor,
                                        constant: 0).isActive = true
        addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                            constant: 85).isActive = true
        addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                             constant: 0).isActive = true
        addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                           constant: -85).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented CustomCell")
    }
}
