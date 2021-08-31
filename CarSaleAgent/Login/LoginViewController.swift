//
//  LoginViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 20/03/2021.
//  Copyright © 2021 Apple. All rights reserved.


//global variable
var t1 = ""
var t2 = ""
//
var d1 = "" //uid
var d2 = "" //uname
var d3 = "" //phoneno
var d4 = "" //addr
var d5 = ""  //rid
var d6 = ""  //rname
var d7 = ""


import UIKit
//import Alamofire
class LoginViewController: UIViewController {
    
    
    // weak var delegateL:AgentprofileViewController!
    
    
    // public var user : [UserModel] = []
    
    let mm = Usersmanager()
    
    
    //MARK:-- Outlets
    
    @IBOutlet public weak var txtPhoneNumber: UITextField!
    @IBOutlet public weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        navigationItem.hidesBackButton = true
        
        //URLEncoding.default
//        Alamofire.request("https://httpbin.org/get", method: .post, parameters: ["foo": "bar"],encoding: JSONEncoding.default, headers: nil).responseJSON {
//            response in
//            switch (response.result) {
//            case .success( _):
//
//                do {
//                    let users = try JSONDecoder().decode(User.self, from: response.data!)
//                    print(users)
//
//                } catch let error as NSError {
//                    print("Failed to load: \(error.localizedDescription)")
//                }
//
//            case .failure(let error):
//                print("Request error: \(error.localizedDescription)")
//            }
//        }
        
        //self.tabBarController?.view.removeFromSuperview()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true , animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true , animated: true)
    }
    // login button action
    @IBAction func btnLogin(_ sender: Any) {
        
        
        //below txtphone is actaully name changing 
        
        let response = mm.alluser(phoneNo: txtPhoneNumber.text!, Password: txtPassword.text!)
        
        
        
        if response.count ?? 0 > 0
        {
            
            t1 = txtPhoneNumber.text!//this is basically txtname overwritten later
            t2 = txtPassword.text!
            
            
            var umod = UserModel()
            
            umod = response[0]
            
            umod.u_name = response[0].u_name
            umod.u_id = response[0].u_id
            umod.phoneNumber = response[0].phoneNumber
            umod.address = response[0].address
            umod.password = response[0].password
            umod.r_id = response[0].r_id
            umod.r_name = response[0].r_name
            
            print(response[0].u_id)
            print(response[0].u_name)
            print(response[0].password)
            print(response[0].phoneNumber)
            print(response[0].address)
            print(response[0].r_id)
            print(response[0].r_name)
            
//            UserDefaults.standard.set(response[0].r_name, forKey: "role")
//            UserDefaults.standard.set(txtPhoneNumber.text!, forKey: "username")
//            UserDefaults.standard.set(txtPassword.text!, forKey: "password")
            if response[0].r_name=="Agent"
            {
                var uid = "\(response[0].u_id)"
                var rid = "\(response[0].r_id!)"
                
                d1 = uid
                d2 = response[0].u_name!
                d3 = response[0].phoneNumber!
                d4 = response[0].address!
                d5 = rid
                d6 = response[0].r_name!
                d7 = response[0].password!
                UserDefaults.standard.set(d1, forKey: "d1")
                UserDefaults.standard.set(d2, forKey: "d2")
                UserDefaults.standard.set(d3, forKey: "d3")
                UserDefaults.standard.set(d4, forKey: "d4")
                UserDefaults.standard.set(d5, forKey: "d5")
                UserDefaults.standard.set(d6, forKey: "d6")
                UserDefaults.standard.set(d7, forKey: "d7")
                
                let next : AgentTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentTabViewController") as! AgentTabViewController
                
                self.navigationController?.pushViewController(next, animated: true)
                
                showalertforloginsuccess()
                print("Login Successfull")
                
            }
                
            else if response[0].r_name=="Seller"
            {
                var uid = "\(response[0].u_id)"
                var rid = "\(response[0].r_id!)"
                
                
                d1 = uid
                d2 = response[0].u_name!
                d3 = response[0].phoneNumber!
                d4 = response[0].address!
                d5 = rid
                d6 = response[0].r_name!
                UserDefaults.standard.set(d1, forKey: "d1")
                UserDefaults.standard.set(d2, forKey: "d2")
                UserDefaults.standard.set(d3, forKey: "d3")
                UserDefaults.standard.set(d4, forKey: "d4")
                UserDefaults.standard.set(d5, forKey: "d5")
                UserDefaults.standard.set(d6, forKey: "d6")
                
                let next : SellerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "SellerTabViewController") as! SellerTabViewController
                
                self.navigationController?.pushViewController(next, animated: true)
                
                showalertforloginsuccess()
                print("Login Successfull")
                
                
            }
                
            else if response[0].r_name=="Buyer"
            {
                var uid = "\(response[0].u_id)"
                var rid = "\(response[0].r_id!)"
                
                d1 = uid
                d2 = response[0].u_name!
                d3 = response[0].phoneNumber!
                d4 = response[0].address!
                d5 = rid
                d6 = response[0].r_name!
                UserDefaults.standard.set(d1, forKey: "d1")
                UserDefaults.standard.set(d2, forKey: "d2")
                UserDefaults.standard.set(d3, forKey: "d3")
                UserDefaults.standard.set(d4, forKey: "d4")
                UserDefaults.standard.set(d5, forKey: "d5")
                UserDefaults.standard.set(d6, forKey: "d6")
                
                let next : BuyerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerTabViewController") as! BuyerTabViewController
                
                self.navigationController?.pushViewController(next, animated: true)
                
                showalertforloginsuccess()
                print("Login Successfull")
                
                
            }
                
            else{
                
                print("Login Succesfull but login person is not agent")
            }
            
        }
        else
        {
            showalertforloginfail()
            print("Not Login")
            
        }
        
    }
    
    
    
    
    //Alert message for login below
    
    func showalertforloginsuccess(){
        let alert=UIAlertController(title: "Login", message: "Succesfull", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }
    
    func showalertforloginfail(){
        let alert=UIAlertController(title: "Login Failed", message: "Invalid Mobile Number or Password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }
    
    
    
}





//spliting
//import Foundation
//
//var fullName: String = "First Last"
//let fullNameArr = fullName.componentsSeparatedByString(" ")


//2ndmethod spliting
//let str = "Helloimgonnasplit"
//let arr = str.map {$0.String}
//Boom You Got it split
