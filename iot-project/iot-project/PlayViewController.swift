//
//  PlayViewController.swift
//  iot-project
//
//  Created by wtnv009 on 2015/08/17.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
