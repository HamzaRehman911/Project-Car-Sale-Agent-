//
//  RequestedsellerViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 04/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class RequestedsellerViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
   

    @IBOutlet weak var txtinterior: UITextField!
    @IBOutlet weak var txtsteering: UITextField!
    @IBOutlet weak var txtseats: UITextField!
    @IBOutlet weak var txtbody: UITextField!
    @IBOutlet weak var txtbrakes: UITextField!
    @IBOutlet weak var txttyres: UITextField!
    @IBOutlet weak var txtengine: UITextField!
    @IBOutlet weak var abtn: UIButton!
    @IBOutlet weak var rbtn: UIButton!
    @IBOutlet weak var detailview: UIView!
    
    var getvidfromseller:String = ""
    var getphonefromreview:String = ""
    var strimg:[UIImage] = []
    var img1:UIImage!
    var img2:UIImage!
    var img3:UIImage!
//    var strimg1:[UIImage] = []
//    var strimg2:[UIImage] = []
//    var strimg3:[UIImage] = []
    var assignimg:[UIImage] = []
    
    var strlbl1:String!
    var strlbl2:String!
    var str3: String!
    var strprice:Int!
   
    
    
    var t = ["hamza","ali"]
    var tt = [#imageLiteral(resourceName: "slider6"),#imageLiteral(resourceName: "s9")]
    @IBOutlet weak var lblcarname: UILabel!
    
    
    @IBOutlet weak var lblmake: UILabel!
    
    @IBOutlet weak var lblmodel: UILabel!
    
    
    @IBOutlet weak var requestedcollectionview: UICollectionView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        assignimg = [img1,img2,img3]
        

        lblcarname.text = strlbl1
        lblmake.text = strlbl2
        lblmodel.text = str3
        
        detailview.layer.cornerRadius = 15
        detailview.clipsToBounds = true
        
     abtn.layer.cornerRadius = abtn.layer.frame.height/15
     rbtn.layer.cornerRadius = abtn.layer.frame.height/15
     requestedcollectionview.layer.cornerRadius = requestedcollectionview.layer.frame.height/15
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assignimg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = requestedcollectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RequestedSellerCollectionViewCell

        cell.layer.cornerRadius = cell.layer.frame.height/15
        cell.requestedimg.image = assignimg[indexPath.row]
        
        

        
        
        
        return cell
    }


    @IBAction func rejectbtn(_ sender: UIButton) {
        let mm = Usersmanager()
        let manager2 = ForMOdifySellerStatus()
        manager2.v_no = getvidfromseller
        manager2.status = "Rejected"
        manager2.Method = "Through Agent"
        
        let result2 = mm.Modifyseller(sellermodification: manager2)
        if result2 == true{
            
            let next:AgentHomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentHomeViewController") as! AgentHomeViewController
            self.navigationController?.pushViewController(next, animated: true)
            
            //showalert()
            
        }
        else{
            showalertforfailure()
            
        }
        
        
    }
    
    @IBAction func acceptbtn(_ sender: UIButton) {
        let agentm = Usersmanager()
        let manager = AgentModel()
        let manager2 = ForMOdifySellerStatus()
        
        
        
        manager.u_id = Int(d1)!
        manager.Agent_name = d2
        manager.v_no = getvidfromseller
        manager.engine = Int(txtengine.text!)!
        manager.tyres = Int(txttyres.text!)!
        manager.brakes = Int(txtbrakes.text!)!
        manager.body = Int(txtbody.text!)!
        manager.status = "Not Sold"
        manager.Price = strprice
        manager.Seats = Int(txtseats.text!)!
        manager.Steering = Int(txtsteering.text!)!
        manager.Interior = Int(txtinterior.text!)!
        manager.Method = "Seller Invovled"
        manager.Seller_contact = getphonefromreview
        
        
        manager2.v_no = getvidfromseller
        manager2.status = "Accepted"
        manager2.Method = "Through Agent"
        
       
 
             let result = agentm.addagent(acceptedAgentdata: manager)
             if result == true
            {
                
                let result2 = agentm.Modifyseller(sellermodification: manager2)
                
                if result2 == true
                {
                    if result && result2 == true
                    {
                        getagent.removeAll()
                        let next1:BuyerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerTabViewController") as! BuyerTabViewController
                        
                        next1.viewDidLoad()

                    }
//
//                        let next2:BuyerHomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerHomeViewController") as! BuyerHomeViewController
//                        next2.bfeaturecollview.reloadData()
//
//                        let next4:categoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "categoriesViewController") as! categoriesViewController
//                        next4.explorecollview.reloadData()
//
//                        let next3:SellerHomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "SellerHomeViewController") as! SellerHomeViewController
//                        next3.featureofcollectionview.reloadData()
//                    }

                let next:ReviewViewController = self.storyboard?.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
                    next.viewDidLoad()
                self.navigationController?.pushViewController(next, animated: true)
                
                    
                showalert()
                
            }
        }
        else{
            showalertforfailure()
            }
        
        
    }
    func showalert(){
        let alert=UIAlertController(title: "Request Accepted ", message: "Succesfull", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }
    func showalertforfailure(){
        let alert=UIAlertController(title: " Error ", message: "Server Error", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
        
    }
    
    
    //below code to move onto next collectionview by clicking leftand and right arrow button
    
    @IBAction func btnLeftArrowAction(_ sender: Any) {
        let collectionBounds = self.requestedcollectionview.bounds
        let contentOffset = CGFloat(floor(self.requestedcollectionview.contentOffset.x - collectionBounds.size.width))
        self.moveCollectionToFrame(contentOffset: contentOffset)
        
    }
    
    @IBAction func btnRightArrowAction(_ sender: Any) {
        
        let collectionBounds = self.requestedcollectionview.bounds
        let contentOffset = CGFloat(floor(self.requestedcollectionview.contentOffset.x + collectionBounds.size.width))
        self.moveCollectionToFrame(contentOffset: contentOffset)
        
    }
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        let frame: CGRect = CGRect(x : contentOffset ,y : self.requestedcollectionview.contentOffset.y ,width : self.requestedcollectionview.frame.width,height : self.requestedcollectionview.frame.height)
        self.requestedcollectionview.scrollRectToVisible(frame, animated: true)
    }
}
