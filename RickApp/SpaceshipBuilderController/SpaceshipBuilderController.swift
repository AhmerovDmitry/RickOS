import UIKit

class SpaceshipBuilderController: UIViewController {
    weak var delegate: BaseViewControllerDelegate?
    var spaceship = SpaceshipBuilderModel()
    
    let wing = UISegmentedControl(items: ["-", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
    let cockpit = UISegmentedControl(items: ["-", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
    let gun = UISegmentedControl(items: ["-", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
    let wingsLabel = UILabel()
    let cockpitsLabel = UILabel()
    let gunsLabel = UILabel()
    
    let imageStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alignment = .center
        sv.axis = .vertical
        sv.spacing = 25
        
        return sv
    }()
    
    let builderStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 5
        
        return sv
    }()
    
    let saveButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        btn.setTitle("Save", for: .normal)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 25
        btn.addTarget(self, action: #selector(saveSpaceship), for: .touchUpInside)
        
        return btn
    }()
    
    @objc func saveSpaceship() {
        if spaceship.wing.image == nil || spaceship.cockpit.image == nil || spaceship.gun.image == nil {
            alert()
        } else {
            let spaceshipImage = compositeImages(images: [spaceship.wing.image!, spaceship.cockpit.image!, spaceship.gun.image!])
            delegate?.update(image: spaceshipImage)
            dismiss(animated: true, completion: nil)
        }
    }
    
    let randomButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        btn.backgroundColor = .lightGray
        btn.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        btn.setImage(UIImage(systemName: "questionmark.circle.fill"), for: .highlighted)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(randomSpaceship), for: .touchUpInside)
        
        return btn
    }()
    
    @objc func randomSpaceship() {
        wing.selectedSegmentIndex = Int.random(in: 1...10)
        cockpit.selectedSegmentIndex = Int.random(in: 1...10)
        gun.selectedSegmentIndex = Int.random(in: 1...10)
        changeWing()
        changeCockpit()
        changeGun()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SpaceshipBuilderController - init")
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundChat")!)
        wing.selectedSegmentIndex = 0
        cockpit.selectedSegmentIndex = 0
        gun.selectedSegmentIndex = 0
        
        view.addSubview(imageStackView)
        //MARK: - Top Stack View
        [wingsLabel, wing, cockpitsLabel, cockpit, gunsLabel, gun].forEach({ obj in
            builderStackView.addArrangedSubview(obj)
        })
        //MARK: - Mid Stack View
        [spaceship.cockpit, spaceship.gun].forEach({ obj in
            spaceship.wing.addSubview(obj)
            obj.translatesAutoresizingMaskIntoConstraints = false
        })
        //MARK: - All Stack View
        [builderStackView, spaceship.wing, saveButton].forEach({ obj in
            imageStackView.addArrangedSubview(obj)
            obj.translatesAutoresizingMaskIntoConstraints = false
            imageStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            imageStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            imageStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
            
            spaceship.wing.widthAnchor.constraint(equalToConstant: 300).isActive = true
            spaceship.wing.heightAnchor.constraint(equalToConstant: 300).isActive = true
            
            saveButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
            saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        })
        
        view.addSubview(randomButton)
        randomButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        randomButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        randomButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        randomButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        
        //MARK: - Label for UISegmentedControl
        wingsLabel.text = "Wings"
        cockpitsLabel.text = "Cockpit"
        gunsLabel.text = "Gun"
        wingsLabel.textAlignment = .center
        cockpitsLabel.textAlignment = .center
        gunsLabel.textAlignment = .center
        //MARK: - Target for UISegmentedControl
        wing.addTarget(self, action: #selector(changeWing), for: .valueChanged)
        cockpit.addTarget(self, action: #selector(changeCockpit), for: .valueChanged)
        gun.addTarget(self, action: #selector(changeGun), for: .valueChanged)
    }
    
    deinit {
        print("SpaceshipBuilderController - deinit")
    }
}

@objc extension SpaceshipBuilderController {
    func changeWing() {
        switch wing.selectedSegmentIndex {
        case 1:
            spaceship.wing.image = UIImage(named: "Wing0")
        case 2:
            spaceship.wing.image = UIImage(named: "Wing1")
        case 3:
            spaceship.wing.image = UIImage(named: "Wing2")
        case 4:
            spaceship.wing.image = UIImage(named: "Wing3")
        case 5:
            spaceship.wing.image = UIImage(named: "Wing4")
        case 6:
            spaceship.wing.image = UIImage(named: "Wing5")
        case 7:
            spaceship.wing.image = UIImage(named: "Wing6")
        case 8:
            spaceship.wing.image = UIImage(named: "Wing7")
        case 9:
            spaceship.wing.image = UIImage(named: "Wing8")
        case 10:
            spaceship.wing.image = UIImage(named: "Wing9")
        default:
            spaceship.wing.image = nil
        }
    }
    
    func changeCockpit() {
        switch cockpit.selectedSegmentIndex {
        case 1:
            spaceship.cockpit.image = UIImage(named: "Cockpit0")
        case 2:
            spaceship.cockpit.image = UIImage(named: "Cockpit1")
        case 3:
            spaceship.cockpit.image = UIImage(named: "Cockpit2")
        case 4:
            spaceship.cockpit.image = UIImage(named: "Cockpit3")
        case 5:
            spaceship.cockpit.image = UIImage(named: "Cockpit4")
        case 6:
            spaceship.cockpit.image = UIImage(named: "Cockpit5")
        case 7:
            spaceship.cockpit.image = UIImage(named: "Cockpit6")
        case 8:
            spaceship.cockpit.image = UIImage(named: "Cockpit7")
        case 9:
            spaceship.cockpit.image = UIImage(named: "Cockpit8")
        case 10:
            spaceship.cockpit.image = UIImage(named: "Cockpit9")
        default:
            spaceship.cockpit.image = nil
        }
    }
    
    func changeGun() {
        switch gun.selectedSegmentIndex {
        case 1:
            spaceship.gun.image = UIImage(named: "Gun0")
        case 2:
            spaceship.gun.image = UIImage(named: "Gun1")
        case 3:
            spaceship.gun.image = UIImage(named: "Gun2")
        case 4:
            spaceship.gun.image = UIImage(named: "Gun3")
        case 5:
            spaceship.gun.image = UIImage(named: "Gun4")
        case 6:
            spaceship.gun.image = UIImage(named: "Gun5")
        case 7:
            spaceship.gun.image = UIImage(named: "Gun6")
        case 8:
            spaceship.gun.image = UIImage(named: "Gun7")
        case 9:
            spaceship.gun.image = UIImage(named: "Gun8")
        case 10:
            spaceship.gun.image = UIImage(named: "Gun9")
        default:
            spaceship.gun.image = nil
        }
    }
}
extension SpaceshipBuilderController {
    func compositeImages(images: [UIImage]) -> UIImage {
        var compositeImage: UIImage!
        if images.count > 0 {
            let size: CGSize = CGSize(width: images[0].size.width, height: images[0].size.height)
            UIGraphicsBeginImageContext(size)
            for image in images {
                let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                image.draw(in: rect)
            }
            compositeImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        
        return compositeImage
    }
    
    func alert() {
        let alert = UIAlertController(title: "OUCH :(", message: "Select all elements", preferredStyle: .alert)
        let button = UIAlertAction(title: "Select", style: .cancel, handler: nil)
        alert.addAction(button)
        present(alert, animated: true, completion: nil)
    }
}
