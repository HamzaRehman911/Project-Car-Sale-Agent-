//
//  BuyerRequestViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 20/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

var bname = [String]()
var vname = [String]()
var vno = [String]()
var price = [Int]()
var offertoagent = [Int]()
var model = [String]()
var engineno = [String]()
var phone = [String]()
var getcity = [String]()
var img1 = [UIImage]()
var img2 = [UIImage]()
var img3 = [UIImage]()
var offer = [Int]()

class BuyerRequestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var pplusview: UIView!
    @IBOutlet weak var tviewforbuyerrequest: UITableView!
    //
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //
//        var a = Array(repeating: Int(), count: offertoagent.count)
//        a = offertoagent.map{Int($0)!}
//        a = a.sorted(by: >)
        //
        // Do any additional setup after loading the view.
        let um = Usersmanager()
       // let utilityobj = Utilities()
        if d6 == "Agent"
        {
        
        let result = um.getbuyerRequestforagent(aname: d2)
        //
        var forbname = Array(repeating: String(), count: result.count)
        var forvname = Array(repeating: String(), count: result.count)
        var forvno = Array(repeating: String(), count: result.count)
        var forprice = Array(repeating: Int(), count: result.count)
        var foroffertoagent = Array(repeating: Int(), count: result.count)
        var formodel = Array(repeating: String(), count: result.count)
        var forengine = Array(repeating: String(), count: result.count)
        var forphone = Array(repeating: String(), count: result.count)
        var forcity = Array(repeating: String(), count: result.count)
        var forimg1 = Array(repeating: UIImage(), count: result.count)
        var forimg2 = Array(repeating: UIImage(), count: result.count)
        var forimg3 = Array(repeating: UIImage(), count: result.count)
        
        var c = 0
        if result.count ?? 0 > 0
        {
            while c < result.count
            {
                forbname[c] = result[c].Buyer_name
                forvname[c] = result[c].vehicle_name
                forvno[c] = result[c].v_no
                forprice[c] = result[c].Price
                foroffertoagent[c] = result[c].offer
                formodel[c] = result[c].model
                forengine[c] = result[c].engine_no
                forphone[c] = result[c].phoneNumber
                forcity[c] = result[c].address
                forimg1[c] = Utilities.getimageFromurl(name: result[c].v_image1)!
                forimg2[c] = Utilities.getimageFromurl(name: result[c].v_image2)!
                forimg3[c] = Utilities.getimageFromurl(name: result[c].v_image3)!
                
                c += 1
            }
            
            bname = forbname
            vname = forvname
            vno = forvno
            price = forprice
            offertoagent = foroffertoagent
            model = formodel
            engineno = forengine
            phone =  forphone
            getcity = forcity
            img1 = forimg1
            img2 = forimg2
            img3 = forimg3
            
        }
    }
        else
        {
            let result = um.getReqfrombuyerForseller(sname: d2)
            //
            var forbname = Array(repeating: String(), count: result.count)
            var forvname = Array(repeating: String(), count: result.count)
            var forvno = Array(repeating: String(), count: result.count)
            var forprice = Array(repeating: Int(), count: result.count)
            var foroffertoagent = Array(repeating: Int(), count: result.count)
            var formodel = Array(repeating: String(), count: result.count)
            var forengine = Array(repeating: String(), count: result.count)
            var forphone = Array(repeating: String(), count: result.count)
            var forcity = Array(repeating: String(), count: result.count)
            var forimg1 = Array(repeating: UIImage(), count: result.count)
            var forimg2 = Array(repeating: UIImage(), count: result.count)
            var forimg3 = Array(repeating: UIImage(), count: result.count)
            
            var c = 0
            if result.count ?? 0 > 0
            {
                while c < result.count
                {
                    forbname[c] = result[c].Buyer_name
                    forvname[c] = result[c].vehicle_name
                    forvno[c] = result[c].v_no
                    forprice[c] = result[c].Price
                    foroffertoagent[c] = result[c].offer
                    formodel[c] = result[c].model
                    forengine[c] = result[c].engine_no
                    forphone[c] = result[c].phoneNumber
                    forcity[c] = result[c].address
                    forimg1[c] = Utilities.getimageFromurl(name: result[c].v_image1)!
                    forimg2[c] = Utilities.getimageFromurl(name: result[c].v_image2)!
                    forimg3[c] = Utilities.getimageFromurl(name: result[c].v_image3)!
                    
                    c += 1
                }
                
                bname = forbname
                vname = forvname
                vno = forvno
                price = forprice
                offertoagent = foroffertoagent
                model = formodel
                engineno = forengine
                phone =  forphone
                getcity = forcity
                img1 = forimg1
                img2 = forimg2
                img3 = forimg3
                
            }
            
        }
//        var aa = Array(repeating: Int(), count: offertoagent.count)
//        aa = offertoagent.map{Int($0)!}
//        aa = a.sorted(by: >)
//        offer = aa
        
        navigationController?.navigationItem.hidesBackButton = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        pplusview.layer.cornerRadius = pplusview.frame.width / 2
        pplusview.clipsToBounds = true
        
//        self.navigationController?.navigationItem.hidesBackButton = true
//        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
//        self.navigationController?.navigationBar.backItem?.hidesBackButton = true
        
        //only below method to hide backbaar button
        navigationController?.navigationItem.hidesBackButton = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

   //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let move: BuyerRequestTableViewCell = tviewforbuyerrequest.dequeueReusableCell(withIdentifier: "cell") as! BuyerRequestTableViewCell
//        move.offerview.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6995665668)
//        move.offerview.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6995665668)
        
        tviewforbuyerrequest.separatorStyle = UITableViewCell.SeparatorStyle.singleLine;
        
        move.layer.borderWidth = 0.3
        move.layer.shadowOffset = CGSize(width: -1, height: 0.3)
        var b = offertoagent[indexPath.row]
        move.lblcarname.text = vname[indexPath.row]
        move.lblbuyername.text = bname[indexPath.row]
        move.lblcity.text = model[indexPath.row]
        move.imgv.image = img1[indexPath.row]
        move.txtoffer.text = "\(b)"
        move.txtoffer.isEnabled = false
        
        
        //
        move.delegate2 = self
        move.btnnext.tag = indexPath.row
        //
        
        
        return move
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let next:RequestDataViewController = self.storyboard?.instantiateViewController(withIdentifier: "RequestDataViewController") as! RequestDataViewController
        
        next.Forvname = vname[indexPath.row]
        next.Forprice = price[indexPath.row]
        next.Formodel = model[indexPath.row]
        next.Forvno = vno[indexPath.row]
        next.Forbname = bname[indexPath.row]
        next.Forcontact = phone[indexPath.row]
        next.Forcity = getcity[indexPath.row]
        next.Forengineno = engineno[indexPath.row]
        next.Foroffertoagent = offertoagent[indexPath.row]
        next.Forimg1 = img1[indexPath.row]
        next.Forimg2 = img2[indexPath.row]
        next.Forimg3 = img3[indexPath.row]
        
        self.navigationController?.pushViewController(next, animated: true)
    }
    //
    
    

    @IBAction func btntest(_ sender: UIButton) {
//        let move: BuyerRequestTableViewCell = tviewforbuyerrequest.dequeueReusableCell(withIdentifier: "cell") as! BuyerRequestTableViewCell
        
    //    var name:String = bname[indexPathForPreferredFocusedView(in: tviewforbuyerrequest)]
        //print()
    }
}
extension BuyerRequestViewController:CellDelegate2
{
    func Cellbtntapped(tag: Int) {
        print(tag)
        let next:RequestDataViewController = self.storyboard?.instantiateViewController(withIdentifier: "RequestDataViewController") as! RequestDataViewController
        
        next.Forvname = vname[tag]
        next.Forprice = price[tag]
        next.Formodel = model[tag]
        next.Forvno = vno[tag]
        next.Forbname = bname[tag]
        next.Forcontact = phone[tag]
        next.Forcity = getcity[tag]
        next.Forengineno = engineno[tag]
        next.Foroffertoagent = offertoagent[tag]
        next.Forimg1 = img1[tag]
        next.Forimg2 = img2[tag]
        next.Forimg3 = img3[tag]
        
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    
}
