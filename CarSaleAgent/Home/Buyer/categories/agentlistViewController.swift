//
//  agentlistViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 09/07/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class agentlistViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tview: UITableView!
    
    var getaname:String = ""
    var arrdata = [getagentdataforsearch]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let um = Usersmanager()
        let result = um.AgentProfiledata(agentName: getaname)
        var  getAveragerating:Float = 0
        if result.count ?? 0 > 0
        {
            arrdata = result
        }
        // Do any additional setup after loading the view.
    }
    
    
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let assign:agentListsTableViewCell = tview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! agentListsTableViewCell
        
        assign.layer.borderWidth = 0.3
        assign.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        
        assign.vname.text = arrdata[indexPath.row].vehicle_name
        var c = arrdata[indexPath.row].Price
        
        assign.lblprice.text = "\(c)" //arrdata[indexPath.row].Price
        assign.lblmake.text = arrdata[indexPath.row].manufacturer
        assign.lblyear.text = arrdata[indexPath.row].model
        assign.lblstatus.text = arrdata[indexPath.row].status
        var img:UIImage = Utilities.getimageFromurl(name: arrdata[indexPath.row].v_image1)!
        assign.imgagent.image = img
        return assign
        
        
    }

}
