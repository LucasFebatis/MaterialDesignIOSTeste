//
//  BottomSheet.swift
//  Material TextFieldTest
//
//  Created by Lucas Batista on 17/06/19.
//  Copyright © 2019 Lucas Batista. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class BottomSheetViewController: UIViewController {
    
    @IBAction func action1() {
        //TODO: Chamada do telefone
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func action2() {
        openMapForPlace()
        dismiss(animated: true, completion: nil)
    }
    
    func openMapForPlace() {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("Praça dos Expedicionários, 19 - Gonzaga, Santos - SP, 11065-500") { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // handle no location found
                    return
            }
            // Use your location
            let long = location.coordinate.longitude
            let lati = location.coordinate.latitude
            
            let lat1 = long
            let lng1 = lati
            
            let latitude:CLLocationDegrees =  lat1
            let longitude:CLLocationDegrees =  lng1
            
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "Ponto"
            mapItem.openInMaps(launchOptions: options)
            
        }
        
    }
    
}
