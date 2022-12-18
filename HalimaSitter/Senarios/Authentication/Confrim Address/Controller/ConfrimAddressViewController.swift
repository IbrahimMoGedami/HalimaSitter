//
//  ConfrimAddressViewController.swift
//  Halima
//
//  Created by Moustafa on 7/10/21.
//

import UIKit
import GoogleMaps
import GooglePlaces
protocol LocationData{
    func goToLocationView(lat : Double , long : Double , address : String)
}

class ConfrimAddressViewController: UIViewController {
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    var latitude : Double?
    var longitude : Double?
    var address : String?
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    var locationData : LocationData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentLocation()
        updateSearchBar()
        mapView.delegate = self
    }
    
    @IBAction func confrimAddressBtnPressed(_ sender: UIButton) {
        if let lat = latitude , let long = longitude , let address = address {
            locationData?.goToLocationView(lat: lat, long: long, address: address)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func getCurrentLocationBtnPressed(_ sender: UIButton) {
        getCurrentLocation()

    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
