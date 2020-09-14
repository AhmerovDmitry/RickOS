import UIKit

class ChatViewController: UIViewController {
    var messages: [String] = []
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.register(ChatViewCell.self, forCellReuseIdentifier: "cell")
        
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
    
    var doneButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(done), for: .touchUpInside)
        btn.layer.cornerRadius = 15
        btn.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        btn.tintColor = .white
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.imageView?.contentMode = .scaleAspectFill
        
        return btn
    }()
    
    @objc func done() {
        messages.append(textView.text)
        tableView.reloadData()
        textView.text = ""
        view.endEditing(true)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ChatViewController init")
        registerForKeyboardNotification()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundChat")!)
        

       [tableView, textView, doneButton].forEach( { view.addSubview($0) })
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        tableView.delegate = self
        tableView.dataSource = self

        textView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true

        doneButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 379).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
}
