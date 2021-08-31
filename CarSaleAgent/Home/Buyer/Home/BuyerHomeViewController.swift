//
//  BuyerHomeViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 04/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class BuyerHomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource {
  

    
    var issideviewopen:Bool = false

    //tableviewofmenu
    
    @IBOutlet weak var btableview: UITableView!
    //viewofmenu
    @IBOutlet weak var viewofmenu: UIView!
    
    //collectionviewofslider
    @IBOutlet weak var Bslidecview: UICollectionView!
    //forfeature collectionview
    
    @IBOutlet weak var bfeaturecollview: UICollectionView!
    
    var forvname:[String] = []
    var foragent:[String] = []
    var forcity:[String] = []
    var forprice:[String] = []
    var forvno:[String] = []
    
    
    //assignation
    
    @IBOutlet weak var pageslider: UIPageControl!
    var lblmenutext = ["Home","Buy Vehicle","Search","Profile","Logout"]
    
    var imgmenudata = [#imageLiteral(resourceName: "home4"),#imageLiteral(resourceName: "plus-sign"),#imageLiteral(resourceName: "search"),#imageLiteral(resourceName: "profile-user"),#imageLiteral(resourceName: "logout")]
    
    
    
    
    
    //for slider
        var imgarr=[UIImage(named: "x4")!,UIImage(named: "x2")!,UIImage(named: "x3")!]
    
    var imgarrfeature = [#imageLiteral(resourceName: "n5"),#imageLiteral(resourceName: "n12"),#imageLiteral(resourceName: "n8"),#imageLiteral(resourceName: "n9"),#imageLiteral(resourceName: "s9"),#imageLiteral(resourceName: "s8"),#imageLiteral(resourceName: "slider6"),#imageLiteral(resourceName: "s5"),#imageLiteral(resourceName: "slider2"),#imageLiteral(resourceName: "s8")]
    var lblarrfeature = ["Ballion","Bico","Bazat","Bohimia","Bupala","Bteward","Baqlain","Buzu","Bamuels","Bilk"]
    //
    
    
    var timer = Timer()
    var counter = 0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
      //  print(toAccessagentData[0].vname)
        self.navigationItem.titleView?.isHidden = false;
        self.title = "Buyer Home"
        self.navigationItem.title = "Buyer Home"
        
        
        
        
        viewofmenu.isHidden = true
       
        issideviewopen = false
        

        pageslider.numberOfPages == imgarr.count
        pageslider.currentPage = 0
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.30, target: self, selector: #selector(self.changeimage), userInfo: nil, repeats: true)
        }
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        

        //print(forvname)
        print(toAccessagentvname)
        bfeaturecollview.reloadData()
    }
    
    //
    @objc func  changeimage() {
        if counter < imgarr.count
        {
            let index = IndexPath.init(item: counter, section: 0)
            self.Bslidecview.scrollToItem(at:index, at: .centeredHorizontally, animated: true)
            
            pageslider.currentPage = counter
            counter+=1
            
            
        }
        else
        {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            
            self.Bslidecview.scrollToItem(at:index, at: .centeredHorizontally, animated: true)
            
            
            pageslider.currentPage = counter
            counter = 1
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.bfeaturecollview.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //self.bfeaturecollview.reloadData()
    }
    
    
    
    
    
    //collectionview
    

  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     if collectionView == self.Bslidecview
     {
        return imgarr.count
        }
        else
     {
        return getagent.count
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.Bslidecview
        {
        let cell = Bslidecview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BslideCollectionViewCell
        
        cell.slideimg.image=imgarr[indexPath.row]
        // cell.lblagent.text=agentlbl[indexPath.row]
        return cell
        }
        else{
            
            let cell:bfeatureCollectionViewCell = bfeaturecollview.dequeueReusableCell(withReuseIdentifier: "fcell", for: indexPath) as! bfeatureCollectionViewCell
            
            cell.lblvtype.isHidden = false
            
            cell.layer.cornerRadius = cell.frame.height/14
            
            cell.imgoffeature.image = getagent[indexPath.row].vimage
           
            
            cell.lbloffeature.text = getagent[indexPath.row].vname
            
             cell.lblvtype.text = getagent[indexPath.row].u_name
            
            if getagent[indexPath.row].r_name == "Seller"
            {
               // cell.lblvtype.text = "Owner"
                cell.lblvtype.isHidden = true
            }
//            else
//            {
//
//               // cell.lblvtype.isHidden = true
//            }
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            
            return cell
        }
    

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.bfeaturecollview
        {
            
            let next:FeaturevehicleDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "FeaturevehicleDetailViewController") as! FeaturevehicleDetailViewController
            
            next.agentname = getagent[indexPath.row].u_name
            next.vName = getagent[indexPath.row].vname
            next.price = getagent[indexPath.row].price
            next.contact = getagent[indexPath.row].phoneno
            next.manu = getagent[indexPath.row].manufacturer
            next.model = getagent[indexPath.row].model
            next.vno = getagent[indexPath.row].vno
            next.engno = getagent[indexPath.row].eng_no
            next.city = getagent[indexPath.row].city
            next.engine = getagent[indexPath.row].engine
            next.tyres = getagent[indexPath.row].tyres
            next.brakes = getagent[indexPath.row].brakes
            next.body = getagent[indexPath.row].body
            next.role = getagent[indexPath.row].r_name
            next.method = getagent[indexPath.row].Method
            
            next.img1 = getagent[indexPath.row].vimage
            next.img2 = getagent[indexPath.row].vimage2
            next.img3 = getagent[indexPath.row].vimage3
            
            self.navigationController?.pushViewController(next, animated: true)
            
            
        }
    }
    
    
    //tableviewfuncs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lblmenutext.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:BmenuTableViewCell = btableview.dequeueReusableCell(withIdentifier: "cell") as! BmenuTableViewCell
        
        cell.imgofmenu.image = imgmenudata[indexPath.row]
        
        cell.lblofmenu.text = lblmenutext[indexPath.row]
        
        return cell
        
        
    }
    
    //buttonofmenu
    
    @IBAction func btnmenu(_ sender: UIButton) {
        
        
        btableview.isHidden = false
        viewofmenu.isHidden = false
        self.view.bringSubviewToFront(viewofmenu)
        if !issideviewopen{
            issideviewopen = true
            
            viewofmenu.frame = CGRect(x: 0, y: 127, width: 1, height: 346)
            
            btableview.frame = CGRect(x: 0, y: 0, width: 0, height: 346)
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            viewofmenu.frame = CGRect(x: 1, y: 150, width: 191 , height: 295)
            
            btableview.frame = CGRect(x: 0, y: 0, width: 191, height: 295)
            
            UIView.commitAnimations()
        }
        else{
            
            btableview.isHidden = true
            viewofmenu.isHidden = true
            
            
            issideviewopen = false
            
            viewofmenu.frame = CGRect(x: 1, y: 150, width: 191, height: 295)
            
            btableview.frame = CGRect(x: 0, y: 0, width: 191, height: 295)
            
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            viewofmenu.frame = CGRect(x: 0, y: 127, width: 1, height: 346)
            
            btableview.frame = CGRect(x: 0, y: 0, width: 0, height: 346)
            
            UIView.commitAnimations()
            
            
        }
        
        
    }
    
    //btnregistered with agent
    
    @IBAction func btnregister(_ sender: UIButton) {
        
        let cell:RegisterBuyerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterBuyerViewController") as! RegisterBuyerViewController
        
        self.navigationController?.pushViewController(cell, animated: true)
    }
    

    //btnrefer vehhicle
    
    @IBAction func btnreferedV(_ sender: UIButton) {
        
        
        //AgentvehicleTableViewCell    GetRefVViewController
//        let next0:AgentvehicleTableViewCell = tviewforv.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AgentvehicleTableViewCell
        
        let cell0:GetRefVViewController = self.storyboard?.instantiateViewController(withIdentifier: "GetRefVViewController") as! GetRefVViewController
        
        self.navigationController?.pushViewController(cell0, animated: true)
        
    }
    
    
    
    
}
