import UIKit

// MARK: - ChatViewCell
class ChatViewCell: UITableViewCell {
    let messageText = UILabel()
    let messageLabel = UIView()
    var isIncoming: Bool! {
        didSet {
            if isIncoming {
                messageText.topAnchor.constraint(equalTo: topAnchor,
                                               constant: 32).isActive = true
                messageText.rightAnchor.constraint(equalTo: rightAnchor,
                                                constant: -32).isActive = true
                messageText.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                  constant: -32).isActive = true
                messageText.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
            } else {
                messageText.topAnchor.constraint(equalTo: topAnchor,
                                               constant: 32).isActive = true
                messageText.leftAnchor.constraint(equalTo: leftAnchor,
                                                 constant: 32).isActive = true
                messageText.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                    constant: -32).isActive = true
                messageText.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
            }
        }
    }
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [messageLabel, messageText].forEach({ addSubview($0) })
        
        messageText.translatesAutoresizingMaskIntoConstraints = false
        messageText.numberOfLines = 0
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.backgroundColor = .darkGray
        messageLabel.layer.cornerRadius = 16
        
        messageLabel.topAnchor.constraint(equalTo: messageText.topAnchor, constant: -16).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: messageText.leftAnchor, constant: -16).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: messageText.rightAnchor, constant: 16).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: messageText.bottomAnchor, constant: 16).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
