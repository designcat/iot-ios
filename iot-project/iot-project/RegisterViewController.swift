//
//  RegisterViewController.swift
//  iot-project
//
//  Created by Shinnosuke Komiya on 2015/08/19.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
        override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func registerBtnTouched(sender: AnyObject) {
        
        toRoomsView()
        
        if (userNameTextField.text.isEmpty) {
            print("ユーザー名未入力")
            
            //アラート
        }
        else if (pwdTextField.text.isEmpty) {
            print("パスワード未入力")
            
            //アラート
        }
        else {
            sendUserData()
        }
    }
    
    func sendUserData() {
        //通信
        toRoomsView()
    }
    
    func toRoomsView() {
        performSegueWithIdentifier("ToRoomsView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ToRoomsView") {
            print("部屋選択画面へ移動")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
