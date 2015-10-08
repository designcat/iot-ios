//
//  MembersViewController.swift
//  iot-project
//
//  Created by wtnv009 on 2015/08/17.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var membersTableView: UITableView!
    var members: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        membersTableView.dataSource = self
        membersTableView.delegate = self
        
        members = ["たろう", "じろう", "いちろう"]
    }

    //Cellが選択された際に呼び出される.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
    }
    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    // セルの内容を変更
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:"Cell" )
        cell.textLabel!.sizeToFit()
        cell.textLabel!.text = "\(members[indexPath.row])"
        cell.textLabel!.font = UIFont.systemFontOfSize(20)
        return cell
    }
    
    @IBAction func startBtnTouched(sender: AnyObject) {
        transitionToPlayView()
    }
    
    func transitionToPlayView() {
        let storyboard = UIStoryboard(name: "Play", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("playVC")
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
