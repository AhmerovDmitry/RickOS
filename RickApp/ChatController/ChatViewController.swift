import UIKit

class ChatViewController: UIViewController {
    let background: UIView = {
        let img = UIView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundChat")!)
        
        return img
    }()
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.alpha = 0.5
        //tv.backgroundColor = .clear
        tv.backgroundColor = .green
        tv.register(ChatViewCell.self, forCellReuseIdentifier: "cell")
        
        return tv
    }()
    
    let textField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .yellow
        textField.placeholder = "This is textField"
        
        return textField
    }()
    
    let doneButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .red
        btn.setTitle("🔈", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(done), for: .touchUpInside)
        
        return btn
    }()
    
    @objc func done() {
        textField.resignFirstResponder()
    }
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ChatViewController init")
        registerForKeyboardNotification()
        
        view.addSubview(background)
        background.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

       [tableView, textField, doneButton].forEach( { background.addSubview($0) })
        tableView.topAnchor.constraint(equalTo: background.topAnchor, constant: 80).isActive = true
        tableView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -60).isActive = true
        tableView.delegate = self
        tableView.dataSource = self

        textField.topAnchor.constraint(equalTo: background.topAnchor, constant: 686).isActive = true
        textField.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 0).isActive = true
        textField.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: 0).isActive = true
        textField.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: 0).isActive = true

        doneButton.topAnchor.constraint(equalTo: background.topAnchor, constant: 686).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 364).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: 0).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: 0).isActive = true

        print("width - \(doneButton.frame.width)")
        print("height - \(doneButton.frame.height)")
        print("view width - \(view.frame.width)")
        print("view height - \(view.frame.height)")
    }
}
