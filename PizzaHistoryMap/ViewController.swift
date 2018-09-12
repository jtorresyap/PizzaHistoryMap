//
//  ViewController.swift
//  PizzaHistoryMap
//
//  Created by Steven Lipton on 7/18/17.
//  Copyright © 2017 Steven Lipton. All rights reserved.
//

/* --- Coordinate information -----
            Lat,long                      
 Naples: 40.8367321,14.2468856
 New York: 40.7216294 , -73.995453
 Chicago: 41.892479 , -87.6267592          
 Chatham: 42.4056555,-82.1860369         
 Beverly Hills: 34.0674607,-118.3977309
 
 -->Challenges!!<----
 208 S. Beverly Drive Beverly Hills CA:34.0647691,-118.3991328
 2121 N. Clark St Chicago IL: 41.9206921,-87.6375361
 
 For region monitoring:
 latitude: 37.33454235, longitude: -122.03666775000001
 --- */



import UIKit
import MapKit


class ViewController: UIViewController {
    
    //MARK: - Properties and outlets
    var coordinate2D = CLLocationCoordinate2DMake(40.8367321,14.2468856)
    var camera = MKMapCamera()
    
    //MARK: Outlets
    @IBOutlet weak var changeMapType: UIButton!
    @IBOutlet weak var changePitch: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    
    //MARK: - Actions
    @IBAction func changeMapType(_ sender: UIButton) {
    }
    
    @IBAction func changePitch(_ sender: UIButton) {
       
    }
    @IBAction func toggleMapFeatures(_ sender: UIButton) {
    }
    
    @IBAction func findHere(_ sender: UIButton) {
    }
    
    @IBAction func findPizza(_ sender: UIButton) {
    }

    @IBAction func locationPicker(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0: //Naples
            coordinate2D = CLLocationCoordinate2DMake(40.8367321,14.2468856)
            updateMapCamera(heading: 12.0, altitude: 50.0)
            return
        case 1: //NY
            coordinate2D = CLLocationCoordinate2DMake(40.7216294 , -73.995453)
            updateMapCamera(heading: 90.0, altitude: 1000.0)
            return
        case 2: //Chicago
            coordinate2D = CLLocationCoordinate2DMake(41.892479 , -87.6267592 )
            updateMapCamera(heading: 180.0, altitude: 500.0)
            return
        case 3: //Chatem
            coordinate2D = CLLocationCoordinate2DMake(42.4056555,-82.1860369)
            updateMapCamera(heading: -12.0, altitude: 50.0)
            return
        case 4:
            coordinate2D = CLLocationCoordinate2DMake(34.0674607,-118.3977309)
            updateMapCamera(heading: -90.0, altitude: 1000.0)
            return
        default: //Beverly Hills
            coordinate2D = CLLocationCoordinate2DMake(34.0674607,-118.3977309)
            updateMapCamera(heading: -180.0, altitude: 50.0)
            return
        }
        updateMapRegion(rangeSpan: 100)
        
    }
    //MARK: - Instance Methods
    func updateMapRegion(rangeSpan: CLLocationDistance){
        let region = MKCoordinateRegionMakeWithDistance(coordinate2D, rangeSpan, rangeSpan)
        mapView.region = region
    }
    
    func updateMapCamera(heading: CLLocationDirection, altitude: CLLocationDistance){
        camera.centerCoordinate = coordinate2D
        camera.heading = heading
        camera.altitude = altitude
        mapView.camera = camera
        
    }
    
    
    //MARK: Map setup
    
    //MARK: Annotations
    
    //MARK: Overlays
    
    //MARK: Location
    
    //MARK: Find
    
    //MARK: Directions
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMapRegion(rangeSpan: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Delegates
    //MARK: Annotation delegates
    //MARK: Overlay delegates
    //MARK: Location Manager delegates
    

}

