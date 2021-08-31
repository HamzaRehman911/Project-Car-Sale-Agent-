//
//  AgentTabViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 06/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class AgentTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let um = Usersmanager()
        
        
        let result = um.getagentforsearch()
        if result.count ?? 0 > 0
        {
            var c = 0
            if getagent.count == 0
            {
            while c < result.count
            {
                let d = forsellerSearch(uid:result[c].u_id,uname: result[c].u_name, statuss: result[c].status, modl: result[c].model, cty: result[c].address, vimg: Utilities.getimageFromurl(name: result[c].v_image1)!, vimg2: Utilities.getimageFromurl(name: result[c].v_image2)!, vimg3: Utilities.getimageFromurl(name: result[c].v_image3)! , price1: result[c].Price, vnme: result[c].vehicle_name, v_no: result[c].v_no, manufac: result[c].manufacturer, enginee: result[c].engine, tyre: result[c].tyres, brake: result[c].brakes, body: result[c].body, engno: result[c].engine_no, contact: result[c].phoneNumber,method: result[c].Method, role_name: result[c].r_name, rate: result[c].rating)
                c += 1
                //below getagent is a global variable which will contain allagent data
                
                    getagent.append(d)
                    print(getagent)
                
                
//                getagent.append(d)
//                print(getagent)
            }
            }
            else {
                print("Already Contain Data")
            }
            
        }
        
        // Do any additional setup after loading the view.
       // self.tabBarController?.selectedIndex = 0
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
       // self.tabBarController?.selectedIndex = 0
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

}
