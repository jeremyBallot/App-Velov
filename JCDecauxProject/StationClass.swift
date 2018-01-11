//
//  StationClass.swift
//  jcDecauxProject
//
//  Created by jeremy ballot on 10/07/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation

import MapKit


struct GlobalArrayStationList {
    static var globalArrayStationList = [Station]()
}

class Station: NSObject, MKAnnotation {
    //static var countStation : Int = 0
    //static var listStation = [Station]()
    var title: String?
    var subtitle: String?
    var number : String?
//    var bikeStands : Int?
//    var bikeAvailable : Int?
    var latitude: Double
    var longitude:Double
    var imageBike: UIImage!
    var terminalBike : UIImage!
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        //Station.countStation += 1
        //Station.listStation.append(Station)
        super.init()
    }
  

    
}
