
//
//  AgentDetailViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 05/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Cosmos

class AgentDetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    //
    var tfieldforoffer:UITextField!
    
    
    @IBOutlet weak var btnaname: UIButton!
    @IBOutlet weak var lblagentorsellerdetail: UILabel!
    
    @IBOutlet weak var lblprivatevehicle: UILabel!
    @IBOutlet weak var vno: UILabel!
    @IBOutlet weak var vnamee: UILabel!
    @IBOutlet weak var pricee: UILabel!
    @IBOutlet weak var makee: UILabel!
    @IBOutlet weak var modell: UILabel!
    @IBOutlet weak var cityy: UILabel!
    @IBOutlet weak var lblengine: UILabel!
    @IBOutlet weak var lblbrake: UILabel!
    @IBOutlet weak var lblbody: UILabel!
    @IBOutlet weak var lbltyre: UILabel!
    @IBOutlet weak var Aname: UILabel!
    @IBOutlet weak var cont: UILabel!
    
    @IBOutlet weak var imgrating: UIImageView!
    @IBOutlet weak var lblavratingtxt: UILabel!
    @IBOutlet weak var lblavrating: UILabel!
    
    
    @IBOutlet weak var btnmakenaoffer: UIButton!
    @IBOutlet weak var btnbuy: UIButton!
    var timg = [#imageLiteral(resourceName: "n12"),#imageLiteral(resourceName: "slider6"),#imageLiteral(resourceName: "n12")]
    var getrating:String = ""
    
    @IBOutlet weak var collectionv: UICollectionView!
    @IBOutlet weak var viewagentdetail: UIView!
    //txtby mistakelbl below
    var getRating:String = ""
    var Ownerid:Int = 0
    var vname:String = ""
    var price:Int = 0
    var make:String = ""
    var model:String = ""
    var engine:Int = 0
    var tyre:Int = 0
    var brake:Int = 0
    var body:Int = 0
    var aname:String = ""
    var contact:String = ""
    var city:String = ""
    var vnumber:String = ""
    var privatev:String = ""
    var agentorseller:String = ""
    var img1:UIImage!
    var img2:UIImage!
    var img3:UIImage!
    var allimg = [UIImage]()
    
    @IBOutlet weak var rating: CosmosView!
    var str1:String!
    var str2:String!
    var strimg:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Aname.isHidden = true
        vnamee.text = vname
       pricee.text = "\(price)"
        makee.text = make
        modell.text = model
        cityy.text = city
        lblengine.text = String(engine)
        lblbrake.text = String(brake)
        lblbody.text = String(body)
        lbltyre.text = String(tyre)
        Aname.text = aname
        cont.text = contact
        vno.text = vnumber
        lblagentorsellerdetail.text = agentorseller
        lblprivatevehicle.text = privatev
       // btnaname.titleLabel?.text = aname
        btnaname.setTitle(aname, for: .normal)
        print(btnaname.titleLabel?.text)
        if privatev == "Agent"
        {
            lblprivatevehicle.isHidden = true
            print(getrating)
            lblavratingtxt.text = getrating
           // btnaname.titleLabel?.text = Aname.text
            //print(btnaname.titleLabel?.text)
            
        }
        else
        {
            lblprivatevehicle.isHidden = false
           // btnmakenaoffer.isHidden = true
            lblavratingtxt.text = getrating
            btnaname.isEnabled = false
        }
        allimg = [img1,img2,img3]
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = true
    //
        viewagentdetail.layer.shadowOffset = CGSize(width: 8,height: 8)
        viewagentdetail.layer.shadowRadius = 4
        viewagentdetail.layer.shadowOpacity = 0.3
        
        btnbuy.layer.cornerRadius = btnbuy.layer.frame.height/14
        
        btnmakenaoffer.layer.cornerRadius = btnbuy.layer.frame.height/14
        //rating
        rating.didTouchCosmos = {rate in
            self.getrating = "\(rate)"
            print("Rated:\(rate)")
            
            
            self.rating.isHidden = true
            
        }
       
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = true
        
         self.rating.isHidden = true
        
       
        btnaname.setTitle(aname, for: .normal)
    }
    override func viewDidAppear(_ animated: Bool) {
         btnaname.setTitle(aname, for: .normal)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let next:AgentDetailVImgCollectionViewCell = collectionv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AgentDetailVImgCollectionViewCell
        next.layer.cornerRadius = next.layer.frame.height/14
        
        next.vimg.image = allimg[indexPath.row]
        
        return next
    }
    //
    
    @IBAction func btnbuy(_ sender: UIButton) {
     
        //
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
        
        
        
        let rate = (UIAlertAction(title: "Rate", style: .default, handler: self.ratingClick
        ))
        
        let cancelaction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertforoffer.addAction(rate)
        alertforoffer.addAction(cancelaction)
        
        self.present(alertforoffer , animated: true)
        
        
        //
        
        
        
}
    //
    func ratingClick(alert:UIAlertAction)
    {
        let objM = Usersmanager()
        let Bobj = BuyerModel()
        let Aobj = AgentModel()
        let Sobj = SellerModel()
        let vobj = VehicleModel()
        
        var s:String = Aname.text!
        var s2:String = "Purchased"
        var s3:String = "No Response"
        var s4:String = "No offer"
        if privatev == "Agent"
        {
            Bobj.u_id = Int(d1)!
            Bobj.Buyer_name = d2
            Bobj.v_no = vno.text!
            Bobj.vehicle_name = vnamee.text!
            Bobj.price = Int(pricee.text!)!
            Bobj.status = s2
            Bobj.offer_Response = s3
            Bobj.offer = 0
            Bobj.Agent_name = s
            Bobj.Seller_name = "Not Involved"
            let result = objM.addBuyer(buyer: Bobj)
            
            if result == true
            {
                Aobj.v_no = vno.text!
                Aobj.rating = "\(getRating)"
                Aobj.status = "Sold"
                // Aobj.rating = getrating
                //  Aobj.offerBy_buyer = "No offer"
                //   Aobj.offer_Response = "No Response"
                
                let res = objM.ModifyAgent(agentD: Aobj)
                
                if res == true
                {
                    vobj.v_no = vno.text!
                    vobj.v_status = "Sold"
                    let resv = objM.modifyvtablewhilepur(vdata: vobj)
                    
                    let next2:BuyerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerTabViewController") as! BuyerTabViewController
                    
                    getagent.removeAll()
                    
                    next2.viewDidLoad()
                    
                    //                        let next4:BuyerHomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerHomeViewController") as! BuyerHomeViewController
                    //                        next4.viewDidLoad()
                    
                    
                    let next3:categoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "categoriesViewController") as! categoriesViewController
                    self.navigationController?.pushViewController(next3, animated: true)
                    print("Sold sucessfully")                }
            }
        }
        else
        {
            Bobj.u_id = Int(d1)!
            Bobj.Buyer_name = d2
            Bobj.v_no = vno.text!
            Bobj.vehicle_name = vnamee.text!
            Bobj.price = Int(pricee.text!)!
            Bobj.status = s2
            Bobj.offer_Response = s3
            Bobj.offer = 0
            Bobj.Seller_name = s
            Bobj.Agent_name = "Not Involved"
            let result = objM.addBuyer(buyer: Bobj)
            
            if result == true
            {
                Aobj.u_id = Ownerid
                Aobj.v_no = vno.text!
                Aobj.rating = "\(getRating)"
                Aobj.status = "Sold"
                // Aobj.rating = getrating
                //  Aobj.offerBy_buyer = "No offer"
                //   Aobj.offer_Response = "No Response"
                
                let res = objM.modifyAtableForSeller(Adata: Aobj)
                
                if res == true
                {
                    Sobj.u_id = Ownerid
                    Sobj.v_no = vno.text!
                    Sobj.status = "Sold"
                    let res2 = objM.modifyStablewhilepur(Sdata: Sobj)
                    if res2 == true
                    {
                        vobj.v_no = vno.text!
                        vobj.v_status = "Sold"
                        let resv = objM.modifyvtablewhilepur(vdata: vobj)
                        
                        let next2:BuyerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerTabViewController") as! BuyerTabViewController
                        
                        getagent.removeAll()
                        
                        next2.viewDidLoad()
                        
                        let next3:categoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "categoriesViewController") as! categoriesViewController
                         self.navigationController?.pushViewController(next3, animated: true)
                        print("Sold sucessfully")
                    }
                    
                }
            }
        }
        
        // print(getrating)
    }
    //
    
    @IBAction func btnmakeanoffer(_ sender: UIButton) {
        var getresponseV:String = ""
        let umm = Usersmanager()
        let RestU = umm.restrictbuyer(vno: vno.text!,bname: d2)
        if RestU.count ?? 0 > 0
        {
            getresponseV = RestU[0].offer_Response
        }
        
        
        if getresponseV == "Pending" || getresponseV == "Rejected" || getresponseV == "Accepted"
        {
            let alert = UIAlertController(title: " Restriction !", message: "You have already made offer", preferredStyle: .alert)
            
            let cancelaction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(cancelaction)
            
            self.present(alert , animated: true)

        }
        //
        else
        {
        let alertforoffer = UIAlertController(title: " Make offer !", message: nil, preferredStyle: .alert)
        
        //below func(tfieldoffer name ca be differnet which will assign textfield to alert )
        alertforoffer.addTextField(configurationHandler: tfieldforoffer)
        
        let okaction = UIAlertAction(title: "Send", style: .default, handler: self.okayfunc)
        
        let cancelaction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
        alertforoffer.addAction(okaction)
        alertforoffer.addAction(cancelaction)
        
        self.present(alertforoffer , animated: true)
        
        }
        //
        
    }
    
    func tfieldforoffer(assigntfield:UITextField)
    {
        tfieldforoffer = assigntfield
        tfieldforoffer.placeholder = "Input your offer"
    }
    
    func okayfunc(alertokay:UIAlertAction)
    {
        if privatev == "Agent"
        {
        print("Now your done")
        print(tfieldforoffer.text!)
        
        let objM = Usersmanager()
        let Bobj = BuyerModel()
        //
        Bobj.u_id = Int(d1)!
        Bobj.Buyer_name = d2
        Bobj.v_no = vno.text!
        Bobj.vehicle_name = vnamee.text!
            Bobj.price = Int(pricee.text!)!
        Bobj.status = "Not Purchased"
        Bobj.offer_Response = "Pending"
            Bobj.offer = Int(tfieldforoffer.text!)!
        Bobj.Agent_name = Aname.text!
        Bobj.Seller_name = "Not Involved"
        
        let result3 = objM.addBuyer(buyer: Bobj)
        
        if result3 == true
        {
            let next3:categoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "categoriesViewController") as! categoriesViewController
            self.navigationController?.pushViewController(next3, animated: true)
        print("Damn Man your done")
        }
    }
        else
        {
            let objM = Usersmanager()
            let Bobj = BuyerModel()
            //
            Bobj.u_id = Int(d1)!
            Bobj.Buyer_name = d2
            Bobj.v_no = vno.text!
            Bobj.vehicle_name = vnamee.text!
            Bobj.price = Int(pricee.text!)!
            Bobj.status = "Not Purchased"
            Bobj.offer_Response = "Pending"
            Bobj.offer = Int(tfieldforoffer.text!)!
            Bobj.Seller_name = Aname.text!
            Bobj.Agent_name = "Not Involved"
            
            let result3 = objM.addBuyer(buyer: Bobj)
            
            if result3 == true
            {
                let next3:categoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "categoriesViewController") as! categoriesViewController
                self.navigationController?.pushViewController(next3, animated: true)
                print("Damn Man your done")
            }
        }
    }
    
    
    //
    @IBAction func btnaname(_ sender: UIButton) {
        let next3:agentlistViewController = self.storyboard?.instantiateViewController(withIdentifier: "agentlistViewController") as! agentlistViewController
        
        next3.getaname = (btnaname.titleLabel?.text)!
        self.navigationController?.pushViewController(next3, animated: true)
    }
    
}
