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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
            transitionToUserRegistrationView()

        }
    }
    
    //部屋一覧画面へ移動
    func transitionToUserRegistrationView() {
        let storyboard = UIStoryboard(name: "Rooms", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("RoomsVC")
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
