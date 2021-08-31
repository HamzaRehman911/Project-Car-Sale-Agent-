//
//  AgentprofileViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 25/03/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class AgentprofileViewController: UIViewController {
    var oldname:String = ""
    var oldid:Int = 0
    var oldRole:String = ""
    var oldRid:Int = 0
    var pass:String = ""
    
    var averageRating:Float = 0.0
    
    
    var txt1:UITextField!
    var txt2:UITextField!
    var txt3:UITextField!
    var txt4:UITextField!
    
    
    @IBOutlet weak var imgstart: UIImageView!
    @IBOutlet weak var lbloptional: UILabel!
    @IBOutlet weak var btnunameoutlet: UIButton!
    
    @IBOutlet weak var lblrate: UILabel!
    
    @IBOutlet weak var profileimg: UIImageView!
    
    @IBOutlet weak var viewforprofile: UIView!
    
    weak var delegate:LoginViewController!
    //var userforagent:[UserModel]=[]
    //var useragent:UserModel?
    

    @IBOutlet weak var lblid: UILabel!
   // @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblphone: UILabel!
    @IBOutlet weak var lblrname: UILabel!
    @IBOutlet weak var lbladdress: UILabel!
    
  
    

   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // self.navigationItem.setHidesBackButton(true, animated: true)
    self.navigationController?.isNavigationBarHidden = true
       // self.navigationController?.navigationBar.barTintColor = UIColor.white
        lblid.text = d1
      //  lblname.text = d2
        lblphone.text = d3
        lblrname.text = d6
        lbladdress.text = d4
        btnunameoutlet.setTitle(d2, for: .normal)
        btnunameoutlet.setTitleColor(UIColor.black, for: .normal)
        
        viewforprofile.layer.cornerRadius = viewforprofile.layer.frame.height/14
        
        self.profileimg.layer.masksToBounds = true
        self.profileimg.layer.cornerRadius = self.profileimg.layer.frame.size.width / 2.1
        
        self.profileimg.clipsToBounds = true
        
        profileimg.layer.borderWidth = 2.5
        profileimg.layer.shadowOffset = CGSize(width: -1, height: 1)

        profileimg.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    //
        
        if d6 == "Seller"
        {
            lbloptional.isHidden = false
            btnunameoutlet.isEnabled = false
            lbloptional.text = "(Seller)"
            imgstart.isHidden = true
            lblrate.isHidden = true
            
        }
        else if d6 == "Agent"
        {
            btnunameoutlet.isEnabled = true
            lbloptional.isHidden = true
            imgstart.isHidden = false
        }
        else if d6 == "Buyer"
        {
            lbloptional.isHidden = false
            btnunameoutlet.isEnabled = true
            lbloptional.text = "(Buyer)"
            imgstart.isHidden = true
            lblrate.isHidden = true
        }
        
        
        //
        
        var c = 0
        
        
        let uobj = Usersmanager()
        let getrating = uobj.getRating(aname: (btnunameoutlet.titleLabel?.text)!)
        var i = getrating.count
        if getrating.count ?? 0 > 0
        {
            while c<getrating.count
            {
                if getrating[c].rating != "Not Rated"
                {
                    averageRating = averageRating + Float(getrating[c].rating)! ?? 0.0
                }
                else{
                    i -= 1
                }
                c += 1
            }
            print(averageRating / Float(i))
            lblrate.text = "\(averageRating)"
        }
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "SegueToYourTabBarController" {
//            if let destVC = segue.destination as? AgentTabViewController {
//                destVC.selectedIndex = 0
//            }
//        }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AgentTabViewController"
//        {
//            if let des = segue.destination as? AgentTabViewController
//            {
//                des.selectedIndex = 0
//            }
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationItem.setHidesBackButton(true, animated: true)
        // navigationController?.navigationBar.topItem?.title = "Profile"
        //self.tabBarController?.navigationItem.title = "Profile"
        //self.navigationController?.navigationBar.barTintColor = UIColor.white
        
         self.navigationController?.isNavigationBarHidden = true
 
    }
    override func viewWillDisappear(_ animated: Bool) {
       // navigationController?.navigationBar.topItem?.title = "Profile"
       // self.navigationController?.navigationBar.barTintColor = UIColor.white
        
         //self.navigationController?.isNavigationBarHidden = false
    }
  
    
    
    @IBAction func btnlogout(_ sender: Any) {
        d1 = ""
        d2 = ""
        d3 = ""
        d4 = ""
        d5 = ""
        d6 = ""
        d7 = ""
        UserDefaults.standard.set(d1, forKey: "d1")
        UserDefaults.standard.set(d2, forKey: "d2")
        UserDefaults.standard.set(d3, forKey: "d3")
        UserDefaults.standard.set(d4, forKey: "d4")
        UserDefaults.standard.set(d5, forKey: "d5")
        UserDefaults.standard.set(d6, forKey: "d6")
        UserDefaults.standard.set(d7, forKey: "d7")
        print(d1)
        
        let lout:ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(lout, animated: true)
        
        showalertforlogout()
        
    }
    func showalertforlogout(){
        let alert=UIAlertController(title: "Logout  ", message: "Successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }

    
    @IBAction func btnuname(_ sender: UIButton) {
        
        if d6 == "Agent"
        {
            lbloptional.isHidden = true
            print(btnunameoutlet.titleLabel?.text)
            
            let move:agentrelatedDataViewController = self.storyboard?.instantiateViewController(withIdentifier: "agentrelatedDataViewController") as! agentrelatedDataViewController
            move.navigationItem.hidesBackButton = false
            
           // move.navigationControlle.
            move.assignrate = "\(averageRating)"
            
            self.navigationController?.pushViewController(move, animated: true)
        }
        else if d6 == "Buyer"{
            print("Nothing")
            
            //lbloptional.isHidden = true
            print(btnunameoutlet.titleLabel?.text)
            
            let move:agentrelatedDataViewController = self.storyboard?.instantiateViewController(withIdentifier: "agentrelatedDataViewController") as! agentrelatedDataViewController
            move.navigationItem.hidesBackButton = false
            
            // move.navigationControlle.
           // move.assignrate = "\(averageRating)"
            
            self.navigationController?.pushViewController(move, animated: true)

        }
    }
    
    //btnedit
   
    @IBAction func btnedit(_ sender: UIButton) {
        print("Name:\(d2)")
        let alertforedit = UIAlertController(title: " Edit Profile", message: nil, preferredStyle: .alert)
        
        //below func(tfieldoffer name ca be differnet which will assign textfield to alert )
        
        alertforedit.addTextField(configurationHandler: tfieldforedit)
        alertforedit.addTextField(configurationHandler: tfieldforedit2)
        alertforedit.addTextField(configurationHandler: tfieldforedit3)
        alertforedit.addTextField(configurationHandler: tfieldforedit4)
        
        let okaction = UIAlertAction(title: "Done", style: .default, handler: self.okayfunc)
        
        let cancelaction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertforedit.addAction(okaction)
        alertforedit.addAction(cancelaction)
        
        self.present(alertforedit , animated: true)
        
    }
    func tfieldforedit(txtf:UITextField)
    {
        txt1 = txtf
        txt1.placeholder = "Input Name"
        txt1.textAlignment = .center
        
        
    }
    func tfieldforedit2(txtf2:UITextField)
    {
        txt2 = txtf2
        txt2.placeholder = "Input Role"
        txt2.textAlignment = .center
    }
    func tfieldforedit3(txtf3:UITextField)
    {
        txt3 = txtf3
        txt3.placeholder = "Input City"
        txt3.textAlignment = .center
    }
    func tfieldforedit4(txtf4:UITextField)
    {
        txt4 = txtf4
        txt4.placeholder = "Input Contact"
        txt4.textAlignment = .center
    }
    func okayfunc(alrt:UIAlertAction)
    {
        let umanager = Usersmanager()
        let uobj = UserModelForEdit()
        var newRid:Int = 0
        var newRole:String = ""
        print("Not Done yet")
        oldid = Int(d1)!
        oldname = d2
        oldRole = d6
        pass = d7
        
        if oldRole == "Seller"
        {
            oldRid = 3
        }
        if txt2.text == "Agent"
        {
            newRid = 1
            newRole = "Agent"
        }
        uobj.u_id = Int(d1)!
        uobj.u_name = txt1.text!
        uobj.r_id = newRid
        uobj.address = txt3.text!
        uobj.phoneNumber = txt4.text!
        
        let resE = umanager.editprofile(udata: uobj)
        if resE == true
        {
            d1 = String(oldid)
            d2 = txt1.text!
            d3 = txt4.text!
            d4 = txt3.text!
            d5 = String(newRid)
            d6 = newRole
            d7 = pass
            UserDefaults.standard.set(d1, forKey: "d1")
            UserDefaults.standard.set(d2, forKey: "d2")
            UserDefaults.standard.set(d3, forKey: "d3")
            UserDefaults.standard.set(d4, forKey: "d4")
            UserDefaults.standard.set(d5, forKey: "d5")
            UserDefaults.standard.set(d6, forKey: "d6")
            UserDefaults.standard.set(d7, forKey: "d7")
            
//            let next : AgentTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentTabViewController") as! AgentTabViewController
//
//            self.navigationController?.pushViewController(next, animated: true)
           //
            if let secondTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "AgentTabViewController") as?  AgentTabViewController {
                if let navControllers = secondTabBarController.viewControllers as? [UINavigationController] {
                   self.present(secondTabBarController, animated: true, completion: nil)
                }
                
            }
            
            //
        }
        
        
    }
  
    
}


