//
//  MapViewController.swift
//  Swapgesture
//
//  Created by Kumari Mansi on 16/01/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MKMapView(frame: view.bounds)
        view.addSubview(mapView)
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.33182, longitude: -122.03118)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Apple Campus, Cupertino, CA 95014, USA"
        mapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    

   

}
