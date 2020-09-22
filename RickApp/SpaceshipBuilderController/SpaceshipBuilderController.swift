import UIKit

class SpaceshipBuilderController: UIViewController {
    var spaceship = SpaceshipBuilderModel()
    
    let wing = UISegmentedControl(items: ["-", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
    let cockpit = UISegmentedControl(items: ["-", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
    let gun = UISegmentedControl(items: ["-", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
    
    let wingsLabel = UILabel()
    let cockpitsLabel = UILabel()
    let gunsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundChat")!)
    
        [spaceship.wing, spaceship.cockpit, spaceship.gun].forEach({ obj in
            view.addSubview(obj)
            
            obj.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            obj.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            obj.widthAnchor.constraint(equalToConstant: 300).isActive = true
            obj.heightAnchor.constraint(equalToConstant: 300).isActive = true
            
            obj.translatesAutoresizingMaskIntoConstraints = false
        })
        
        
        view.addSubview(wing)
        
        [wing, cockpit, gun, wingsLabel, cockpitsLabel, gunsLabel].forEach({ obj in
            view.addSubview(obj)
            obj.translatesAutoresizingMaskIntoConstraints = false
            
            obj.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            obj.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            obj.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        })
        
        wingsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        wing.topAnchor.constraint(equalTo: wingsLabel.bottomAnchor, constant: 5).isActive = true
        
        cockpitsLabel.topAnchor.constraint(equalTo: wing.bottomAnchor, constant: 15).isActive = true
        cockpit.topAnchor.constraint(equalTo: cockpitsLabel.bottomAnchor, constant: 5).isActive = true
        
        gunsLabel.topAnchor.constraint(equalTo: cockpit.bottomAnchor, constant: 15).isActive = true
        gun.topAnchor.constraint(equalTo: gunsLabel.bottomAnchor, constant: 5).isActive = true
        
        wingsLabel.text = "Wings"
        cockpitsLabel.text = "Cockpits"
        gunsLabel.text = "Guns"
        wingsLabel.textAlignment = .center
        cockpitsLabel.textAlignment = .center
        gunsLabel.textAlignment = .center
                
        wing.addTarget(self, action: #selector(changeWing), for: .valueChanged)
        cockpit.addTarget(self, action: #selector(changeCockpit), for: .valueChanged)
        gun.addTarget(self, action: #selector(changeGun), for: .valueChanged)
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
