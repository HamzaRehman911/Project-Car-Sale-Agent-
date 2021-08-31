//
//  RequestDataViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 20/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class RequestDataViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
 
    @IBOutlet weak var viewforboffer: UIView!
    @IBOutlet weak var cviewforimg: UICollectionView!
    //
    var Forallimg:[UIImage]!
    var Forimg1:UIImage!
    var Forimg2:UIImage!
    var Forimg3:UIImage!
    //
    var Forbname:String!
    var Forvname:String!
    var Forvno:String!
    var Forprice:Int = 0
    var Foroffertoagent:Int!
    var Formodel:String!
    var Forengineno:String!
    var Forcontact:String!
    var Forcity:String!

    //
    
    @IBOutlet weak var lblvname: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblmodel: UILabel!
    @IBOutlet weak var lblvno: UILabel!
    @IBOutlet weak var lblengineno: UILabel!
    @IBOutlet weak var lblbname: UITextField!
    @IBOutlet weak var lblcontatc: UITextField!
    @IBOutlet weak var lblcity: UITextField!
    @IBOutlet weak var lblofferbybuyer: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblvname.text = Forvname
        lblprice.text = "\(Forprice)"
        lblmodel.text = Formodel
        lblvno.text = Forvno
        lblbname.text = Forbname
        lblcontatc.text = Forcontact
        lblcity.text = Forcity
        lblengineno.text = Forengineno
        lblofferbybuyer.text = String(Foroffertoagent)
        
        Forallimg = [Forimg1,Forimg2,Forimg3]
        
        //
         viewforboffer.layer.cornerRadius = viewforboffer.layer.frame.height/16
        
        cviewforimg.layer.cornerRadius = cviewforimg.layer.frame.height/14
        
        lblbname.isEnabled = false
        lblcontatc.isEnabled = false
        lblcity.isEnabled = false
        lblofferbybuyer.isEnabled = false
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Forallimg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let move: RequestvImgCollectionViewCell = cviewforimg.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! RequestvImgCollectionViewCell
        
        move.layer.cornerRadius = move.layer.frame.height/14
        
        move.vimg.image = Forallimg[indexPath.row]
        
        return move
    }
    
    //for button action
    
    
    @IBAction func btnAcceptOffer(_ sender: UIButton) {
        
        let um = Usersmanager()
        let buyerObj = BuyerModel()
        
        if d6 == "Agent"
        {
        buyerObj.Buyer_name = Forbname
        buyerObj.v_no = Forvno
        buyerObj.offer_Response = "Accepted"
        buyerObj.Agent_name = d2
        let result = um.Modifybuyerbyagent(buyerD: buyerObj)
        
        
        if result == true
        {
            let update:BuyerRequestViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerRequestViewController") as! BuyerRequestViewController
            
            update.viewDidLoad()
            self.navigationController?.pushViewController(update, animated: true)
            print("Done bro")
        }
    }
        else
        {
            buyerObj.Buyer_name = Forbname
            buyerObj.v_no = Forvno
            buyerObj.offer_Response = "Accepted"
            buyerObj.Seller_name = d2
          //  buyerObj.Agent_name = "Not Involved"
            let result = um.modifyBuyerbySeller(buyerD: buyerObj)
            
            
            if result == true
            {
                let update:BuyerRequestViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerRequestViewController") as! BuyerRequestViewController
                
                update.viewDidLoad()
                self.navigationController?.pushViewController(update, animated: true)
                print("Done bro")
            }
        }
    }
    

    @IBAction func btnRejectOffer(_ sender: UIButton) {
        
        let um = Usersmanager()
        let buyerObj = BuyerModel()
        if d6 == "Agent"
        {
        buyerObj.Buyer_name = Forbname
        buyerObj.v_no = Forvno
        buyerObj.offer_Response = "Rejected"
        buyerObj.Agent_name = d2
        let result = um.Modifybuyerbyagent(buyerD: buyerObj)
        
        
        if result == true
        {
            let update:BuyerRequestViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerRequestViewController") as! BuyerRequestViewController
            
            update.viewDidLoad()
            self.navigationController?.pushViewController(update, animated: true)
            print("Done bro")
        }
    }
        else
        {
            buyerObj.Buyer_name = Forbname
            buyerObj.v_no = Forvno
            buyerObj.offer_Response = "Rejected"
            buyerObj.Seller_name = d2
            let result = um.modifyBuyerbySeller(buyerD: buyerObj)
            
            
            if result == true
            {
                let update:BuyerRequestViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerRequestViewController") as! BuyerRequestViewController
                
                update.viewDidLoad()
                self.navigationController?.pushViewController(update, animated: true)
                print("Done bro")
            }
        }
    }
    
}
