//
//  PlayViewController.swift
//  iot-project
//
//  Created by wtnv009 on 2015/08/17.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        socket = appDelegate.socket
        
        socket.on("from_server") { (data, emitter) in
            if let message = data as? [String] {
                self.myLabel.text = message[0]
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
