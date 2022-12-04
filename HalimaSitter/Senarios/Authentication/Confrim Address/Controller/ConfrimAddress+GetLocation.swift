//
//  ConfrimAddress+GetLocation.swift
//  Halima
//
//  Created by Moustafa on 7/10/21.
//

import UIKit
import GooglePlaces
import GoogleMaps
import MOLH
extension ConfrimAddressViewController  {
        
    func addMarker(loccation :CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = loccation
        marker.title = "Halima"
        marker.snippet = "Location"
        marker.map = mapView
    }
    
    
    func getCurrentLocation() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
    }
    
    func latLong(lat: Double,long: Double)  {
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: lat , longitude: long)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            print("Response GeoLocation : \(placemarks)")
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            // Country
            if let country = placeMark.addressDictionary!["Country"] as? String {
                print("Country :- \(country)")
                self.address = "\(country)"
                if let address = self.address {
                    self.addressLbl.text = address
                }
                // City
                if let city = placeMark.addressDictionary!["City"] as? String {
                    print("City :- \(city)")
                    self.address = "\(country).\(city)"
                    if let address = self.address {
                        self.addressLbl.text = address
                    }
                    // State
                    if let state = placeMark.addressDictionary!["State"] as? String{
                        print("State :- \(state)")
                        self.address = "\(country).\(city).\(state)"
                        if let address = self.address {
                            self.addressLbl.text = address
                        }
                        // Street
                        if let street = placeMark.addressDictionary!["Street"] as? String{
                            print("Street :- \(street)")
                            let str = street
                            let streetNumber = str.components(
                                separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
                            print("streetNumber :- \(streetNumber)" as Any)
                            self.address = "\(country).\(city).\(state).\(street)"
                            if let address = self.address {
                                self.addressLbl.text = address
                            }

                            // ZIP
                            if let zip = placeMark.addressDictionary!["ZIP"] as? String{
                                print("ZIP :- \(zip)")
                                // Location name
                                if let locationName = placeMark?.addressDictionary?["Name"] as? String {
                                    print("Location Name :- \(locationName)")
                                    // Street address
                                    if let thoroughfare = placeMark?.addressDictionary!["Thoroughfare"] as? NSString {
                                        print("Thoroughfare :- \(thoroughfare)")
                                                                                
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
        })
        if let address = self.address {
            self.addressLbl.text = address
        }
        
    }
    
  
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude

        if let lat = latitude , let long = longitude{
            print(lat)
            print(long)
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 12.0)
            mapView.camera = camera
            mapView.clear()
            latLong(lat: lat, long: long)
            addMarker(loccation: mapView.camera.target)
            
        }
    }
    
}
