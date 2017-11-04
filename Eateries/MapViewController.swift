//
//  MapViewController.swift
//  Eateries
//
//  Created by Aleksey Kabishau on 1103..17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    var restaurant: Restaurant!

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // instance of Core Location Geocoder Class
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location) { (placemarks, error) in
            guard error == nil else { return }
            guard let placemarks = placemarks else { return }
            let placemark = placemarks.first!
            
            // instance of MKPointAnnotation Class - pin on map
            let annotation = MKPointAnnotation()
            annotation.title = self.restaurant.name
            annotation.subtitle = self.restaurant.type
            
            guard let location = placemark.location else { return }
            annotation.coordinate = location.coordinate
            // presenting on the map
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
            
        }

    }

}
