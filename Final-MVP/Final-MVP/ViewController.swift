 


//
//  ViewController.swift
//  Custom-Pin-View
//
//  Created by Vinayak Nagaraj on 22/03/23.
//

import UIKit
import MapKit
import CoreLocation

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
    
    private func addCustomPin(){
        let pin1 = MKPointAnnotation()
        pin1.coordinate = coordinate1
        pin1.title = "Smart Punk"
        pin1.subtitle = "Collect Them"
        let pin2 = MKPointAnnotation()
        pin2.coordinate = coordinate2
        pin2.title = "TPunk"
        pin2.subtitle = "Collect Them"
        let pin3 = MKPointAnnotation()
        pin3.coordinate = coordinate3
        pin3.title = "Merge"
        pin3.subtitle = "Collect Them"
        let pin4 = MKPointAnnotation()
        pin4.coordinate = coordinate4
        pin4.title = "CryptoPunk #5822"
        pin4.subtitle = "Collect Them"
        let pin5 = MKPointAnnotation()
        pin5.coordinate = coordinate5
        pin5.title = "Beeple’s HUMAN ONE"
        pin5.subtitle = "Collect Them"

        map.addAnnotations([pin1, pin2, pin3, pin4, pin5])
         
        
        
        
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        guard !(annotation is MKUserLocation) else{
            return nil
        }
        var annotationView =  map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
            let button = UIButton(type: .roundedRect)
            annotationView?.rightCalloutAccessoryView = button
            button.setTitle("View", for: .normal)
            button.frame = CGRect(x: 100, y: 0, width: 50, height: 40)
            button.addTarget(self,action: #selector(buttonTapped), for: .touchUpInside)
            view.addSubview(button)
            
            
        }
        else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "Image")
        
        
        return annotationView
    }
    

   
        @objc func buttonTapped() {
           
            let vc = (storyboard?.instantiateViewController(withIdentifier: "NextViewController"))!
            navigationController?.pushViewController(vc,animated: true)
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }




        }
        
        
        
    

    

