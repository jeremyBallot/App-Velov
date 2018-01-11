//
//  MapViewController.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import UIKit
import MapKit

//var globalArrayStationList = [Station]()
class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let api = API()
    let manager = CLLocationManager()
    //let initialLocation = CLLocation(latitude: 45.74574, longitude: 4.842117)
    //let regionRadius: CLLocationDistance = 100
    //public var globalArrayStationList = [Station]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

        //centerMapOnLocation(location: initialLocation)
        // Recupération des annotations
        let annotations = getMapAnnotations()
        // Ajout des points sur la map
        mapView.addAnnotations(annotations)
        mapView.delegate = self
        var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        for annotation in annotations {
            points.append(annotation.coordinate)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
//        mapView.setRegion(coordinateRegion, animated: true)
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let mylocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        //let regionRadius: CLLocationDistance = 100
        let region : MKCoordinateRegion = MKCoordinateRegionMake(mylocation, span)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
        
    }
    
    func getMapAnnotations() -> [Station] {
        var annotations:Array = [Station]()
        // lecture via plist des stations
        var stations: NSArray?
        if let path = Bundle.main.path(forResource: "InitlocaLocationBike", ofType: "plist") {
            stations = NSArray(contentsOfFile: path)
        }
        if let items = stations {
            for item in items {
                let lat = (item as AnyObject).value(forKey: "latitude") as! Double
                let long = (item as AnyObject).value(forKey: "longitude")as! Double
                let annotation = Station(latitude: lat, longitude: long)
                annotation.title = (item as AnyObject).value(forKey: "name") as? String
                annotation.subtitle = (item as AnyObject).value(forKey: "address") as? String
                let number = ((item as AnyObject).value(forKey: "number") as! NSNumber)
                annotation.number = number.stringValue
                
                annotations.append(annotation)
                GlobalArrayStationList.globalArrayStationList.append(annotation)
                
            }
        }
        
        return annotations
    }
    
    func mapView(_ mapView: MKMapView,
                 didSelect view: MKAnnotationView)
    {
        if view.annotation is MKUserLocation
        {
            return
        }
        let Station = view.annotation as! Station
        let views = Bundle.main.loadNibNamed("StationLive", owner: nil, options: nil)
        let calloutView = views?[0] as! CustomCalloutView
        self.api.stationCkeck(valueStation:  Station.number! , completionHandler: {dict in DispatchQueue.main.async {
            //if dict["success"] as! Bool != true {
            if let number = dict!["available_bikes"] as? Int {
                calloutView.numberBikeStation.text = "\(number)"
            }
            else{
                calloutView.numberTerminalStation.text = "error_loading".translate
            }
            if let number = dict!["available_bike_stands"] as? Int {
                calloutView.numberTerminalStation.text = "\(number)"
            }
            else{
                calloutView.numberTerminalStation.text = "error_loading".translate
            }
            calloutView.stationName.text = Station.title
            
            if Station.subtitle == "" {
                calloutView.stationAddress.text = "unknown_address".translate
            }
            else {
                calloutView.stationAddress.text = Station.subtitle
            }
            
            calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
            view.addSubview(calloutView)
            mapView.setCenter((view.annotation?.coordinate)!, animated: true)
            
            //
            }})
        
        
        
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation
        {
            return nil
        }
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        if annotationView == nil{
            annotationView = AnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = false
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "VelovAnnotation")
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.isKind(of: AnnotationView.self)
        {
            for subview in view.subviews
            {
                subview.removeFromSuperview()
            }
        }
    }
    

  
}
