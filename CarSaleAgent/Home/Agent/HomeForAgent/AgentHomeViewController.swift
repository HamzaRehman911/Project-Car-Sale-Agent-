//
//  AgentHomeViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 04/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class AgentHomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate {
 
    //
    //for agentdata in featurecell(collectionviewcell)
    //
    
    var issideviewopen:Bool = false
 
@IBOutlet weak var menuview: UIView!
    
    
//slideimgcollectionview
    @IBOutlet weak var scollectionview: UICollectionView!
    //featurecollectionview
    
    @IBOutlet weak var featureofcollectionview: UICollectionView!
    
    
    
    //tableviewofmenu
    
    
    @IBOutlet weak var menuoftableview: UITableView!

    var imgarr=[UIImage(named: "x4")!,UIImage(named: "x3")!,UIImage(named: "x2")!]
    
    var lblmenutext = ["Home","Review Report","Search","Profile","Logout"]
    
    var imgmenudata = [#imageLiteral(resourceName: "home4"),#imageLiteral(resourceName: "plus-sign"),#imageLiteral(resourceName: "search"),#imageLiteral(resourceName: "profile-user"),#imageLiteral(resourceName: "logout")]
    
    var imgarrfeature = [#imageLiteral(resourceName: "n6"),#imageLiteral(resourceName: "n12"),#imageLiteral(resourceName: "n14"),#imageLiteral(resourceName: "n10"),#imageLiteral(resourceName: "s9"),#imageLiteral(resourceName: "n1"),#imageLiteral(resourceName: "slider6"),#imageLiteral(resourceName: "s5"),#imageLiteral(resourceName: "slider2"),#imageLiteral(resourceName: "s8")]
    var lblarrfeature = ["Stallion","Simon","Santa","Singara","Simpala","Steward","Saqlain","Suzu","Samuels","Silk"]
    
    
    @IBOutlet weak var pageslide: UIPageControl!
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView?.isHidden = false;
        self.title = "Home"
        self.navigationItem.title = "Home"
        //featureofcollectionview.layer.cornerRadius = featureofcollectionview.frame.height / 6
        //featureofcollectionview.clipsToBounds = true
        
        //menu
        
        menuview.isHidden = true
        menuoftableview.backgroundColor = UIColor.groupTableViewBackground
        issideviewopen = false
   
        
        //pageslide
        
        pageslide.numberOfPages == imgarr.count
        pageslide.currentPage = 0
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.30, target: self, selector: #selector(self.changeimage), userInfo: nil, repeats: true)
            
            
            
        }
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        
        self.navigationItem.titleView?.isHidden = false;
        self.title = "Home"
        self.navigationItem.title = "Home"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.featureofcollectionview.reloadData()
        //
        navigationController?.setNavigationBarHidden(true, animated: animated)
        // Set to new colour for whole app
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        // Or, Set to new colour for just this navigation bar
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        //  self.tabBarController?.navigationItem.title = "Home";
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.featureofcollectionview.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        //Revert to old colour, whole app
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        //Revert to old colour, just this navigation bar
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
 
    
    //forslide
    @objc func  changeimage() {
        if counter < imgarr.count
        {
            let index = IndexPath.init(item: counter, section: 0)
            self.scollectionview.scrollToItem(at:index, at: .centeredHorizontally, animated: true)
            
            pageslide.currentPage = counter
            counter+=1
            
            
        }
        else
        {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            
            self.scollectionview.scrollToItem(at:index, at: .centeredHorizontally, animated: true)
            
            
            pageslide.currentPage = counter
            counter = 1
            
        }
        
    }
    
    
    
    

//slide collectionview
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.scollectionview
        {
        return imgarr.count
    }
    else{
    
    return getagent.count
        
    }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.scollectionview
        {
        let cell = scollectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! simageCollectionViewCell
        
        cell.simg.image=imgarr[indexPath.row]
        // cell.lblagent.text=agentlbl[indexPath.row]
        return cell
        }
        else{
            let cell = featureofcollectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! featureCollectionViewCell
            
            cell.lblvtype.isHidden = false
            
            cell.layer.cornerRadius = cell.frame.height/14
            cell.imgfeature.image = getagent[indexPath.row].vimage
            
            cell.lbloffeature.text = getagent[indexPath.row].vname
            if getagent[indexPath.row].r_name == "Seller"
            {
                cell.lblvtype.isHidden = false
                cell.lblvtype.text = "Owner"
                cell.lblvtype.isHidden = true
            }
            else
            {
                cell.lblvtype.text = getagent[indexPath.row].u_name
                //cell.lblvtype.isHidden = true
            }
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            return cell
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.featureofcollectionview
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
    
    
    
    
    //tabelview for menu
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lblmenutext.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:menuTableViewCell = menuoftableview.dequeueReusableCell(withIdentifier: "cell") as! menuTableViewCell
        
        
        cell.lblmenuname.text = lblmenutext[indexPath.row]
        cell.imgmenu.image = imgmenudata[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if lblmenutext[indexPath.row] == "Home"{
            let cell1:AgentHomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentHomeViewController") as! AgentHomeViewController
            
            self.navigationController?.pushViewController(cell1, animated: true)
            
            
            print("Done")
        }
        if lblmenutext[indexPath.row] == "Review Report"{
            
            let cell2:ReviewViewController = self.storyboard?.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
            
            self.navigationController?.pushViewController(cell2, animated: true)
            print("Review Done")
        }
        if lblmenutext[indexPath.row] == "Search"{
            
            let cell3:SearchViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
            
            self.navigationController?.pushViewController(cell3, animated: true)
            
            print("Search")
        }
        
        if lblmenutext[indexPath.row] == "Profile"{
            
            let cell4:AgentprofileViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentprofileViewController") as! AgentprofileViewController
            
            self.navigationController?.pushViewController(cell4, animated: true)
            print("Profile Done")
        }
        
        if lblmenutext[indexPath.row] == "Logout"{
            
            let lout:ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            self.navigationController?.pushViewController(lout, animated: true)
            
            
            print("Logout Done")
        }
        
        
        
        
        
    }
    
    
    
    
    @IBAction func btnmenuagent(_ sender: UIButton) {
        
        
        menuoftableview.isHidden = false
        menuview.isHidden = false
        self.view.bringSubviewToFront(menuview)
        if !issideviewopen{
            issideviewopen = true
            
            menuview.frame = CGRect(x: 0, y: 127, width: 1, height: 295)
            
            menuoftableview.frame = CGRect(x: 0, y: 0, width: 0, height: 295)
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            menuview.frame = CGRect(x: 1, y: 127, width: 191, height: 295)
            
            menuoftableview.frame = CGRect(x: 0, y: 0, width: 191, height: 295)
            
            UIView.commitAnimations()
        }
        else{
            
            menuoftableview.isHidden = true
            menuview.isHidden = true
            
            
            issideviewopen = false
            
            menuview.frame = CGRect(x: 1, y: 127, width: 191 , height: 295)
            
            menuoftableview.frame = CGRect(x: 0, y: 0, width: 191, height: 295)
            
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            menuview.frame = CGRect(x: 0, y: 127, width: 1, height: 295)
            
            menuoftableview.frame = CGRect(x: 0, y: 0, width: 0, height: 295)
            
            UIView.commitAnimations()
            
    }
}
    
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
       //RegBuyerForAgentViewController
        
        let assg:RegBuyerForAgentViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegBuyerForAgentViewController") as! RegBuyerForAgentViewController
        
        self.navigationController?.pushViewController(assg, animated: true)
        
    }
    

}

