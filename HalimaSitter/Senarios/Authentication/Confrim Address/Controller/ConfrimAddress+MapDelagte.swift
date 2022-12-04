//
//  ConfrimAddress+MapDelagte.swift
//  Halima
//
//  Created by Moustafa on 7/10/21.
//

import UIKit
import GooglePlaces
import GoogleMaps

extension ConfrimAddressViewController: CLLocationManagerDelegate , GMSMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        // print("locations = \(locValue.latitude) \(locValue.longitude)")
        latitude = locValue.latitude
        longitude = locValue.longitude
        manager.stopUpdatingLocation()
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

import UIKit
import GooglePlaces
import GoogleMaps
// Handle the user's selection.
extension ConfrimAddressViewController: GMSAutocompleteResultsViewControllerDelegate {
    
    func updateSearchBar()  {
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        searchController?.searchBar.backgroundColor = .clear
        let subView = UIView(frame: CGRect(x: 0, y: 85.0, width: 350.0, height: 45.0))
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        // Put the search bar in the navigation bar.
        searchController?.searchBar.sizeToFit()
        navigationItem.titleView = searchController?.searchBar
        
        // When UISearchController presents the results view, present it in
        // this view controller, not one further up the chain.
        definesPresentationContext = true
        
        // Prevent the navigation bar from being hidden when searching.
        searchController?.hidesNavigationBarDuringPresentation = false
        
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        // Do something with the selected place.
        
        print("Place name: \(place.name)")
        
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        latitude = place.coordinate.latitude
        longitude = place.coordinate.longitude
        address = place.formattedAddress
        if let address = place.formattedAddress {
            self.address = address
            if let address = self.address {
                self.addressLbl.text = address
            }
        }
        if let lat = latitude , let long = longitude{
            print(lat)
            print(long)
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 15.0)
            mapView.camera = camera
            mapView.clear()
            addMarker(loccation: mapView.camera.target)
        }
        
        
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        // UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        //UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

