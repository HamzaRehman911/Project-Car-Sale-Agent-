//
//  ViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 17/03/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //   var um=Usermanager()
    // var myuser:[User]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        navigationItem.hidesBackButton = true
        
        navigationController?.setNavigationBarHidden(true , animated: true)
        
        tabBarController?.tabBar.isHidden = true
        tabBarItem.isEnabled = false
        
        d1 = UserDefaults.standard.string(forKey: "d1") ?? ""
        d2 = UserDefaults.standard.string(forKey: "d2") ?? ""
        d3 = UserDefaults.standard.string(forKey: "d3") ?? ""
        d4 = UserDefaults.standard.string(forKey: "d4") ?? ""
        d5 = UserDefaults.standard.string(forKey: "d5") ?? ""
        d6 = UserDefaults.standard.string(forKey: "d6") ?? ""
        navigate() 
    }
    
    func navigate() {
        
        if d6=="Agent"
        {
            let next : AgentTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentTabViewController") as! AgentTabViewController
            self.navigationController?.pushViewController(next, animated: true)
        } else if d6=="Seller"
        {
            
            let next : SellerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "SellerTabViewController") as! SellerTabViewController
            
            self.navigationController?.pushViewController(next, animated: true)
        } else if d6=="Buyer"
        {
            let next : BuyerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerTabViewController") as! BuyerTabViewController
            self.navigationController?.pushViewController(next, animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true , animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true , animated: true)
    }
    
}

