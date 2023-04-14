//
//  ViewController.swift
//  Custom-Pin-View
//
//  Created by Vinayak Nagaraj on 22/03/23.
//

import UIKit
import MapKit
import CoreLocation

class CustomPointAnnotation: MKPointAnnotation {
    var imageName: String!
}

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let map = MKMapView()
    let locationManager = CLLocationManager()
    
    let coordinate1 = CLLocationCoordinate2D(latitude: 19.01722, longitude: 72.85656)
    let coordinate2 = CLLocationCoordinate2D(latitude: 19.01757, longitude: 72.85623)
    let coordinate3 = CLLocationCoordinate2D(latitude: 19.01784, longitude: 72.85587)
    let coordinate4 = CLLocationCoordinate2D(latitude: 19.01767, longitude: 72.85556)
    let coordinate5 = CLLocationCoordinate2D(latitude: 19.01798, longitude: 72.85611)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.showsUserLocation = true
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        view.addSubview(map)
        map.frame = view.bounds
        map.setRegion(MKCoordinateRegion(center: coordinate2, span: MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.0005)), animated: false)
        map.delegate = self
        addCustomPin()
        // Do any additional setup after loading the view.
    }
    
    private func addCustomPin() {
        let pin1 = createCustomAnnotation(title: "Smart Punk", subtitle: "Collect Them", coordinate: coordinate1, imageName: "image1")
        let pin2 = createCustomAnnotation(title: "TPunk", subtitle: "Collect Them", coordinate: coordinate2, imageName: "image2")
        let pin3 = createCustomAnnotation(title: "Merge", subtitle: "Collect Them", coordinate: coordinate3, imageName: "image3")
        let pin4 = createCustomAnnotation(title: "CryptoPunk #5822", subtitle: "Collect Them", coordinate: coordinate4, imageName: "image4")
        let pin5 = createCustomAnnotation(title: "Beeple’s HUMAN ONE", subtitle: "Collect Them", coordinate: coordinate5, imageName: "image5")

        map.addAnnotations([pin1, pin2, pin3, pin4, pin5])
    }

    
    private func createCustomAnnotation(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, imageName: String) -> CustomPointAnnotation {
            let annotation = CustomPointAnnotation()
            annotation.title = title
            annotation.subtitle = subtitle
            annotation.coordinate = coordinate
            annotation.imageName = imageName
            return annotation
        }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation),
              let customAnnotation = annotation as? CustomPointAnnotation else {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
            let button = UIButton(type: .roundedRect)
            annotationView?.rightCalloutAccessoryView = button
            button.setTitle("View", for: .normal)
            button.frame = CGRect(x: 100, y: 0, width: 50, height: 40)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: customAnnotation.imageName)
        
        return annotationView
    }


    
    @objc func buttonTapped() {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "NextViewController"))!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }
}

