//
//  ConnectBluetoothViewController.swift
//  iot-project
//
//  Created by Shinnosuke Komiya on 2015/08/18.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit

class ConnectBluetoothViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, BLEDeviceClassDelegate {
    
    //BLEBaseClassの初期化
    var bleBaseClass: BLEBaseClass?
    var Device: BLEDeviceClass?
    
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

    @IBOutlet var tableView : UITableView!
    @IBOutlet var bleName : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // セルの内容を変更
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
        cell.labelTitle.text = items[indexPath.row].title
        cell.labelContent.text = items[indexPath.row].contentText
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        var text: String = items[indexPath.row].title
        //println(text)
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
