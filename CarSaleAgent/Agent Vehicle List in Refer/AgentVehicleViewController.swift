//
//  AgentVehicleViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 12/07/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
var AgentG = [getagentdataforsearch]()
var getTag:Int = 0
class AgentVehicleViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    var txtf1:UITextField!
    
    
    @IBOutlet weak var tviewforv: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let um = Usersmanager()
        let result = um.AgentProfiledata(agentName: d2)
        
        if result.count ?? 0 > 0
        {
            AgentG = result
        }
        
    }
    

   //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AgentG.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let next0:AgentvehicleTableViewCell = tviewforv.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AgentvehicleTableViewCell
        
        next0.layer.borderWidth = 0.3
        next0.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        var imgget:UIImage = Utilities.getimageFromurl(name: AgentG[indexPath.row].v_image1)!
        
        next0.lblvname.text = AgentG[indexPath.row].vehicle_name
        
        next0.lblmake.text = AgentG[indexPath.row].manufacturer
        
        next0.lblprice.text = String(AgentG[indexPath.row].Price)
        
        next0.lblmodel.text = AgentG[indexPath.row].model
        
        next0.vimg.image = imgget
        
        //using protocol passing indexpath
        next0.delegate3 = self
        next0.btnrecommend.tag = indexPath.row
        
        
        //
        
        return next0
    }
    
    

}
extension AgentVehicleViewController:CellDelegate3
{
    
    func Cellbtntapped3(tag: Int) {
        getTag = tag
        print(getTag)
        //alert
        let userma = Usersmanager()
        
        let resResA = userma.RestrictAgentRef(aname: d2, bname: selectedBuy, vno: AgentG[getTag].v_no)
        if resResA.count ?? 0 > 0
        {
            let alert2 = UIAlertController(title: " Restriction !", message: "Alreday Refered this vehicle", preferredStyle: .alert)
            
            let action2 = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert2.addAction(action2)
            self.present(alert2,animated: true)
            
            print("Refered Already")
        }
        
        else{
            let alert1 = UIAlertController(title: "Input Sell Price ", message: nil, preferredStyle: .alert)
            
            alert1.addTextField(configurationHandler: tfield)
            
            let action1 = UIAlertAction(title: "Refer", style: .default, handler: self.Refer)
            
            let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert1.addAction(action1)
            alert1.addAction(action2)
            self.present(alert1,animated: true)
            //
            
            
            
            print(tag)
        }
      
    }
    func Refer(getalert:UIAlertAction)
    {
        let userma = Usersmanager()

        print("Reffering in Progress")
        
       let resResA = userma.RestrictAgentRef(aname: d2, bname: selectedBuy, vno: AgentG[getTag].v_no)
        
       
        
            let recomObj = RefModel()
            recomObj.Agent_name = d2
            recomObj.Buyer_name = selectedBuy
            recomObj.sell_price = Int(txtf1.text!)!
            recomObj.v_no = AgentG[getTag].v_no
            recomObj.vehicle_name = AgentG[getTag].vehicle_name
            recomObj.v_status = "Reffered/Not Sold"
        
            let resRecom = userma.insertRef(rdata: recomObj)
            if resRecom == true
            {
                print("Referred SuccessFully")
            }


    }
    func tfield(txt:UITextField)
    {
        txtf1 = txt
        txtf1.placeholder = "Input Sell Price"
        txtf1.textAlignment = .center
        
    }
}
