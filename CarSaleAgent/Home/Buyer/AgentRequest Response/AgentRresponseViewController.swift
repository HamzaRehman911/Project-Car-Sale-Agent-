
//
//  AgentRresponseViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 19/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class AgentRresponseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tviewforresponse: UITableView!
    //
    var getvno:[String] = []
  //  var sellerContact:[String] = []
    var getvname:[String] = []
    var getmodel:[String] = []
    var getengine:[String] = []
    var getofferToagent:[Int] = []
    var getofferResponse:[String] = []
    var getagentName:[String] = []
    var getsellerName:[String] = []
    var getprice:[Int] = []
    var getcity:[String] = []
    var getstatus:[String] = []
  //  var getimage:[UIImage] = []
    var getimage1:[UIImage] = []
    var getimage2:[UIImage] = []
    var getimage3:[UIImage] = []
    var forimg1:[UIImage] = []
    var forimg2:[UIImage] = []
    var forimg3:[UIImage] = []
    var getmultipleimage:[[UIImage]] = [[]]
    var forallimages:[[UIImage]] = [[]]
    var getdatacount:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let umobj = Usersmanager()
        
        let solution = umobj.getBuyerReqresponse(bname: d2)
        
        if solution.count ?? 0 > 0
        {
            var forvno  = Array(repeating: String(), count: solution.count)
          //  var forsellercon  = Array(repeating: String(), count: solution.count)
            var forvname  = Array(repeating: String(), count: solution.count)
            var formodel  = Array(repeating: String(), count: solution.count)
            var forenginee  = Array(repeating: String(), count: solution.count)
            var forofferresponse  = Array(repeating: String(), count: solution.count)
            var forprice  = Array(repeating: Int(), count: solution.count)
            var foragent  = Array(repeating: String(), count: solution.count)
            var forseller  = Array(repeating: String(), count: solution.count)
            var forstatus  = Array(repeating: String(), count: solution.count)
            var forcity  = Array(repeating: String(), count: solution.count)
            var forofferToagent  = Array(repeating: Int(), count: solution.count)
            // var forstringtoimage  = Array(repeating: String(), count: solution.count)
            var forimage1  = Array(repeating: UIImage(), count: solution.count)
            var forimage2  = Array(repeating: UIImage(), count: solution.count)
            var forimage3  = Array(repeating: UIImage(), count: solution.count)
            //            var forallimages  = Array(Array(repeating: UIImage(), count: solution.count))
            
            
            var c:Int =  0
            var cc:Int =  0
            var go:Int  = solution.count
            getdatacount = solution.count
            
  
            
            while c<go
            {
                forvno[c] = solution[c].v_no
                
              //  forsellercon[c] = solution[c].s
                
                forvname[c] = solution[c].vehicle_name
                
                formodel[c] = solution[c].model
                
                forenginee[c] = solution[c].engine_no
                
                foragent[c] = solution[c].Agent_name
                
                forseller[c] = solution[c].Seller_name
                
                forprice[c] = solution[c].price
                
                forstatus[c] = solution[c].status
                
                forofferToagent[c] = solution[c].offer
                
                 forofferresponse[c] = solution[c].offer_Response
                
                forcity[c] = solution[c].address
                
                // forstringtoimage[c] = solution[c].v_image1
                forimage1[c] = Utilities.getimageFromurl(name: solution[c].v_image1)!
                
                forimage2[c] = Utilities.getimageFromurl(name: solution[c].v_image2)!
                
                forimage3[c] = Utilities.getimageFromurl(name: solution[c].v_image3)!
                
            
                c += 1
                
            }
            getmultipleimage = [forimage1,forimage2,forimage3]
            forimg1 = forimage1
            forimg2 = forimage2
            forimg3 = forimage3
            
            
            getvno = forvno
            getvname = forvname
            getmodel = formodel
            getengine  = forenginee
            getofferToagent = forofferToagent
            getofferResponse = forofferresponse
            getagentName = foragent
            getsellerName = forseller
            getstatus = forstatus
            getcity = forcity
            getprice = forprice
            
            getimage1 = forimage1
            getimage2 = forimage2
            getimage3 = forimage3
  
            print(forallimages)
            
            
            
        }
        navigationItem.hidesBackButton = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getvname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AgentRresponseTableViewCell = tviewforresponse.dequeueReusableCell(withIdentifier: "cell") as! AgentRresponseTableViewCell
        
        tviewforresponse.separatorStyle = UITableViewCell.SeparatorStyle.singleLine;
        
        cell.layer.borderWidth = 0.3
        cell.layer.shadowOffset = CGSize(width: -1, height: 0.3)
        if getsellerName[indexPath.row] == "Not Involved" //&& //getagentName[indexPath.row] != "Not Involved"
        {
            cell.lblagentOrseller.text = " Agent :"
        cell.vname.text = getvname[indexPath.row]
        cell.AgentName.text = getagentName[indexPath.row]
        cell.lblpurchase.text = getstatus[indexPath.row]
        cell.vimg.image = getimage1[indexPath.row]
            cell.status.text = getofferResponse[indexPath.row]
        }
       // if getagentName[indexPath.row] == "Not Involved" && getsellerName[indexPath.row] != "Not Involved"
        else
        {
            cell.lblagentOrseller.text = " Seller :"
            cell.vname.text = getvname[indexPath.row]
            cell.AgentName.text = getsellerName[indexPath.row]
            cell.lblpurchase.text = getstatus[indexPath.row]
            cell.vimg.image = getimage1[indexPath.row]
            cell.status.text = getofferResponse[indexPath.row]
        }
        
      //  print(cell.AgentName.text)
        return cell
    }
    //
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         let next:ViewResponseViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewResponseViewController") as! ViewResponseViewController
        
        if getsellerName[indexPath.row] == "Not Involved" && getagentName[indexPath.row] != "Not Involved"
        {
        //next.navigationController?.navigationBar.isHidden = false
            next.agentOseller = "Agent"
        next.vname = getvname[indexPath.row]
        next.price = getprice[indexPath.row]
        next.city = getcity[indexPath.row]
        next.model = getmodel[indexPath.row]
        next.aname = getagentName[indexPath.row]
        next.boffer = getofferToagent[indexPath.row]
        next.offerresponse = getofferResponse[indexPath.row]
        next.offerresponse = getofferResponse[indexPath.row]
        next.aname = getagentName[indexPath.row]
        next.vno = getvno[indexPath.row]
      //  next.sellerCon =
        
        next.img1 = forimg1[indexPath.row]
        next.img2 = forimg2[indexPath.row]
        next.img3 = forimg3[indexPath.row]
        }
        else if getagentName[indexPath.row] == "Not Involved" && getsellerName[indexPath.row] != "Not Involved"
        {
            next.agentOseller = "Seller"
            next.vname = getvname[indexPath.row]
            next.price = getprice[indexPath.row]
            next.city = getcity[indexPath.row]
            next.model = getmodel[indexPath.row]
            next.aname = getsellerName[indexPath.row]
            next.boffer = getofferToagent[indexPath.row]
            next.offerresponse = getofferResponse[indexPath.row]
            next.offerresponse = getofferResponse[indexPath.row]
            next.aname = getsellerName[indexPath.row]
            next.vno = getvno[indexPath.row]
            //  next.sellerCon =
            
            next.img1 = forimg1[indexPath.row]
            next.img2 = forimg2[indexPath.row]
            next.img3 = forimg3[indexPath.row]
            
        }
        self.navigationController?.pushViewController(next, animated: true)
        
        
    }
 

}
