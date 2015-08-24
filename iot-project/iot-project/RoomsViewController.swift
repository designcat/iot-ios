//
//  RoomsViewController.swift
//  iot-project
//
//  Created by wtnv009 on 2015/08/17.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit

class RoomsViewController: UIViewController {
    
    var roomsArray: NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        roomsArray = NSMutableArray(array: ["部屋1", "部屋2", "部屋3"])
        println(roomsArray)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createRoomBtnTouched(sender: AnyObject) {
        toMemberView()
    }
    
    func toMemberView() {
        performSegueWithIdentifier("ToMemberView", sender: nil)
    }
    
    func toMemberWaittingView() {
        performSegueWithIdentifier("ToMemberWaittingView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ToMemberView") {
            println("メンバー一覧画面(作成者用)へ移動")
            
        } else if (segue.identifier == "ToMemberWaittingView") {
            println("メンバー一覧画面へ移動")
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
