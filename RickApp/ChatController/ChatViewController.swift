import UIKit

class ChatViewController: UIViewController {
    let messages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.register(ChatViewCell.self, forCellReuseIdentifier: "cell")
        
        return tv
    }()
    
    let textView: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isScrollEnabled = true
        textField.backgroundColor = .yellow

        return textField
    }()
    
    var doneButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .red
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(done), for: .touchUpInside)
        
        return btn
    }()
    
    @objc func done() {
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

        textView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        doneButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 364).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
