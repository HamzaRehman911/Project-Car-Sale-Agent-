//
//  VehicleDetailViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 03/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class VehicleDetailViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    //var img = [#imageLiteral(resourceName: "n6"),#imageLiteral(resourceName: "n5")]
    
    var img1:UIImage!
    var img2:UIImage!
    var img3:UIImage!
    var vname:String!
    var price:Int!
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
    
    
    var img = [UIImage]()
    @IBOutlet weak var detailview: UIView!
    @IBOutlet weak var collectionvforimg: UICollectionView!
    //outlets
    
    @IBOutlet weak var lblvname: UILabel!
    @IBOutlet weak var lblvprice: UILabel!
    @IBOutlet weak var lblengineinsp: UILabel!
    @IBOutlet weak var lbltyresinsp: UILabel!
    @IBOutlet weak var lblbrakesinsp: UILabel!
    @IBOutlet weak var lblbodyinsp: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lblagentname: UILabel!
    @IBOutlet weak var lblagentcontact: UILabel!
    @IBOutlet weak var lblvno: UILabel!
    @IBOutlet weak var lblmake: UILabel!
    @IBOutlet weak var lblmodel: UILabel!
    @IBOutlet weak var lblengno: UILabel!
    
    @IBOutlet weak var backbar: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        collectionvforimg.layer.cornerRadius = collectionvforimg.frame.height/16
        // Do any additional setup after loading the view.
        detailview.layer.cornerRadius = detailview.frame.width/10
        //
        
        //
        img = [img1,img2,img3]
        lblvname.text = vname
        lblvprice.text = String(price)
        lblengineinsp.text = String(engine)
        lbltyresinsp.text = String(tyres)
        lblbrakesinsp.text = String(brakes)
        lblbodyinsp.text = String(body)
        lblcity.text = city
        lblagentname.text = agentname
        lblagentcontact.text = contact
        lblvno.text = vno
        lblmake.text = manu
        lblmodel.text = model
        lblengno.text = engno
        
    
    }
   
    //
    //below code to move onto next collectionview by clicking leftand and right arrow button
    
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

//    @IBAction func btnbackbar(_ sender: UIBarButtonItem) {
//        let next:SearchViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
//
//        self.navigationController?.pushViewController(next, animated: true)
//    }
    //

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let next = collectionvforimg.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! vehicleImgCollectionViewCell
        next.imgforvehicles.image = img[indexPath.row]

        return next
    }

}
