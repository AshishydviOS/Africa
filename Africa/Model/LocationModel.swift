//
//  LocationModel.swift
//  Africa
//
//  Created by Ashish Yadav on 10/05/22.
//

import Foundation
import MapKit

struct NationParkLocation: Codable, Identifiable {
    let id : String
    let name : String
    let image : String
    let latitude : Double
    let longitude : Double
    
    //Computed Property
    var location : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude,
                               longitude: longitude)
    }
}
