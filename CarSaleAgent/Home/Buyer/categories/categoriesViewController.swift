//
//  categoriesViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 04/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class categoriesViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate/*,UITableViewDelegate,UITableViewDataSource*/ {
   
    @IBOutlet weak var agenttview: UITableView!
    //foragent name
    var Agentname = [String]()
 
    
    var forvname = Array(repeating: String(), count: getagent.count)
    var forprice = Array(repeating: Int(), count: getagent.count)
    var forcity = Array(repeating: String(), count: getagent.count)
    var forvaname = Array(repeating: String(), count: getagent.count)
    var formodelno = Array(repeating: String(), count: getagent.count)
    var formake = Array(repeating: String(), count: getagent.count)
    var forvno = Array(repeating: String(), count: getagent.count)
    var forphone = Array(repeating: String(), count: getagent.count)
    
    var data = [forsellerSearch]()
    
    @IBOutlet weak var explorecollview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Categories"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        //
        for element in getagent {
            if !data.contains(where: { (el) -> Bool in
                el.u_name == element.u_name
            }) {
                data.append(element)
            }
        }
        
        // Do any additional setup after loading the view.
        
       
        
    }
    //funcs
    func forRawaCity()
    {
        
        var c = 0
        while c<getagent.count
        {
            if getagent[c].city == "Rawalpindi"
            {
               //forRawa[c] = getagent[c]
                forvname[c] = getagent[c].vname
                forvno[c] = getagent[c].vno
                forprice[c] = getagent[c].price
                forcity[c] = getagent[c].city
                forvaname[c] = getagent[c].u_name
                formake[c] = getagent[c].manufacturer
                formodelno[c] = getagent[c].model
                forphone[c] = getagent[c].phoneno
                
            }
            print(forcity[c])

            c += 1
                    }
    }
    
    func forkarachiCity()
    {
        var forvname = Array(repeating: String(), count: getagent.count)
        var forprice = Array(repeating: Int(), count: getagent.count)
        var forcity = Array(repeating: String(), count: getagent.count)
        var forvaname = Array(repeating: String(), count: getagent.count)
        var formodelno = Array(repeating: String(), count: getagent.count)
        var formake = Array(repeating: String(), count: getagent.count)
        var forvno = Array(repeating: String(), count: getagent.count)
        var forphone = Array(repeating: String(), count: getagent.count)
        var c = 0
        while c<getagent.count
        {
            if getagent[c].city == "Karachi"
            {
                //forRawa[c] = getagent[c]
                forvname[c] = getagent[c].vname
                forvno[c] = getagent[c].vno
                forprice[c] = getagent[c].price
                forcity[c] = getagent[c].city
                forvaname[c] = getagent[c].u_name
                formake[c] = getagent[c].manufacturer
                formodelno[c] = getagent[c].model
                forphone[c] = getagent[c].phoneno
                
            }
            print(forcity[c])
            
            c += 1
        }
    }
    
    func forLahoreCity()
    {
        var forvname = Array(repeating: String(), count: getagent.count)
        var forprice = Array(repeating: Int(), count: getagent.count)
        var forcity = Array(repeating: String(), count: getagent.count)
        var forvaname = Array(repeating: String(), count: getagent.count)
        var formodelno = Array(repeating: String(), count: getagent.count)
        var formake = Array(repeating: String(), count: getagent.count)
        var forvno = Array(repeating: String(), count: getagent.count)
        var forphone = Array(repeating: String(), count: getagent.count)
        var c = 0
        while c<getagent.count
        {
            if getagent[c].city == "Lahore"
            {
                //forRawa[c] = getagent[c]
                forvname[c] = getagent[c].vname
                forvno[c] = getagent[c].vno
                forprice[c] = getagent[c].price
                forcity[c] = getagent[c].city
                forvaname[c] = getagent[c].u_name
                formake[c] = getagent[c].manufacturer
                formodelno[c] = getagent[c].model
                forphone[c] = getagent[c].phoneno
                
            }
            print(forcity[c])
            
            c += 1
        }
    }

    func forPeshawarCity()
    {
        var forvname = Array(repeating: String(), count: getagent.count)
        var forprice = Array(repeating: Int(), count: getagent.count)
        var forcity = Array(repeating: String(), count: getagent.count)
        var forvaname = Array(repeating: String(), count: getagent.count)
        var formodelno = Array(repeating: String(), count: getagent.count)
        var formake = Array(repeating: String(), count: getagent.count)
        var forvno = Array(repeating: String(), count: getagent.count)
        var forphone = Array(repeating: String(), count: getagent.count)
        var c = 0
        while c<getagent.count
        {
            if getagent[c].city == "Peshawar"
            {
                //forRawa[c] = getagent[c]
                forvname[c] = getagent[c].vname
                forvno[c] = getagent[c].vno
                forprice[c] = getagent[c].price
                forcity[c] = getagent[c].city
                forvaname[c] = getagent[c].u_name
                formake[c] = getagent[c].manufacturer
                formodelno[c] = getagent[c].model
                forphone[c] = getagent[c].phoneno
                
            }
            print(forcity[c])
            
            c += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.explorecollview.reloadData()
        //
        self.navigationController?.navigationBar.topItem?.title = "Categories"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.explorecollview.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Categories"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
    }
    
    //
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return getagent.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
        
        let cell:exploreCollectionViewCell = explorecollview.dequeueReusableCell(withReuseIdentifier: "ecell", for: indexPath) as! exploreCollectionViewCell
        cell.layer.cornerRadius = cell.frame.height/14
        
        cell.imgexplore.image = getagent[indexPath.row].vimage
        
        cell.lblexplore.text = getagent[indexPath.row].vname
        
        cell.lblmodel.text = getagent[indexPath.row].model
        cell.lblcity.text = getagent[indexPath.row].city
        if getagent[indexPath.row].r_name == "Seller"
        {
            cell.lblagentorseller.text = "Seller :"
            
            cell.lblagentorsellerInsert.text = getagent[indexPath.row].u_name
            
            cell.lblprivatevehicle.text = "Private Vehicle"
            cell.lblprivatevehicle.isHidden = false
        }
        else{
            
            
            cell.lblagentorseller.text = "Agent :"
            
            cell.lblagentorsellerInsert.text = getagent[indexPath.row].u_name
            cell.lblprivatevehicle.isHidden = true
            
          

        }
       
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

       
        
        let detail:AgentDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentDetailViewController") as! AgentDetailViewController
        
        detail.Ownerid = getagent[indexPath.row].u_id
        detail.vname = getagent[indexPath.row].vname
        detail.vnumber = getagent[indexPath.row].vno
        detail.price = getagent[indexPath.row].price
        detail.make = getagent[indexPath.row].manufacturer
        detail.model = getagent[indexPath.row].model
        detail.engine = getagent[indexPath.row].engine
        detail.tyre = getagent[indexPath.row].tyres
        detail.brake = getagent[indexPath.row].brakes
        detail.body = getagent[indexPath.row].body
        detail.aname = getagent[indexPath.row].u_name
        detail.contact = getagent[indexPath.row].phoneno
        detail.city = getagent[indexPath.row].city
        detail.img1 = getagent[indexPath.row].vimage
        detail.img2 = getagent[indexPath.row].vimage2
        detail.img3 = getagent[indexPath.row].vimage3
        if getagent[indexPath.row].r_name == "Seller"
        {
            detail.privatev = "Private Vehicle"
            detail.agentorseller = "Seller Detail :"
            
        }
        else
        {
           
            
            var averageRating:Float = 0.0
            var c = 0
            
            let uobj = Usersmanager()
            let getrating = uobj.getRating(aname: getagent[indexPath.row].u_name)
            if getrating.count ?? 0 > 0
            {
                while c<getrating.count
                {
                    if getrating[c].rating != "Not Rated"
                    {
                        averageRating = averageRating + Float(getrating[c].rating)! ?? 0.0
                    }
                    c += 1
                }
                print(averageRating / Float(getrating.count))
            }
            detail.privatev = "Agent"
            detail.agentorseller = "Agent Detail :"
            detail.getrating = "\(averageRating)"

        }
        
        
       // detail.str2 = lblmodelarrExplore[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
        
       
        
    }
    //table view

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let next:agentListsTableViewCell = agenttview.dequeueReusableCell(withIdentifier: "cell") as! agentListsTableViewCell
//
//        next.lblphone.text = data[indexPath.row].phoneno
//        next.lblagentname.text = data[indexPath.row].Agentname
//        return next
//    }

}
