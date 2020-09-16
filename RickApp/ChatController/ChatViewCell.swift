import UIKit

class ChatViewCell: UITableViewCell {
    let cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        return label
    }()
    
    let cellText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .clear
        
        return label
    }()
    
    let cellRandomMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .clear
        
        return label
    }()
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellLabel)
        cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                       constant: 8).isActive = true
        cellLabel.leftAnchor.constraint(greaterThanOrEqualTo: contentView.leftAnchor,
                                        constant:UIScreen.main.bounds.width / 4).isActive = true
        cellLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,
                                         constant: -8).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                          constant: -8).isActive = true
        cellLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        
        cellLabel.addSubview(cellText)
        cellText.topAnchor.constraint(equalTo: cellLabel.topAnchor, constant: 0).isActive = true
        cellText.leftAnchor.constraint(equalTo: cellLabel.leftAnchor, constant: 10).isActive = true
        cellText.rightAnchor.constraint(equalTo: cellLabel.rightAnchor, constant: -10).isActive = true
        cellText.bottomAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
