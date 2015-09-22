//
//  ConnectBluetoothViewController.swift
//  iot-project
//
//  Created by Shinnosuke Komiya on 2015/08/18.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit
import CoreBluetooth

class ConnectBluetoothViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, BLEDeviceClassDelegate, CBCentralManagerDelegate {
    //セントラルマネージャのプロパティ定義
    var peripheral: CBPeripheral!
    //BLEBaseClassのプロパティ定義
    var bleBaseClass: BLEBaseClass?
    var Device: BLEDeviceClass?
    var bleModules = ["接続なし":"none"]

    @IBOutlet var tableView : UITableView!
    var bleName : NSMutableArray = NSMutableArray()
    var bleUUIDs : NSMutableArray = NSMutableArray()
    var bleRx : NSMutableArray = NSMutableArray()
    var blePeripheral : NSMutableArray = NSMutableArray()
    var centralManager: CBCentralManager!
    var connectBtn : UIButton = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //配列をリセット
        bleName = NSMutableArray()
        bleUUIDs = NSMutableArray()
        bleRx = NSMutableArray()
        blePeripheral = NSMutableArray()
        
        //CBCentralManagerの初期化
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
        self.centralManager.scanForPeripheralsWithServices(nil, options: nil)
        
        // サイズ
        connectBtn.frame = CGRectMake(0,0,200,40)
        connectBtn.backgroundColor = UIColor.redColor();
        connectBtn.layer.masksToBounds = true
        connectBtn.setTitle("検索", forState: UIControlState.Normal)
        connectBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        connectBtn.layer.cornerRadius = 20.0
        connectBtn.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height-50)
        connectBtn.tag = 1
        connectBtn.addTarget(self, action: "onClickConnectBtn:", forControlEvents: .TouchUpInside)
        
        // UIボタンをViewに追加.
        self.view.addSubview(connectBtn);
    }
    
    /*
    ボタンイベント.
    */
    func onClickConnectBtn(sender: UIButton){
        
        // 配列をリセット.
        bleName = NSMutableArray()
        bleUUIDs = NSMutableArray()
        blePeripheral = NSMutableArray()
        bleRx = NSMutableArray()
        // CoreBluetoothを初期化および始動.
        centralManager = CBCentralManager(delegate: self, queue: nil, options: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc(didUpdateValueForCharacteristic:Characteristic:) func didUpdateValueForCharacteristic(device: BLEDeviceClass!, characteristic: CBCharacteristic!) {
        if (device == Device)	{
            //	キャラクタリスティックを扱う為のクラスを取得し
            //	通知されたキャラクタリスティックと比較し同じであれば
            //	bufに結果を格納
            //iPhone->Device
            var rx: CBCharacteristic = Device!.getCharacteristic(UUID_VSP_SERVICE, characteristic: UUID_RX)
            if (characteristic == rx)	{
                //			uint8_t*	buf = (uint8_t*)[characteristic.value bytes]; //bufに結果が入る
                //            NSLog(@"value=%@",characteristic.value);
                return;
            }
            
            //Device->iPhone
            var tx:CBCharacteristic = Device!.getCharacteristic(UUID_VSP_SERVICE, characteristic: UUID_TX)
            if (characteristic == tx)	{
                //            NSLog(@"Receive value=%@",characteristic.value);
                                //ここでBLEから配列を受け取る
                var buf = UnsafePointer<UInt8>(characteristic.value!.bytes)
                print(buf[0])
                var data = characteristic.value
       
                return;
            }
        }
    }

    //セントラルマネージャの状態変化を取得
    func centralManagerDidUpdateState(central: CBCentralManager) {
        
        print("state \(central.state)");
        switch (central.state) {
        case .PoweredOff:
            print("Bluetoothの電源がOff")
        case .PoweredOn:
            print("Bluetoothの電源はOn")
            // BLEデバイスの検出を開始.
            centralManager.scanForPeripheralsWithServices(nil, options: nil)
        case .Resetting:
            print("レスティング状態")
        case .Unauthorized:
            print("非認証状態")
        case .Unknown:
            print("不明")
        case .Unsupported:
            print("非対応")
        }
    }
    //スキャン結果を受け取る
    func centralManager(central: CBCentralManager,
        didDiscoverPeripheral peripheral: CBPeripheral,
        advertisementData: [String : AnyObject],
        RSSI: NSNumber)
    {
        print("peripheral: \(peripheral)")
        var name: NSString? = advertisementData["kCBAdvDataLocalName"] as? NSString
        if (name == nil) {
            name = "no name";
        }
        bleName.addObject(name!)
        blePeripheral.addObject(peripheral)
        bleUUIDs.addObject(peripheral.identifier.UUIDString)
        tableView.reloadData()
    }
    
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        print("Uuid: \(bleUUIDs[indexPath.row])")
        print("Name: \(bleName[indexPath.row])")
    }

    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bleUUIDs.count
    }
    
    // セルの内容を変更
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:"Cell" )
        cell.textLabel!.sizeToFit()
        cell.textLabel!.textColor = UIColor.greenColor()
        cell.textLabel!.text = "\(bleName[indexPath.row])"
        cell.textLabel!.font = UIFont.systemFontOfSize(20)
        cell.detailTextLabel!.text = "\(bleUUIDs[indexPath.row])"
        cell.detailTextLabel!.font = UIFont.systemFontOfSize(12)
        return cell
    }
    
    //次へボタン(開発用)が押されたとき
    @IBAction func nextBtnTouched(sender: AnyObject) {
        transitionToUserRegistrationView()
    }
    
    //ユーザー登録画面へ移動
    func transitionToUserRegistrationView() {
        let storyboard = UIStoryboard(name: "UserRegistration", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("UserRegistrationVC")
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
