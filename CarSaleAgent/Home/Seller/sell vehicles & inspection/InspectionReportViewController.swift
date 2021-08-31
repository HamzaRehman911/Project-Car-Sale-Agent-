//
//  InspectionReportViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 03/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class InspectionReportViewController: UIViewController {

    @IBOutlet weak var lblEnginePending: UILabel!
    
    @IBOutlet weak var lblTyresPending: UILabel!
    
    @IBOutlet weak var lblBrakesPending: UILabel!
    
    @IBOutlet weak var lblBodyPending: UILabel!
    
    @IBOutlet weak var lblMilagePending: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.hidesBackButton = true
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    

    @IBAction func btnoky(_ sender: Any) {
        
        let next:sellcarViewController = self.storyboard?.instantiateViewController(withIdentifier: "sellcarViewController") as! sellcarViewController
       
        
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    

}
