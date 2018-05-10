//
//  ViewController.swift
//  Project19
//
//  Created by Sabrina Fletcher on 5/10/18.
//  Copyright © 2018 Sabrina Fletcher. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        let portland = Capital(title: "Portland", coordinate: CLLocationCoordinate2D(latitude: 45.5231, longitude: -122.67665), info: "Hipster Homeland")
        let nyc = Capital(title: "New York City", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), info: "Known as the Big Apple. \n Birthplace of Hip-Hop.")
        let houston = Capital(title: "Houston", coordinate: CLLocationCoordinate2D(latitude: 29.7604, longitude: -95.3698), info: "Birthplace of Beyonce!")
        
        
        
      mapView.addAnnotations([london,oslo,paris,rome,washington,portland, nyc, houston])
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //1, define a reuse identifier. This is a string that will be used to ensure we reuse annotation view as much as possible
        let identifier = "Capital"
        
        //2, checks to see whether the annotation we're creating a view for is 1 of our Capital objects
        if annotation is Capital{
            //3, Try to dequeue an annotation view from the map view's pool of unused views
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                //4, If not able to find a reusable view, creates a new one using MKPinAnnotationView and set is canShowCallout property to true, triggers the popup with the city name
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                
                //5, creates a UIButton using built-in .detailDisclosure type(aka small blue "i" symbol with a circle around it)
                let btn = UIButton(type: .detailDisclosure)
                annotationView!.rightCalloutAccessoryView = btn
            } else{
                //6, if it can reuse a view, update that view to use a different annotation
                annotationView!.annotation = annotation
            }
            return annotationView
        }
        //7, returns nil if annotation isnt from a capital city
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let capital = view.annotation as! Capital
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac,animated: true)
    }


}

