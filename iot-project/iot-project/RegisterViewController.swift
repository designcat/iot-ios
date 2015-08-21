//
//  RegisterViewController.swift
//  iot-project
//
//  Created by Shinnosuke Komiya on 2015/08/19.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet let UILabel : userName!
    @IBOutlet var UITextField : userNameTextField!
    @IBOutlet let UILabel : pwd!
    @IBOutlet var UITextField : pwdTexField!
    @IBOutlet let UIButton : registerBtn!
    
    
    var afNetworking : AFNetworking?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
