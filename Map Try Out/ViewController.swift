//
//  ViewController.swift
//  Map Try Out
//
//  Created by Piktochart-Edsil on 9/28/16.
//  Copyright © 2016 eebasadre.co. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var latitude:CLLocationDegrees = 5.285153
        var longitude:CLLocationDegrees = 100.456238
        
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        
        annotation.title = "Penang, Malaysia"
        annotation.subtitle = "Where Am I now!"
        
        map.addAnnotation(annotation)
        
        var longPressGesture = UILongPressGestureRecognizer( target: self, action: "action:")
        longPressGesture.minimumPressDuration = 2
        
        map.addGestureRecognizer(longPressGesture)
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations:[CLLocation]) {
        print(locations)
        
        var userLocation: CLLocation = locations[0]
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.05
        var longDelta:CLLocationDegrees = 0.05
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        self.map.setRegion(region, animated: true)
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        print("Gesture Recognized")
        
        var touchPoint = gestureRecognizer.locationInView(self.map)
        let newCoordinate: CLLocationCoordinate2D = self.map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        
        annotation.title = "Bayan Baru, Penang"
        annotation.subtitle = "I touch the Land!"
        
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

