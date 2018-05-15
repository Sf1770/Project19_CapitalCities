//
//  Capital.swift
//  Project19
//
//  Created by Sabrina Fletcher on 5/10/18.
//  Copyright © 2018 Sabrina Fletcher. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D, subtitle: String){
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
    

}
