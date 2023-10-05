//
//  ViewController.swift
//  Display Location
//
//  Created by yapapp on 21/09/23.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager:CLLocationManager!
    
    var coordinateLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        // use the code for showing latitude and longitute on screen
        
        coordinateLabel = UILabel()
        coordinateLabel.frame  = CGRect(x: 30, y: 100, width: 300, height:50)
        coordinateLabel.backgroundColor = UIColor.blue.withAlphaComponent(0.8)
        coordinateLabel.textColor = UIColor.white.withAlphaComponent(1)
        coordinateLabel.layer.cornerRadius = 5
        coordinateLabel.clipsToBounds = true
        self.mapView.addSubview(coordinateLabel)
        
        // Add Annotation in map
        //Add Another place  of annotation(itechnolab)
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 30.6576, longitude: 76.7271)
        annotation1.title = "Itechnolabs"
        annotation1.subtitle = "Mohali"
        self.mapView.addAnnotation(annotation1 )
        
        //Add Another place  of annotation(CS Software Solution)
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 30.6993, longitude: 76.6916)
        annotation2.title = "CS Software"
        annotation2.subtitle = "Mohali"
        self.mapView.addAnnotation(annotation2)
        
        self.mapView.delegate = self
        
        //Add Another place  of annotation(Chandigarh Bus stand)
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2D(latitude: 30.7161, longitude: 76.7431)
        annotation3.title = "Bus Stand"
        annotation3.subtitle = "Chandigarh"
        self.mapView.addAnnotation(annotation3)
        
        
        // Code is used for when a user tappped on location (latitude)and (longitude)print on console.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mapView.addGestureRecognizer(tapGesture)
        
    }
    // Code is used for when a user tappped on location (latitude)and (longitude)print on console
    @objc func handleTap(_ gestureRecognizer:UITapGestureRecognizer){
        if gestureRecognizer.state == .ended
        {
            let locationInView = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
            let latitude = coordinate.latitude
            let longitude = coordinate.longitude
            coordinateLabel.text = "lat\(latitude),long:\(longitude)"// print the lat and long on label
            print("Tapped at:lattitude\(latitude),long\(longitude)")
            
            //UIView.animate(withDuration: 0.3)
            self.coordinateLabel.alpha = 2.0
        }
        
    }
    // Use for Customise the pin
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {return nil}
        let id = MKMapViewDefaultAnnotationViewReuseIdentifier
        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: id)as? MKMarkerAnnotationView{
            
            if annotation.title == "Itechnolabs"{
                view.titleVisibility = .visible// Set title to be alaways visibale
                view.subtitleVisibility = .visible // Set Subtitle to be alaways visibale
                view.markerTintColor = .blue// background color of the ballon
                //view.glyphImage = UIImage(named: "flowers1")
                return view
            }
            if annotation.title == "CS Software"{
                view.titleVisibility = .visible
                view.subtitleVisibility = .visible
                view.markerTintColor = .black
                return view
                
            }
        }
        return nil
    }
    

}
        // Show point of Interest
    //    func ShowPointOfInterest(){
    //        let searchRequest = MKLocalSearch.Request()
    //
    //        searchRequest.pointOfInterestFilter = MKPointOfInterestFilter(including: [.bank,.atm,.foodMarket,.cafe])
    //        searchRequest.region = mapView.region
    //        searchRequest.resultTypes = [.pointOfInterest,.address]
    //
    //        let search = MKLocalSearch(request: searchRequest)
    //        search.start { response, error in
    //            guard let response = response else{
    //                print("Error")
    //                return
    //            }
    //            // Create annotataion for every map item
    //            for mapItem in response.mapItems{
    //                let annotation = MKPointAnnotation()
    //                annotation.coordinate = mapItem.placemark.coordinate
    //
    //                annotation.title = mapItem.name
    //                annotation.subtitle = mapItem.phoneNumber
    //                self.mapView.addAnnotation(annotation)
    //            }
    //            self.mapView.setRegion(response.boundingRegion, animated: true)
    //        }
    //    }
    // Showing route Map between two places

//    func showDirection(){
//        let request = MKDirections.Request()
//
//        let sourcePlace = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 30.6576, longitude: 76.7271))
//        request.source = MKMapItem(placemark: sourcePlace)
//
//        let destinationPlace = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 30.6993, longitude: 76.6916))
//        request.destination = MKMapItem(placemark: destinationPlace)
//
//        request.transportType = [.automobile,.walking]
//
//        let direction = MKDirections(request: request)
//        direction.calculate { response, error in
//            guard let response = response else{
//                print("Error")
//                return
//            }
//            let route = response.routes[0]
//            self.mapView.addOverlay(route.polyline)
//        }
//
//
//
//
//    }
    
    

        
    
    

