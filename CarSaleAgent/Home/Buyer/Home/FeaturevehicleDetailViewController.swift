//
//  FeaturevehicleDetailViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 18/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class FeaturevehicleDetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
 
    @IBOutlet weak var lblAgentOrSellerDetail: UILabel!
    @IBOutlet weak var lblAgentOrSellername: UILabel!
    @IBOutlet weak var lblAgentOrSellernameinsert: UILabel!
    @IBOutlet weak var lblAgentOrSellercontact: UILabel!
    @IBOutlet weak var lblrole: UILabel!
    
    @IBOutlet weak var vname: UILabel!
    @IBOutlet weak var vprice: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var lblagentname: UILabel!
    @IBOutlet weak var lblcontact: UILabel!
    @IBOutlet weak var lblvno: UILabel!
    @IBOutlet weak var lblmake: UILabel!
    @IBOutlet weak var lblmodel: UILabel!
    @IBOutlet weak var lblengnno: UILabel!
    @IBOutlet weak var lbllocation: UILabel!
    @IBOutlet weak var lblengine: UILabel!
    @IBOutlet weak var lblbrakes: UILabel!
    @IBOutlet weak var lblbody: UILabel!
    @IBOutlet weak var lbltyres: UILabel!
    @IBOutlet weak var lblmethod: UILabel!
    
    var img1:UIImage!
    var img2:UIImage!
    var img3:UIImage!
    var vName:String!
    var price:Int = 0
    var engine:Int = 0
    var tyres:Int = 0
    var brakes:Int = 0
    var body:Int = 0
    var city:String!
    var agentname:String!
    var contact:String!
    var vno:String!
    var manu:String!
    var model:String!
    var engno:String!
    var role:String!
    var method:String!
    
    var imgforv = [UIImage]()
    
    
    
    var img = [#imageLiteral(resourceName: "sa"),#imageLiteral(resourceName: "s10"),#imageLiteral(resourceName: "n1")]

    @IBOutlet weak var collectionvforimg: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = view1.frame.height/16
        
        view2.layer.cornerRadius = view2.frame.height/16
        
        view3.layer.cornerRadius = view3.frame.height/16
       // view4.layer.cornerRadius = view4.frame.height/16
        // Do any additional setup after loading the view.
        //
        imgforv = [img1,img2,img3]
        vname.text = vName
        vprice.text = "\(String(describing: price))"
        lblengine.text = String(engine)
        lbltyres.text = String(tyres)
        lblbrakes.text = String(brakes)
        lblbody.text = String(body)
        lbllocation.text = city
        lblAgentOrSellernameinsert.text = agentname
        lblcontact.text = contact
        lblvno.text = vno
        lblmake.text = manu
        lblmodel.text = model
        lblengnno.text = engno
        lblrole.text = role
        lblmethod.text = method
        if role == "Agent"
        {
            lblAgentOrSellerDetail.text = "Agent Detail :"
            lblAgentOrSellername.text = "Agent Name :"
            lblAgentOrSellercontact.text = "Agent Contact :"
            lblmethod.isHidden = true
        }
        else if role == "Seller" && method == "Private"
        {
            lblAgentOrSellerDetail.text = "Seller Detail :"
            lblAgentOrSellername.text = "Seller Name :"
            lblAgentOrSellercontact.text = "Seller Contact :"
            lblmethod.text = "Private Vehicle"
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let next = collectionvforimg.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FeatureVehicleDetailCollectionViewCell
        next.imgforvehicle.image = imgforv[indexPath.row]
        
        return next
        
    }

    
    
    //
    
    @IBAction func btnLeftArrowAction(_ sender: Any) {
        let collectionBounds = self.collectionvforimg.bounds
        let contentOffset = CGFloat(floor(self.collectionvforimg.contentOffset.x - collectionBounds.size.width))
        self.moveCollectionToFrame(contentOffset: contentOffset)
        
    }
    
    @IBAction func btnRightArrowAction(_ sender: Any) {
        
        let collectionBounds = self.collectionvforimg.bounds
        let contentOffset = CGFloat(floor(self.collectionvforimg.contentOffset.x + collectionBounds.size.width))
        self.moveCollectionToFrame(contentOffset: contentOffset)
        
    }
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        let frame: CGRect = CGRect(x : contentOffset ,y : self.collectionvforimg.contentOffset.y ,width : self.collectionvforimg.frame.width,height : self.collectionvforimg.frame.height)
        self.collectionvforimg.scrollRectToVisible(frame, animated: true)
    }
    
}
