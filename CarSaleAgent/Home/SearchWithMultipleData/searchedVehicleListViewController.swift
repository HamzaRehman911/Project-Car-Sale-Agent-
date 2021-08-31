//
//  searchedVehicleListViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 23/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class searchedVehicleListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
  var getfilterdatafromroot = [forsellerSearch]()
    var rate:String = ""

    @IBOutlet weak var tviewforsearchedlistdata: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

     //
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getfilterdatafromroot.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movetonext:searchedVehicleListTableViewCell = tviewforsearchedlistdata.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! searchedVehicleListTableViewCell
        if getfilterdatafromroot[indexPath.row].r_name == "Agent"
        {
            movetonext.lblagentOrSeller.text = "Agent :"
            movetonext.star.isHidden = false
            movetonext.rating.isHidden = false
            //
            var averageRating:Float = 0.0
            var c = 0
            let uobj = Usersmanager()
            let getrating = uobj.getRating(aname: getfilterdatafromroot[indexPath.row].u_name)
            var i = getrating.count
            if getrating.count ?? 0 > 0
            {
                while c<getrating.count
                {
                    if getrating[c].rating != "Not Rated"
                    {
                        averageRating = averageRating + Float(getrating[c].rating)! ?? 0.0
                    }
                    else{
                        i -= 1
                    }
                    c += 1
                }
                if i == 0
                {
                    averageRating = 0.0
                }
                else
                {
                    print(Int(averageRating) / Int(i))
                    averageRating = Float(Int(averageRating) / Int(i))
                }
 
            }
            else
            {
                averageRating = 0.0
            }
            //
            movetonext.rating.text = String(averageRating)
        }
        else
        {
            movetonext.lblagentOrSeller.text = "Seller :"
            movetonext.star.isHidden = true
            movetonext.rating.isHidden = true
        }
        
        
        movetonext.layer.borderWidth = 0.3
    //    movetonext.layer.borderColor = UIColor.black as! CGColor
        movetonext.clipsToBounds = true
        
        movetonext.lblvname.text = getfilterdatafromroot[indexPath.row].vname
        
        movetonext.lblagent.text = getfilterdatafromroot[indexPath.row].u_name
        
        var c = getfilterdatafromroot[indexPath.row].price
        
        movetonext.lblprice.text = "\(c)"
        
        movetonext.lblmodel.text = getfilterdatafromroot[indexPath.row].model
        
        movetonext.lblcity.text = getfilterdatafromroot[indexPath.row].city
        
        movetonext.vimg.image = getfilterdatafromroot[indexPath.row].vimage
        
     //   movetonext.rating.text = rate
        
        return movetonext
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
              let next:VehicleDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "VehicleDetailViewController") as! VehicleDetailViewController
        
        next.vname = getfilterdatafromroot[indexPath.row].vname
        
        var c = getfilterdatafromroot[indexPath.row].price
        
        next.price = c
        next.city = getfilterdatafromroot[indexPath.row].city
        next.agentname = getfilterdatafromroot[indexPath.row].u_name
        next.contact  = getfilterdatafromroot[indexPath.row].phoneno
        next.vno = getfilterdatafromroot[indexPath.row].vno
        next.manu = getfilterdatafromroot[indexPath.row].manufacturer
        next.model = getfilterdatafromroot[indexPath.row].model
        next.engno = getfilterdatafromroot[indexPath.row].eng_no
        
        next.engine = getfilterdatafromroot[indexPath.row].engine
        next.tyres = getfilterdatafromroot[indexPath.row].tyres
        next.brakes = getfilterdatafromroot[indexPath.row].brakes
        next.body = getfilterdatafromroot[indexPath.row].body
        
        next.img1 = getfilterdatafromroot[indexPath.row].vimage
        next.img2 = getfilterdatafromroot[indexPath.row].vimage2
        next.img3 = getfilterdatafromroot[indexPath.row].vimage3
    self.navigationController?.pushViewController(next, animated: true)
    }

}
//03162098846
