//
//  ViewResponseViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 19/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Cosmos

class ViewResponseViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var getRating:String!

    @IBOutlet weak var btnpurcahseOutlet: UIButton!
    
    var forrating: CosmosView!
    
    @IBOutlet weak var lblvname: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    
    @IBOutlet weak var lblofferResponse: UILabel!
    @IBOutlet weak var lblboffer: UILabel!
    @IBOutlet weak var lblagentname: UILabel!
    @IBOutlet weak var lblmodel: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lblagentnameintext: UILabel!
    @IBOutlet weak var lblofferResponseintext: UILabel!
    @IBOutlet weak var imgcview: UICollectionView!
    
    
    var agentOseller:String = ""
    var allimg:[UIImage]!
    var img1:UIImage!
    var img2:UIImage!
    var img3:UIImage!
    @IBOutlet weak var lblagentOseller: UILabel!
    //
    var vname:String!
    var price:Int = 0
    var model:String!
    var city:String!
    var aname:String!
    var boffer:Int = 0
    var offerresponse:String!
    var vno:String!
    var sellerCon:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblvname.text = vname
        lblprice.text = "\(price)"
        lblmodel.text = model
        lblcity.text = city
        lblagentnameintext.text = aname
        lblagentname.text = aname
        lblofferResponse.text = offerresponse
        lblofferResponseintext.text = offerresponse
        lblboffer.text = String(boffer)
       // lblagentOseller.text = agentOseller
        if agentOseller == "Agent"
        {
            lblagentOseller.text = " Agent Name:"
        }
        else
        {
            lblagentOseller.text = " Seller Name:"
        }
        
        print(aname)
        
//        if offerresponse == "Pending"
//        {
//            btnpurcahseOutlet.isEnabled = false
//        }

        // Do any additional setup after loading the view.
        allimg = [img1,img2,img3]
    }
    

    @IBAction func btnPurchase(_ sender: UIButton) {
        

        //
        switch lblofferResponse.text {
        case "Pending":
            let alertforoffer = UIAlertController(title: "Your Offer is Pending ! You can not buy this vehicle", message: nil, preferredStyle: .alert)
            
            let cancelaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            // let okay = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertforoffer.addAction(cancelaction)
            //  alertforoffer.addAction(okay)
            
            self.present(alertforoffer , animated: true)
        case "Rejected":
            let alertforoffer = UIAlertController(title: "Your offer is Rejected ! You can not buy this vehicle", message: nil, preferredStyle: .alert)
            
            let cancelaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            // let okay = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertforoffer.addAction(cancelaction)
            self.present(alertforoffer , animated: true)

            
        case "Accepted":
            //
           
            
          //  below func(tfieldoffer name ca be differnet which will assign textfield to alert )
          //  alertforoffer.add
            
         //   let okaction = UIAlertAction(title: "Ok", style: .default, handler: self.okayfunc)
            
             let alertforoffer = UIAlertController(title: "Rate Your Agent", message: nil, preferredStyle: .alert)
             let space = UIAlertAction(title: "", style: .destructive, handler: nil)
             alertforoffer.addAction(space)
            
            let ratingview = CosmosView(frame: CGRect(x: 0,y: 0,width: 50, height: 100))
            
            ratingview.rating = 4.5
            ratingview.settings.starSize = 30
            ratingview.settings.emptyBorderColor = UIColor.black
            ratingview.settings.updateOnTouch = true
            ratingview.settings.fillMode = StarFillMode(rawValue: 1)!
            ratingview.settings.minTouchRating = 1
            ratingview.frame.origin.x = alertforoffer.view.frame.width/2 - 155
            ratingview.frame.origin.y = (68)
            
            ratingview.didTouchCosmos = {rate in
                self.getRating = "\(rate)"
                print("\(rate)")
            }
             alertforoffer.view.addSubview(ratingview)
             

            
            let rate = (UIAlertAction(title: "Rate", style: .default, handler: self.ratingDone
            ))
         
             let cancelaction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertforoffer.addAction(rate)
            alertforoffer.addAction(cancelaction)
            
            self.present(alertforoffer , animated: true)
      
        default:
            print("Something is Wrong")
        }


        
    }
    
    func ratingDone(alert:UIAlertAction)
    {
        
        print("Rating:",getRating)
        let bobj = BuyerModel()
        let aobj = AgentModel()
        let sobj = SellerModel()
        let vobj = VehicleModel()
        let um = Usersmanager()
        if agentOseller == "Agent"
        {
        bobj.u_id = Int(d1)!
        bobj.Buyer_name = d2
        bobj.v_no = vno
        bobj.Agent_name = lblagentname.text!
        bobj.status = "Purchased"
        
        
        aobj.Agent_name = lblagentname.text!
        aobj.v_no = vno
        aobj.status = "Sold"
        aobj.rating = String(getRating)
        
        let sendBuyer = um.modifybuyerforPur(buyerData: bobj)
        if sendBuyer == true{
            let sendAgent = um.modifyAgentforPur(agentData: aobj)
            if sendAgent == true
            {
                vobj.v_no = vno
                vobj.v_status = "Sold"
                let resv = um.modifyvtablewhilepur(vdata: vobj)
                
                getagent.removeAll()
                
                let refresh1:BuyerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerTabViewController") as! BuyerTabViewController
                
                refresh1.viewDidLoad()
                
                let refresh:AgentRresponseViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentRresponseViewController") as! AgentRresponseViewController
                refresh.viewDidLoad()
                
               
//
//                let refresh2:BuyerHomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerHomeViewController") as! BuyerHomeViewController
                
              //  refresh2.bfeaturecollview.
              //  refresh2.bfeaturecollview.reloadData()
               // refresh2.viewDidLoad()
                
                self.navigationController?.pushViewController(refresh, animated: true)
                print("Done Purchasing")
            }
        }
    }
        else
        {
            bobj.u_id = Int(d1)!
            bobj.Buyer_name = d2
            bobj.v_no = vno
            bobj.Seller_name = lblagentname.text!
            bobj.status = "Purchased"
            
            
          //  aobj.Agent_name = lblagentname.text!
            aobj.v_no = vno
            aobj.status = "Sold"
            aobj.Method = "Private"
            aobj.rating = String(getRating)
            
            let sendBuyer = um.modifybuyerSforPur(buyerData: bobj)
            if sendBuyer == true{
                let sendAgent = um.modifyAtableForSellerbyMoffer(Adata: aobj)
                if sendAgent == true
                {
                    vobj.v_no = vno
                    vobj.v_status = "Sold"
                    let resv = um.modifyvtablewhilepur(vdata: vobj)
                    
                    sobj.Seller_name = lblagentname.text!
                    sobj.v_no = vno
                    sobj.Method = "Private"
                    sobj.status = "Sold"
                    let sendseller = um.modifyStablewhilepurbyMoffer(Sdata: sobj)
                    if sendseller == true
                    {
                        let refresh:AgentRresponseViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentRresponseViewController") as! AgentRresponseViewController
                        refresh.viewDidLoad()
                        
                     //   getagent.removeAll()
                        
                        let refresh1:BuyerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerTabViewController") as! BuyerTabViewController
                        
                        refresh1.viewDidLoad()
                        let refresh2:BuyerHomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerHomeViewController") as! BuyerHomeViewController
                       // refresh2.viewDidLoad()
                        self.navigationController?.pushViewController(refresh, animated: true)
                        print("Done Purchasing")
                    }
                    print("Done Purchasing")
                }
            }
        }
        
    }
    
    
    //
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allimg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let move: ResponseVimgCollectionViewCell = imgcview.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! ResponseVimgCollectionViewCell
        
        move.vimg.image = allimg[indexPath.row]
        
        return move
    }
}
