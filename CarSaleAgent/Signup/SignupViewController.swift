//
//  SignupViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 20/03/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    var customrole:Int?=0
    
    
    @IBOutlet weak var txtname: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!
    
    @IBOutlet weak var txtphone: UITextField!
    
    @IBOutlet weak var txtaddress: UITextField!
    
    
    
    @IBOutlet weak var btnselectrole: UIButton!
    
    
    @IBOutlet var btnroleitems: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
     btnselectrole.layer.cornerRadius=btnselectrole.frame.height/2.0
        
        btnroleitems.forEach { (rolebtn) in
        rolebtn.layer.cornerRadius = rolebtn.frame.height/2.0
        rolebtn.isHidden=true
        }
        
    }
    
    //hidding roles on select btn pressed
    
    @IBAction func btnrolepressed(_ sender: UIButton) {
        btnroleitems.forEach { (rolebtn) in
            UIView.animate(withDuration: 0.02, animations:{
                rolebtn.isHidden = !rolebtn.isHidden
                self.view.layoutIfNeeded()

    })
  }
 }
    
    //onselection of role assigning id below
    
    @IBAction func btnrolechoices(_ sender: UIButton) {
        if let btnlabel=sender.titleLabel?.text{
            if btnlabel=="Agent"{
                customrole=1
            }
            else if btnlabel=="Buyer"{
                customrole=2
            }
            else if btnlabel=="Seller"
            {
                customrole=3
                
            }
            
            
            
        }
        
    }
    
    
    
    
    //above selectrole button action
    
    
    @IBAction func btnsignup(_ sender: UIButton) {
      //  var customrole:Int?=0
        let usr=UserModel()
        
        usr.u_name=txtname.text!
        usr.password=txtpassword.text!
        usr.phoneNumber=txtphone.text!
        usr.address=txtaddress.text!
        usr.r_id=customrole
        
        let um = Usersmanager()
        let answer=um.adduser(user: usr)
        
        if answer==true{
            
            
           // let next:HomeViewController=self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
           // self.navigationController?.pushViewController(next, animated: true)
            
         showalert()
           print("Signup Succesfull")
        }
        else
        {
            showalertforsignupnfail()
            print(um.Message)
        }
        
        
    }
    
    
    //Alert message below
    func showalert(){
        let alert=UIAlertController(title: "Registration", message: "Succesfull", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }
    
    func showalertforsignupnfail(){
        let alert=UIAlertController(title: "Signup Failed", message: "Fields Empty!Plz fill the fields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }

}
