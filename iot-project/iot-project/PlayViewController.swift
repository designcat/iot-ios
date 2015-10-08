//
//  PlayViewController.swift
//  iot-project
//
//  Created by wtnv009 on 2015/08/17.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit
import GoogleMaps

class PlayViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var pointLabel: UILabel!
    var currentPoint: Int!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var timeLimitLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        socket = appDelegate.socket
        
        socket.on("from_server") { (data, emitter) in
            if let message = data as? [String] {
                self.myLabel.text = message[0]
            }
        }
        */
        
        
        //ナビゲーションバーを非表示
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
//        let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
//            longitude: 151.20, zoom: 6)
//        let mapView = GMSMapView.mapWithFrame(CGRectMake(0, 100, 320, 400), camera: camera)
//        self.view.addSubview(mapView)
        
        // とりあえずの地図を表示
        let camera = GMSCameraPosition.cameraWithLatitude(-33.86,longitude: 151.20, zoom: 6)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
//        mapView.delegate = self
//        mapView.myLocationEnabled = true
//        self.view = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
