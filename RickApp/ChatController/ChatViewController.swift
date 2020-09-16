import UIKit

class ChatViewController: UIViewController {
    var messages: [String] = []
    var rickMessages: [String] = []
    let randomMessages = ["Hello Morty!", "Brrrr", "I'm drink, sorry...", "Who are you?", "This is don'n Rick!"]
    
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
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.cornerRadius = 15
        textView.textColor = .white

        return textView
    }()
    
    let doneButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(done), for: .touchUpInside)
        btn.layer.cornerRadius = 15
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
            }
        }
    }
    
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
        btn.layer.cornerRadius = 15
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
        [tableView, textView, doneButton, topLabel].forEach( { backgroundView.addSubview($0) })
        topLabel.addSubview(backButton)
        
        backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: backgroundView.topAnchor,
                                       constant: 44).isActive = true
        tableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                           constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                            constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor,
                                          constant: -50).isActive = true

        textView.topAnchor.constraint(equalTo: tableView.bottomAnchor,
                                      constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                          constant: 5).isActive = true
        textView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                           constant: -40).isActive = true
        textView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor,
                                         constant: -10).isActive = true

        doneButton.topAnchor.constraint(equalTo: tableView.bottomAnchor,
                                        constant: 10).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                            constant: 379).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                             constant: -5).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor,
                                           constant: -10).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor).isActive = true
        topLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor).isActive = true
        topLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                        constant: 7).isActive = true
        backButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                            constant: 379).isActive = true
        backButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                             constant: -5).isActive = true
        backButton.bottomAnchor.constraint(equalTo: tableView.topAnchor,
                                           constant: -7).isActive = true
    }
    
    deinit {
        print("ChatViewController - deinit")
    }
}
