//
//  ViewController.swift
//  Adding User Annotations To Maps
//
//  Created by sophia on 6/20/19.
//  Copyright © 2019 fyunka. All rights reserved.
//

import UIKit
import MapKit

final class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet private var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Brooklyn Bridge coordinates -> 40.706606, -73.996746
        
        let latitude: CLLocationDegrees = 40.706606
        
        let longitude: CLLocationDegrees = -73.996746
        
        let lanDelta: CLLocationDegrees = 0.05
        
        let lonDelta: CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: lanDelta, longitudeDelta: lonDelta)
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        map.setRegion(region, animated: true)
        
        // Adding User Annotations To Map
        let  annotation = MKPointAnnotation()
        
        annotation.title = "Brooklyn Bridge"
        
        annotation.subtitle = "One day I'll go here..."
        
        annotation.coordinate = coordinates
        
        map.addAnnotation(annotation)
        
        // To allow user add annotation to the map -> recognizing a long press in the apps
        // adding colon after longpress makes sure that info get sent to gestureRecognizer and we can recieve it -> changed to #selector(ViewController.longpress(gestureRecognizer:))
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
            
        uilpgr.minimumPressDuration = 2 // in seconds
            
        map.addGestureRecognizer(uilpgr)
        
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "New place"
        
        annotation.subtitle = "Maybe I'll go here too..."
        
        map.addAnnotation(annotation)
        
    }
    
}
