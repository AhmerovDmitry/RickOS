import UIKit

class SpaceshipBuilderController: UIViewController {
    var spaceship = SpaceshipBuilderModel()
    
    let wing = UISegmentedControl(items: ["1", "2", "3", "4", "5"])
    let cockpit = UISegmentedControl(items: ["1", "2", "3", "4", "5"])
    let engine = UISegmentedControl(items: ["1", "2", "3"])
    let gun = UISegmentedControl(items: ["1", "2"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundChat")!)
    
        [spaceship.wing, spaceship.cockpit, spaceship.engine, spaceship.gun].forEach({ obj in
            view.addSubview(obj)
            
            obj.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            obj.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            obj.widthAnchor.constraint(equalToConstant: 90).isActive = true
            obj.heightAnchor.constraint(equalToConstant: 90).isActive = true
            
            obj.translatesAutoresizingMaskIntoConstraints = false
        })
        
        
        view.addSubview(wing)
        
        [wing, cockpit, engine, gun].forEach({ obj in
            view.addSubview(obj)
            obj.translatesAutoresizingMaskIntoConstraints = false
            
            obj.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            obj.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            obj.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        })
        
        wing.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        cockpit.topAnchor.constraint(equalTo: wing.bottomAnchor, constant: 10).isActive = true
        engine.topAnchor.constraint(equalTo: cockpit.bottomAnchor, constant: 10).isActive = true
        gun.topAnchor.constraint(equalTo: engine.bottomAnchor, constant: 10).isActive = true
        
        wing.addTarget(self, action: #selector(changeWing), for: .valueChanged)
        cockpit.addTarget(self, action: #selector(changeCockpit), for: .valueChanged)
        engine.addTarget(self, action: #selector(changeEngine), for: .valueChanged)
        gun.addTarget(self, action: #selector(changeGun), for: .valueChanged)
    }
}

@objc extension SpaceshipBuilderController {
    func changeWing() {
        switch wing.selectedSegmentIndex {
        case 0:
            spaceship.wing.image = UIImage(named: "Wing1")
        case 1:
            spaceship.wing.image = UIImage(named: "Wing2")
        case 2:
            spaceship.wing.image = UIImage(named: "Wing3")
        case 3:
            spaceship.wing.image = UIImage(named: "Wing4")
        case 4:
            spaceship.wing.image = UIImage(named: "Wing5")
        default: break
        }
    }
    
    func changeCockpit() {
        switch cockpit.selectedSegmentIndex {
        case 0:
            spaceship.cockpit.image = UIImage(named: "Cockpit1")
        case 1:
            spaceship.cockpit.image = UIImage(named: "Cockpit2")
        case 2:
            spaceship.cockpit.image = UIImage(named: "Cockpit3")
        case 3:
            spaceship.cockpit.image = UIImage(named: "Cockpit4")
        case 4:
            spaceship.cockpit.image = UIImage(named: "Cockpit5")
        default: break
        }
    }
    
    func changeEngine() {
        switch engine.selectedSegmentIndex {
        case 0:
            spaceship.engine.image = UIImage(named: "Engine1")
        case 1:
            spaceship.engine.image = UIImage(named: "Engine2")
        case 2:
            spaceship.engine.image = UIImage(named: "Engine3")
        default: break
        }
    }
    
    func changeGun() {
        switch gun.selectedSegmentIndex {
        case 0:
            spaceship.gun.image = UIImage(named: "Gun1")
        case 1:
            spaceship.gun.image = UIImage(named: "Gun2")
        default: break
        }
    }
}
