//
//  RegBuyerForAgentViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 12/07/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
var selectedBuy:String = ""
class RegBuyerForAgentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var passregB = [GetRegBuy]()
    

    @IBOutlet weak var tviewforRegB: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      let usm = Usersmanager()
        let objReg = GetRegBuy()
        let res = usm.getRegBuy(aname: d2)
        
        if res.count ?? 0 > 0
        {
            passregB = res
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passregB.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let next:RegBuyerTableViewCell = tviewforRegB.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RegBuyerTableViewCell
        next.layer.borderWidth = 0.3
        next.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        next.lblrefer.layer.borderWidth = 0.3
        next.lblrefer.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        next.lblbname.text = passregB[indexPath.row].Buyer_name
        next.lblregstatus.text = passregB[indexPath.row].Reg_status
        next.lblcity.text = passregB[indexPath.row].address
        
        return next
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBuy = passregB[indexPath.row].Buyer_name
        
        let assg0:AgentVehicleViewController = self.storyboard?.instantiateViewController(withIdentifier: "AgentVehicleViewController") as! AgentVehicleViewController
        
        self.navigationController?.pushViewController(assg0, animated: true)
        
    }

}
