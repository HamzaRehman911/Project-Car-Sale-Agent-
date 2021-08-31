//
//  SearchWithMultipleViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 22/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class SearchWithMultipleViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var formultiplesearch = [forsellerSearch]()
    var forFiltersearch = [forsellerSearch]()
    
    @IBOutlet weak var lbloverallins: UILabel!
    @IBOutlet weak var txtminins: UITextField!
    @IBOutlet weak var txtmaxins: UITextField!
    @IBOutlet weak var lblto: UILabel!
    
    
    var getAllAgent = [String]()
    
    var getcity:String = ""
    var getmodel:String = ""
    var getagent:String = ""
    
   
    var ass = ["Rawalpindi","Islamabad","Peshawar","Mardan","Lahore","Karachi","Multan"]
var model = ["1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022"]
    
    //fordropdown items
    

    @IBOutlet weak var tviewfordropdowncity: UITableView!
    @IBOutlet weak var sideviewfordropdowncity: UIView!
    
    @IBOutlet weak var imgfordropdownmodel: UIImageView!
    @IBOutlet weak var sideviewfordropdownmodel: UIView!
        @IBOutlet weak var tviewfordropdownmodel: UITableView!
    @IBOutlet weak var tviewfordropdownagent: UITableView!
    
    @IBOutlet weak var sideviewfordropdownagent: UIView!
    
    @IBOutlet weak var imgfordropdownagent: UIImageView!
    @IBOutlet weak var imgfordropdown: UIImageView!
    //
    
    var issideviewforagentopen:Bool = false
    var issideviewformodelopen:Bool = false
    var issideviewforcityopen:Bool = false
//

    
    //@IBOutlet weak var searchoutlet: UISearchBar!
    
    @IBOutlet weak var txtmaxPrice: UITextField!
    
    @IBOutlet weak var txtminPrice: UITextField!
    @IBOutlet weak var txtvname: UITextField!
    @IBOutlet weak var btnagentOutlet: UIButton!
    @IBOutlet weak var btnmodelOutlet: UIButton!
    @IBOutlet weak var btncityOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        sideviewfordropdowncity.isHidden = true
        issideviewforcityopen = false
        sideviewfordropdownmodel.isHidden = true
        issideviewformodelopen = false
        sideviewfordropdownagent.isHidden = true
        issideviewforagentopen = false
        
        //
        let umodel = Usersmanager()

        let result = umodel.getagentforsearch()
        if result.count ?? 0 > 0
        {
            
            
            var c = 0
            while c < result.count
            {
                
                
                //using initilization storing data into classtype array
                let d = forsellerSearch(uid: result[c].u_id, uname: result[c].u_name,statuss: result[c].status, modl: result[c].model, cty: result[c].address, vimg: Utilities.getimageFromurl(name: result[c].v_image1)!, vimg2: Utilities.getimageFromurl(name: result[c].v_image2)!, vimg3: Utilities.getimageFromurl(name: result[c].v_image3)! , price1: result[c].Price, vnme: result[c].vehicle_name, v_no: result[c].v_no, manufac: result[c].manufacturer, enginee: result[c].engine, tyre: result[c].tyres, brake: result[c].brakes, body: result[c].body, engno: result[c].engine_no, contact: result[c].phoneNumber,method: result[c].Method, role_name: result[c].r_name, rate: result[c].rating)
                formultiplesearch.append(d)
                
                c += 1
                
            }
            
            
            print(formultiplesearch[0].u_name)
            
        }
        // Do any additional setup after loading the view.
        btnagentOutlet.layer.borderWidth = 1.5
        btncityOutlet.layer.borderWidth = 1.5
        btnmodelOutlet.layer.borderWidth = 1.5
        //
        tviewfordropdowncity.layer.borderWidth = 1.5
        tviewfordropdownmodel.layer.borderWidth = 1.5
        tviewfordropdownagent.layer.borderWidth = 1.5
        
        getAgents()
        
    }
    //
    func getAgents()
    {
        let um = Usersmanager()
        let agentresponse = um.getagents()
        var getA = Array(repeating: String(), count: agentresponse.count)
        
        if agentresponse.count ?? 0 > 0
        {
            let gt:Int = agentresponse.count
            var c:Int = 0
            while c<gt{
       
                getA[c] = agentresponse[c].u_name!
                c += 1
                
            }
            
            getAllAgent = getA
            getAllAgent.append("None")
            
            
        }
        else
        {
            
            print("No Agents to display")
        }
    }
    //tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tviewfordropdowncity
        {
        return ass.count
        }
        else if tableView == tviewfordropdownmodel
        {
            return model.count
        }
        else{
            return getAllAgent.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tviewfordropdowncity
        {
        
        let assignl:forcitydropdownTableViewCell = tviewfordropdowncity.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! forcitydropdownTableViewCell
        
        assignl.lblcityname.text = ass[indexPath.row]
        
        return assignl
        }
       else if tableView == tviewfordropdownmodel
        {
            let assign2:formodeldropdownTableViewCell = tviewfordropdownmodel.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! formodeldropdownTableViewCell
            
            assign2.lblmodel.text = model[indexPath.row]
            
            return assign2
        }
        else{
            let assign3:foragentdropdownTableViewCell = tviewfordropdownagent.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! foragentdropdownTableViewCell
            
            assign3.lblagentname.text = getAllAgent[indexPath.row]
            
            return assign3
        }
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView == tviewfordropdowncity
        {
            lbloverallins.isHidden = false
            txtminins.isHidden = false
            txtmaxins.isHidden = false
            lblto.isHidden = false
            
            getcity = ass[indexPath.row]
            print(getcity)
            
            btncityOutlet.titleLabel?.text = getcity
            tviewfordropdowncity.reloadData()
            
                imgfordropdown.image = #imageLiteral(resourceName: "down")
                tviewfordropdowncity.isHidden = true
                sideviewfordropdowncity.isHidden = true
            
                issideviewforcityopen = false
            
                //clearifying the actuall size of view and tview before hiding
                sideviewfordropdowncity.frame = CGRect(x: 37, y: 609, width: 341, height: 209)
            
                tviewfordropdowncity.frame = CGRect(x: 37, y: 609, width: 341, height: 209)
            
            
                UIView.setAnimationDuration(0.3)
            
                UIView.setAnimationDelegate(self)
            
                UIView.beginAnimations("TableAnimation", context: nil)
            
                sideviewfordropdowncity.frame = CGRect(x: 37 , y: 609, width: 0, height: 209)
            
                tviewfordropdowncity.frame = CGRect(x: 37, y: 609, width: 0, height: 209)
            
                UIView.commitAnimations()
        }
       else if tableView == tviewfordropdownmodel
        {
            lbloverallins.isHidden = false
            txtminins.isHidden = false
            txtmaxins.isHidden = false
            lblto.isHidden = false
          
            getmodel = model[indexPath.row]
            print(getmodel)
            btnmodelOutlet.titleLabel?.text = getmodel
            tviewfordropdownmodel.reloadData()
            
            imgfordropdownmodel.image = #imageLiteral(resourceName: "down")
            tviewfordropdownmodel.reloadData()
            tviewfordropdownmodel.isHidden = true
            sideviewfordropdownmodel.isHidden = true
            
            issideviewformodelopen = false
            
            //clearifying the actuall size of view and tview before hiding
            sideviewfordropdownmodel.frame = CGRect(x: 37, y: 493, width: 341, height: 209)
            
            tviewfordropdownmodel.frame = CGRect(x: 37, y: 493, width: 341, height: 209)
            
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideviewfordropdownmodel.frame = CGRect(x: 37 , y: 493, width: 0, height: 209)
            
            tviewfordropdownmodel.frame = CGRect(x: 37, y: 493, width: 0, height: 209)
            
            UIView.commitAnimations()
            
        }
        else
        {
            getagent = getAllAgent[indexPath.row]
            print(getagent)
              btnagentOutlet.titleLabel?.text = getagent
            

                imgfordropdownagent.image = #imageLiteral(resourceName: "down")
                tviewfordropdownagent.reloadData()
                tviewfordropdownagent.isHidden = true
                sideviewfordropdownagent.isHidden = true
            
                issideviewforagentopen = false
            
                //clearifying the actuall size of view and tview before hiding
                sideviewfordropdownagent.frame = CGRect(x: 37, y: 376, width: 341, height: 251)
            
                tviewfordropdownagent.frame = CGRect(x: 37, y: 376, width: 341, height: 251)
            
            
                UIView.setAnimationDuration(0.3)
            
                UIView.setAnimationDelegate(self)
            
                UIView.beginAnimations("TableAnimation", context: nil)
            
                sideviewfordropdownagent.frame = CGRect(x: 37 , y: 376, width: 0, height: 251)
            
                tviewfordropdownagent.frame = CGRect(x: 37, y: 376, width: 0, height: 251)
            
                UIView.commitAnimations()
            
        }
    }

    
//
  
    
//forselect Agent
    @IBAction func btnselectagent(_ sender: UIButton) {
        
        imgfordropdownagent.image = #imageLiteral(resourceName: "up")
        tviewfordropdownagent.isHidden = false
        sideviewfordropdownagent.isHidden = false
        self.view.bringSubviewToFront(sideviewfordropdownagent)
        if !issideviewforagentopen{
            issideviewforagentopen = true
            
            //clearifying the actuall size of view and tview before showing
            sideviewfordropdownagent.frame = CGRect(x: 37 , y: 376, width: 341, height: 251)
            
            tviewfordropdownagent.frame = CGRect(x: 37, y: 376, width: 0, height: 251)
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideviewfordropdownagent.frame = CGRect(x: 37, y: 376, width: 341, height: 251)
            
            tviewfordropdownagent.frame = CGRect(x: 37, y: 376, width: 341, height: 251)
            
            UIView.commitAnimations()
        }
            
        else{
            imgfordropdownagent.image = #imageLiteral(resourceName: "down")
            tviewfordropdownagent.reloadData()
            tviewfordropdownagent.isHidden = true
            sideviewfordropdownagent.isHidden = true
            
            issideviewforagentopen = false
            
            //clearifying the actuall size of view and tview before hiding
            sideviewfordropdownagent.frame = CGRect(x: 37, y: 376, width: 341, height: 251)
            
            tviewfordropdownagent.frame = CGRect(x: 37, y: 376, width: 341, height: 251)
            
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideviewfordropdownagent.frame = CGRect(x: 37 , y: 376, width: 0, height: 251)
            
            tviewfordropdownagent.frame = CGRect(x: 37, y: 376, width: 0, height: 251)
            
            UIView.commitAnimations()
            
            
        }
        
    }
    
    @IBAction func btnselectModel(_ sender: UIButton) {
        
        imgfordropdownmodel.image = #imageLiteral(resourceName: "up")
        tviewfordropdownmodel.isHidden = false
        sideviewfordropdownmodel.isHidden = false
        self.view.bringSubviewToFront(sideviewfordropdownmodel)
        if !issideviewformodelopen{
            lbloverallins.isHidden = true
            txtminins.isHidden = true
            txtmaxins.isHidden = true
            lblto.isHidden = true
            
            
            
            issideviewformodelopen = true
            
            //clearifying the actuall size of view and tview before showing
            sideviewfordropdownmodel.frame = CGRect(x: 37 , y: 493, width: 341, height: 209)
            
            tviewfordropdownmodel.frame = CGRect(x: 37, y: 493, width: 0, height: 209)
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideviewfordropdownmodel.frame = CGRect(x: 37, y: 493, width: 341, height: 209)
            
            tviewfordropdownmodel.frame = CGRect(x: 37, y: 493, width: 341, height: 209)
            
            UIView.commitAnimations()
        }
            
        else{
            lbloverallins.isHidden = false
            txtminins.isHidden = false
            txtmaxins.isHidden = false
            lblto.isHidden = false
            
            imgfordropdownmodel.image = #imageLiteral(resourceName: "down")
            tviewfordropdownmodel.reloadData()
            tviewfordropdownmodel.isHidden = true
            sideviewfordropdownmodel.isHidden = true
            
            issideviewformodelopen = false
            
            //clearifying the actuall size of view and tview before hiding
            sideviewfordropdownmodel.frame = CGRect(x: 37, y: 493, width: 341, height: 209)
            
            tviewfordropdownmodel.frame = CGRect(x: 37, y: 493, width: 341, height: 209)
            
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideviewfordropdownmodel.frame = CGRect(x: 37 , y: 493, width: 0, height: 209)
            
            tviewfordropdownmodel.frame = CGRect(x: 37, y: 493, width: 0, height: 209)
            
            UIView.commitAnimations()
            
            
        }
    }
    
    @IBAction func btnselectCity(_ sender: UIButton) {
        imgfordropdown.image = #imageLiteral(resourceName: "up")
        tviewfordropdowncity.isHidden = false
        sideviewfordropdowncity.isHidden = false
        self.view.bringSubviewToFront(sideviewfordropdowncity)
        if !issideviewforcityopen{
            lbloverallins.isHidden = true
            txtminins.isHidden = true
            txtmaxins.isHidden = true
            lblto.isHidden = true
            
            issideviewforcityopen = true
            
            //clearifying the actuall size of view and tview before showing
            sideviewfordropdowncity.frame = CGRect(x: 37 , y: 609, width: 341, height: 209)
            
            tviewfordropdowncity.frame = CGRect(x: 37, y: 609, width: 0, height: 209)
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideviewfordropdowncity.frame = CGRect(x: 37, y: 609, width: 341, height: 209)
            
            tviewfordropdowncity.frame = CGRect(x: 37, y: 609, width: 341, height: 209)
            sideviewfordropdowncity.bringSubviewToFront(sideviewfordropdowncity)
            
            UIView.commitAnimations()
        }
            
        else{
            lbloverallins.isHidden = false
            txtminins.isHidden = false
            txtmaxins.isHidden = false
            lblto.isHidden = false
            
            imgfordropdown.image = #imageLiteral(resourceName: "down")
            tviewfordropdowncity.reloadData()
            tviewfordropdowncity.isHidden = true
            sideviewfordropdowncity.isHidden = true
            
            issideviewforcityopen = false
            
            //clearifying the actuall size of view and tview before hiding
            sideviewfordropdowncity.frame = CGRect(x: 37, y: 609, width: 341, height: 209)
            
            tviewfordropdowncity.frame = CGRect(x: 37, y: 609, width: 341, height: 209)
            
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideviewfordropdowncity.frame = CGRect(x: 37 , y: 609, width: 0, height: 209)
            
            tviewfordropdowncity.frame = CGRect(x: 37, y: 609, width: 0, height: 209)
            
            UIView.commitAnimations()
            
            
        }
    }
    
    //
    @IBAction func btnsearchvehicle(_ sender: UIButton) {
        print(txtvname.text!)
        var getminIns:Int = 0
        var getmaxIns:Int = 0
        var getmin:Int = Int(txtminPrice.text!)!
        var getmax:Int = Int(txtmaxPrice.text!)!
        if txtminins.text?.count == 0 || txtmaxins.text?.count == 0
        {
            getminIns = 1
            getmaxIns = 1
        }
        else
        {
       getminIns = Int(txtminins.text!)!
       getmaxIns = Int(txtmaxins.text!)!
        }
        if getagent != "None"
        {
            if getcity == "Rawalpindi"
            {
        forFiltersearch = formultiplesearch.filter({forFiltersearch -> Bool in
            forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.u_name.contains(getagent) && forFiltersearch.model.contains(getmodel) && forFiltersearch.city.contains(getcity) && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                var forFiltersearch2 = [forsellerSearch]()
                forFiltersearch2 = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.city.contains("Islamabad") && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                forFiltersearch += forFiltersearch2
                
            }
          else if getcity == "Islamabad"
            {
                forFiltersearch = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.u_name.contains(getagent) && forFiltersearch.model.contains(getmodel) && forFiltersearch.city.contains(getcity) && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                var forFiltersearch2 = [forsellerSearch]()
                forFiltersearch2 = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.city.contains("Rawalpindi") && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                forFiltersearch += forFiltersearch2
            }
            else if getcity == "Lahore"
            {
                forFiltersearch = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.u_name.contains(getagent) && forFiltersearch.model.contains(getmodel) && forFiltersearch.city.contains(getcity) && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                var forFiltersearch2 = [forsellerSearch]()
                forFiltersearch2 = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.city.contains("Multan") && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                forFiltersearch += forFiltersearch2
            }
            else
            {
                forFiltersearch = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.u_name.contains(getagent) && forFiltersearch.model.contains(getmodel) && forFiltersearch.city.contains(getcity) && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
            }
        }
        else
        {
            
            if getcity == "Rawalpindi"
            {
                forFiltersearch = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.model.contains(getmodel) && forFiltersearch.city.contains(getcity) && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                var forFiltersearch2 = [forsellerSearch]()
                forFiltersearch2 = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.city.contains("Islamabad") && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                forFiltersearch += forFiltersearch2
                
            }
            else if getcity == "Islamabad"
            {
                forFiltersearch = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.model.contains(getmodel) && forFiltersearch.city.contains(getcity) && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                var forFiltersearch2 = [forsellerSearch]()
                forFiltersearch2 = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.city.contains("Rawalpindi") && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                forFiltersearch += forFiltersearch2
            }
            else if getcity == "Lahore"
            {
                forFiltersearch = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.model.contains(getmodel) && forFiltersearch.city.contains(getcity) && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                var forFiltersearch2 = [forsellerSearch]()
                forFiltersearch2 = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.city.contains("Multan") && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
                forFiltersearch += forFiltersearch2
            }
            else
            {
                forFiltersearch = formultiplesearch.filter({forFiltersearch -> Bool in
                    forFiltersearch.vname.contains(txtvname.text!) && forFiltersearch.model.contains(getmodel) && forFiltersearch.city.contains(getcity) && (getmin <= Int(forFiltersearch.price) && getmax >= Int(forFiltersearch.price)) && (getminIns <= Int(forFiltersearch.engine) && getmaxIns >= Int(forFiltersearch.engine)) && (getminIns <= Int(forFiltersearch.brakes) && getmaxIns >= Int(forFiltersearch.brakes)) && (getminIns <= Int(forFiltersearch.tyres) && getmaxIns >= Int(forFiltersearch.tyres)) && (getminIns <= Int(forFiltersearch.body) && getmaxIns >= Int(forFiltersearch.body))})
                
            }
        }
        if forFiltersearch.count == 0
        {
            let alert  = UIAlertController(title: "No vehicle found of your choice", message: nil, preferredStyle: .alert)
            
            let okay = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(okay)
            self.present(alert ,animated: true)
            print("No vehicle found of your choice")
            
        }
        else
        {
            
            let navigate:searchedVehicleListViewController = self.storyboard?.instantiateViewController(withIdentifier: "searchedVehicleListViewController") as! searchedVehicleListViewController
           // navigate.rate = "\(averageRating)"
            navigate.getfilterdatafromroot = forFiltersearch
            
            self.navigationController?.pushViewController(navigate, animated: true)

    }
  
}
}
