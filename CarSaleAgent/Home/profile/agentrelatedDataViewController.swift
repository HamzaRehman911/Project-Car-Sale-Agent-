//
//  agentrelatedDataViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 29/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class agentrelatedDataViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var assignrate:String = ""
   
    @IBOutlet weak var lbloption: UILabel!
    @IBOutlet weak var lblrating: UILabel!
    @IBOutlet weak var lblagentname: UILabel!
    var profiledata = [getagentdataforsearch]()

    @IBOutlet weak var imgstar: UIImageView!
    @IBOutlet weak var collview: UICollectionView!
    @IBOutlet weak var downview: UIView!
    @IBOutlet weak var topview: UIView!
    
    var getfromroot = [getbuyerRresponse]()
    
    var vname:String = ""
    var make:String = ""
    var price:String = ""
    var model:String = ""
    var vstatus:String = ""
    var vimg1:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

         self.navigationController?.isNavigationBarHidden = true
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
       // self.navigationItem.setHidesBackButton(false, animated: true)
        //self.navigationItem.setLeftBarButton(UIBarButtonItem, animated: true)
        
        // Do any additional setup after loading the view.
       // downview.layer.cornerRadius = downview.layer.frame.height/22
        if d6 == "Agent"
        {
        let um = Usersmanager()
        let result = um.AgentProfiledata(agentName: d2)
        var  getAveragerating:Float = 0
        if result.count ?? 0 > 0
        {
            
            profiledata = result
            lblagentname.text = profiledata[0].u_name
            lbloption.isHidden = true
           // lblrating.text = profiledata[]
            //lblrating.text = profiledata[0].r_name
//            var rat = [Float]()
//            var c:Int = 0
//            while c<profiledata.count
//            {
//                //rat[c] = profiledata[c].Int(rating)
//                var get = profiledata[c].rating
//                rat.append(Float(get) ?? 0.0)
//                getAveragerating = getAveragerating + rat[c]
//                c += 1
//            }
//            lblrating.text = "\(getAveragerating)"
        }
        else{
            print("Got No Data")
            lbloption.isHidden = true
            lblagentname.text = d2
            let alert = UIAlertController(title: "No Vehicle to display !", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            alert.addAction(action)
            self.present(alert,animated: true)
        }
        
        lblrating.text = assignrate
        
        
    }
        else if d6 == "Buyer"
        {
            let um = Usersmanager()
            let res = um.getbuyervehicle(bname: d2)
            if res.count ?? 0 > 0
            {
               getfromroot = res
                lbloption.text = "(Buyer)"
                lblagentname.text = d2
                imgstar.isHidden = true
                lblrating.isHidden = true
            }
            else
            {
                lbloption.text = "(Buyer)"
                lblagentname.text = d2
                imgstar.isHidden = true
                lblrating.isHidden = true
                
                let alert = UIAlertController(title: "No Vehicle to display !", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                
                alert.addAction(action)
                self.present(alert,animated: true)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
       //  self.navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBAction func btnbacktoprofile(_ sender: UIButton) {
        print("Moving Or Not")
        let next:AgentprofileViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentprofileViewController") as! AgentprofileViewController
        
        self.navigationController?.pushViewController(next, animated: true)
    }
    //
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if profiledata.count > 0
        {
          return profiledata.count
        }
        else
        {
            return getfromroot.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let assigndata:agentVehiclesDetailinProfileCollectionViewCell = collview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! agentVehiclesDetailinProfileCollectionViewCell
      //  let getimg = APIWrapper()
        if d6 == "Agent"
        {
        let img1 = Utilities.getimageFromurl(name: profiledata[indexPath.row].v_image1)
        
        assigndata.vimg.image = img1
        assigndata.vname.text = profiledata[indexPath.row].vehicle_name
        assigndata.vmake.text = profiledata[indexPath.row].manufacturer
        assigndata.vmodel.text = profiledata[indexPath.row].model
        assigndata.lblstatus.text = profiledata[indexPath.row].status
            
            var c = profiledata[indexPath.row].Price
        assigndata.lblprice.text = "\(c)"
        
        assigndata.layer.cornerRadius = assigndata.layer.frame.height/14
        
        
        assigndata.layer.borderWidth = 0.8
        assigndata.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        else if d6 == "Buyer"
        {
            let img1 = Utilities.getimageFromurl(name: getfromroot[indexPath.row].v_image1)
            
            assigndata.vimg.image = img1
            assigndata.vname.text = getfromroot[indexPath.row].vehicle_name
            
            assigndata.vmodel.text = getfromroot[indexPath.row].model
            assigndata.lblstatus.text = getfromroot[indexPath.row].status
            
            var i = getfromroot[indexPath.row].offer
            assigndata.lblprice.text = String(getfromroot[indexPath.row].offer)
            
            if getfromroot[indexPath.row].Agent_name == "Not Involved"{
            assigndata.vmake.text = getfromroot[indexPath.row].Seller_name
                assigndata.lblmakelabel.text = "Owner :"
            }
            else{
                assigndata.vmake.text = getfromroot[indexPath.row].Agent_name
                assigndata.lblmakelabel.text = "Agent :"
            }
            assigndata.layer.cornerRadius = assigndata.layer.frame.height/14
            
            
            assigndata.layer.borderWidth = 0.8
            assigndata.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        return assigndata
        
    }
    
}
