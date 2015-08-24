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
    
//    var afNetworking : AFNetworking?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }

    @IBAction func registerBtnTouched(sender: AnyObject) {
        
        toRoomsView()
        
        if (userNameTextField.text.isEmpty) {
            println("ユーザー名未入力")
            
            //アラート
        }
        else if (pwdTextField.text.isEmpty) {
            println("パスワード未入力")
            
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
            println("部屋選択画面へ移動")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
