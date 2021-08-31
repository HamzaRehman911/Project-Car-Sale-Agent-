//
//  RegisterBuyerViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 12/07/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class RegisterBuyerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var imgforfropdown: UIImageView!
    var getagent:String = ""
 
    @IBOutlet weak var sideviewforagent: UIView!
    @IBOutlet weak var tablevforagent: UITableView!
    
     var issideviewforagentopen:Bool = false
    var getAgent = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        sideviewforagent.layer.borderWidth = 0.3
        sideviewforagent.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        sideviewforagent.isHidden = true
        issideviewforagentopen = false
        
        
        
        let um = Usersmanager()
        let agentresponse = um.getagents()
        var getA = Array(repeating: String(), count: agentresponse.count)
        
        if agentresponse.count ?? 0 > 0
        {
            let gt:Int = agentresponse.count
            var c:Int = 0
            while c<gt{
                
                getA[c] = agentresponse[c].u_name!
                c += 1
                
            }
            
            getAgent = getA
            getAgent.append("None")
            
            
        
        // Do any additional setup after loading the view.
    }
    
            getAgents()
    }
    
    func getAgents()
    {
        let um = Usersmanager()
        let agentresponse = um.getagents()
        var getA = Array(repeating: String(), count: agentresponse.count)
        
        if agentresponse.count ?? 0 > 0
        {
            let gt:Int = agentresponse.count
            var c:Int = 0
            while c<gt{
                
                getA[c] = agentresponse[c].u_name!
                c += 1
                
            }
            
            getAgent = getA
            getAgent.append("None")
            
            
        }
        else
        {
            
            print("No Agents to display")
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getAgent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
         let next:RegisterBuyerTableViewCell = tablevforagent.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RegisterBuyerTableViewCell
        
        next.layer.borderWidth = 0.3
        next.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        next.lblagent.text = getAgent[indexPath.row]
        
        return next
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        getagent = getAgent[indexPath.row]
        print(getagent)
        tablevforagent.reloadData()
        
        imgforfropdown.image = #imageLiteral(resourceName: "down")
        tablevforagent.isHidden = true
        sideviewforagent.isHidden = true
        
        issideviewforagentopen = false
        
        sideviewforagent.frame = CGRect(x: 87, y: 203, width: 240, height: 210)
        
        tablevforagent.frame = CGRect(x: 87, y: 203, width: 240, height: 210)
        
        UIView.setAnimationDuration(0.3)
        
        UIView.setAnimationDelegate(self)
        UIView.beginAnimations("TableAnimation", context: nil)
        sideviewforagent.frame = CGRect(x: 87 , y: 203, width: 0, height: 210)
        
        tablevforagent.frame = CGRect(x: 87, y: 203, width: 0, height: 210)
        
         UIView.commitAnimations()
    }
    
    
    //btnselectagent
    @IBAction func btnselectagent(_ sender: UIButton) {
        
        imgforfropdown.image = #imageLiteral(resourceName: "up-1")
        tablevforagent.isHidden = false
        sideviewforagent.isHidden = false
        self.view.bringSubviewToFront(sideviewforagent)
        if !issideviewforagentopen{
            issideviewforagentopen = true
            sideviewforagent.frame = CGRect(x: 87 , y: 203, width: 240, height: 210)
            
            tablevforagent.frame = CGRect(x: 87, y: 203, width: 0, height: 210)
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideviewforagent.frame = CGRect(x: 87, y: 203, width: 240, height: 210)
            
            tablevforagent.frame = CGRect(x: 87, y: 203, width: 240, height: 210)
            
            UIView.commitAnimations()
        }
        else{
            tablevforagent.isHidden = true
            sideviewforagent.isHidden = true
            
            issideviewforagentopen = false
            
            sideviewforagent.frame = CGRect(x: 87 , y: 203, width: 240, height: 210)
            
            tablevforagent.frame = CGRect(x: 87, y: 203, width: 240, height: 210)
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideviewforagent.frame = CGRect(x: 87, y: 203, width: 0, height: 210)
            
            tablevforagent.frame = CGRect(x: 87, y: 203, width: 0, height: 210)
            
            UIView.commitAnimations()
        
        }
        
    }
    
    
    
    //btn register
    
    @IBAction func btnregister(_ sender: UIButton) {
        
        let um = Usersmanager()
        let rm = RegModel()
        
        rm.Agent_name = getagent
        rm.Bid = Int(d1)!
        rm.Buyer_name = d2
        rm.Reg_status = "Registered"
        
        
        let resB = um.restrictReg(bname: d2, aname: getagent)
        
        if resB.count ?? 0 > 0
        {
         let alert = UIAlertController(title: "Restriction", message: "Already Registered", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert,animated: true)
        }
        else{
            let res = um.insertReg(rdata: rm)
            
            if res == true
            {
                let alert = UIAlertController(title: "Registered Successfuly with Agent", message: nil, preferredStyle: .alert);
                
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil);
                
                alert.addAction(action)
                self.present(alert,animated: true);
            }
            print(getagent)
            
        }
        
        
       
    }
    
    
}
