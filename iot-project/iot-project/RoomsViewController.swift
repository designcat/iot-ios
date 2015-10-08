//
//  RoomsViewController.swift
//  iot-project
//
//  Created by wtnv009 on 2015/08/17.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit

class RoomsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var roomsTableView: UITableView!
    var rooms: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        roomsTableView.delegate = self
        roomsTableView.dataSource = self
        rooms = ["部屋1", "部屋2", "部屋3"] //仮
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Cellが選択された際に呼び出される.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        
        transitionToMembersView() //とりあえずメンバー一覧画面へ移動
    }
    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    // セルの内容を変更
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:"Cell" )
        cell.textLabel!.sizeToFit()
        cell.textLabel!.text = "\(rooms[indexPath.row])"
        cell.textLabel!.font = UIFont.systemFontOfSize(20)
        return cell
    }
    
    //新規に作成ボタンが押されたとき
    @IBAction func createBtnTouched(sender: AnyObject) {
    }
    
    //メンバー一覧画面へ移動
    func transitionToMembersView() {
        let storyboard = UIStoryboard(name: "Members", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("MembersVC")
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
