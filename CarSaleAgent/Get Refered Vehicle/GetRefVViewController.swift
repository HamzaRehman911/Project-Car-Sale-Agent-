//
//  GetRefVViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 12/07/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class GetRefVViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var getV = [RefVehModel]()

    @IBOutlet weak var tview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let usm = Usersmanager()
        
        let resR0 = usm.getRefVeh(bname: d2)
        
        if resR0.count ?? 0 > 0
        {
            getV = resR0
            
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getV.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let next0:GetRefVTableViewCell = tview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GetRefVTableViewCell
        print(getV[indexPath.row].address)
        
        next0.layer.borderWidth = 0.3
        next0.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        var sellp = String(getV[indexPath.row].sell_price)
        
        
        next0.lblvname.text = getV[indexPath.row].vehicle_name
        
        next0.lblmake.text = getV[indexPath.row].manufacturer
        
        next0.lblprice.text = sellp
        
        next0.lblagent.text = getV[indexPath.row].Agent_name
    
        
        var img1 = Utilities.getimageFromurl(name: getV[indexPath.row].v_image1)
        
        next0.vmg.image = img1
        return next0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let detail:AgentDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentDetailViewController") as! AgentDetailViewController
        detail.privatev = "Agent"
        detail.agentorseller = "Agent Detail :"
        detail.getrating = "4.5"
        detail.vname = getV[indexPath.row].vehicle_name
        detail.vnumber = getV[indexPath.row].v_no
        detail.price = getV[indexPath.row].sell_price
        detail.make = getV[indexPath.row].manufacturer
        detail.engine = getV[indexPath.row].engine
        detail.tyre = getV[indexPath.row].tyres
        detail.brake = getV[indexPath.row].brakes
        detail.body = getV[indexPath.row].body
        detail.aname = getV[indexPath.row].Agent_name
        detail.contact = getV[indexPath.row].phoneNumber
        detail.city = getV[indexPath.row].address
        
        var img01 = Utilities.getimageFromurl(name: getV[indexPath.row].v_image1)
        var img02 = Utilities.getimageFromurl(name: getV[indexPath.row].v_image2)
        var img03 = Utilities.getimageFromurl(name: getV[indexPath.row].v_image3)
        
        detail.img1 = img01
        detail.img2 = img02
        detail.img3 = img03
        
        
        self.navigationController?.pushViewController(detail, animated: true)
        
        /*detail.Ownerid = getagent[indexPath.row].u_id
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
         detail.img3 = getagent[indexPath.row].vimage3*/
        
    }

}
