//
//  UserRegistrationViewController.swift
//  iot-project
//
//  Created by wtnv009 on 2015/09/22.
//  Copyright © 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit

class UserRegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    var apiManager: ApiManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        userNameTextField.delegate = self
    }
    
    //キーボードのリターンボタンが押されたとき
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        userNameTextField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func registrationTouched(sender: AnyObject) {
        if (userNameTextField.text!.isEmpty) {
            print("ユーザー名未入力")
            
            let alert = UIAlertView()
            alert.title = "アラート"
            alert.message = "ユーザー名を入力してください"
            alert.addButtonWithTitle("OK")
            alert.show()
        }
        else {
            transitionToRoomsView()

        }
    }
    
    //サーバーに送信（仮）
    func sendUserName() {
        apiManager = ApiManager.init(entryPoint: "String")
        apiManager.request()
    }
    
    //部屋一覧画面へ移動
    func transitionToRoomsView() {
        let storyboard = UIStoryboard(name: "Rooms", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("RoomsVC")
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
