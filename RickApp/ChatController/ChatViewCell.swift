import UIKit

// MARK: - ChatViewCell
class ChatViewCell: UITableViewCell {
    let messageText = UILabel()
    let messageLabel = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var isIncoming: Bool! {
        didSet {
            if isIncoming {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
                messageLabel.backgroundColor = .gray
            } else {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
                messageLabel.backgroundColor = .darkGray
            }
        }
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [messageLabel, messageText].forEach({ addSubview($0) })
        
        messageText.translatesAutoresizingMaskIntoConstraints = false
        messageText.numberOfLines = 0
        messageText.textColor = .white
        messageText.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        messageText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        messageText.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        messageLabel.layer.cornerRadius = 16
        messageLabel.topAnchor.constraint(equalTo: messageText.topAnchor, constant: -16).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: messageText.leftAnchor, constant: -16).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: messageText.rightAnchor, constant: 16).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: messageText.bottomAnchor, constant: 16).isActive = true
        
        leadingConstraint = messageText.leftAnchor.constraint(equalTo: leftAnchor, constant: 32)
        leadingConstraint.isActive = false
        trailingConstraint = messageText.rightAnchor.constraint(equalTo: rightAnchor, constant: -32)
        trailingConstraint.isActive = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
