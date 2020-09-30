import UIKit
import MapKit

class SpaceMapController: UIViewController {
    let locationManager = CLLocationManager()
    var userPinView: MKAnnotationView!
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.mapType = .standard
        map.isRotateEnabled = false
        map.showsUserLocation = true
        
        return map
    }()
    
    let locationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(fectchLocation), for: .touchUpInside)
        btn.setImage(UIImage(systemName: "location.circle"), for: .normal)
        btn.setImage(UIImage(systemName: "location.circle.fill"), for: .highlighted)
        btn.tintColor = UIColor.white.withAlphaComponent(0.5)
        btn.contentEdgeInsets = UIEdgeInsets(top: -1, left: -1, bottom: -1, right: -1)
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.imageView?.contentMode = .scaleAspectFill
        
        return btn
    }()
    
    @objc func fectchLocation() {
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 2500, longitudinalMeters: 2500)
            mapView.setRegion(viewRegion, animated: true)
        }
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 16/255, green: 16/255, blue: 16/255, alpha: 1)
        label.text = "Space Map"
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    let backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        btn.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
        btn.setImage(UIImage(systemName: "multiply.circle.fill"), for: .highlighted)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SpaceMapController - init")
        
        [mapView, topLabel, backButton, locationButton].forEach({ view.addSubview($0) })
        mapView.topAnchor.constraint(equalTo: topLabel.bottomAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        backButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        backButton.centerYAnchor.constraint(equalTo: topLabel.centerYAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        locationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        locationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -18).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        locationButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    deinit {
        print("SpaceMapController - deinit")
    }
}

extension SpaceMapController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
}
