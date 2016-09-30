//
//  ViewController.swift
//  Map Try Out
//
//  Created by Piktochart-Edsil on 9/28/16.
//  Copyright © 2016 eebasadre.co. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
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

