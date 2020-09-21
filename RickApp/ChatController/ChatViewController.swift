import UIKit

class ChatViewController: UIViewController {
    var messages: [String] = []
    let randomMessages = [
        "Sorry, I can’t chat right now.",
        "I’m on my way.",
        "I’ll text you right back",
        "Can I text you later?",
        "I’ll text when I get home.",
        "I’m busy.",
        "Hey, love u2... but later! ;)",
        "I've been through the desert on a horse with no name… & I can't remember your name! So… text me maybe!?"
    ]
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundChat")!)
        
        return view
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44.0
        tv.register(ChatViewCell.self, forCellReuseIdentifier: "cell")
        tv.backgroundColor = .clear
        tv.showsVerticalScrollIndicator = false
        
        return tv
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 17)
        textView.textColor = .white

        return textView
    }()
    
    let textViewLabel: UILabel = {
        let textViewLabel = UILabel()
        textViewLabel.translatesAutoresizingMaskIntoConstraints = false
        textViewLabel.backgroundColor = .clear
        textViewLabel.layer.borderWidth = 1
        textViewLabel.layer.borderColor = UIColor.white.cgColor
        textViewLabel.layer.cornerRadius = 18
        
        return textViewLabel
    }()
    
    let doneButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(done), for: .touchUpInside)
        btn.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        btn.tintColor = .white
        btn.contentEdgeInsets = UIEdgeInsets(top: -1, left: -1, bottom: -1, right: -1)
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.imageView?.contentMode = .scaleAspectFill
        
        return btn
    }()
    
    @objc func done() {
        messages.append(textView.text)
        textView.text = ""
        view.endEditing(true)
        doneButton.isEnabled = false
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        DispatchQueue.global().async {
            sleep(2)
            self.messages.append(self.randomMessages[Int.random(in: 0...self.randomMessages.count - 1)])
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.scrollToRow(at: IndexPath(row: self.messages.count - 1, section: 0),
                                           at: .bottom,
                                           animated: true)
            }
        }
    }
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.backgroundColor = .clear
        
        return label
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        label.text = "Rick Sanchez"
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    let backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        btn.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
        btn.tintColor = .white
        btn.contentEdgeInsets = UIEdgeInsets(top: -1, left: -1, bottom: -1, right: -1)
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.imageView?.contentMode = .scaleAspectFill
        
        return btn
    }()
    
    @objc func back() {
        dismiss(animated: true)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ChatViewController - init")
        registerForKeyboardNotification()
        doneButton.isEnabled = false
        
        tableView.delegate = self
        tableView.dataSource = self
        textView.delegate = self
        
        view.addSubview(backgroundView)
        [tableView, topLabel, bottomLabel].forEach({ backgroundView.addSubview($0) })
        topLabel.addSubview(backButton)
        [textViewLabel, textView, doneButton].forEach({ bottomLabel.addSubview($0) })

        backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        topLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor).isActive = true
        topLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        backButton.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -10).isActive = true
        backButton.centerYAnchor.constraint(equalTo: topLabel.centerYAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        tableView.topAnchor.constraint(equalTo: topLabel.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomLabel.topAnchor).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: -10).isActive = true
        bottomLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor).isActive = true
        bottomLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor).isActive = true
        bottomLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
        
        textView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 16).isActive = true
        textView.rightAnchor.constraint(equalTo: doneButton.leftAnchor, constant: -16).isActive = true
        textView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10).isActive = true
        textView.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        
        textViewLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 0).isActive = true
        textViewLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: -6).isActive = true
        textViewLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: 6).isActive = true
        textViewLabel.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: 0).isActive = true

        doneButton.rightAnchor.constraint(equalTo: bottomLabel.rightAnchor, constant: -10).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: bottomLabel.bottomAnchor, constant: -10).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    deinit {
        print("ChatViewController - deinit")
    }
}
