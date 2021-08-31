//
//  RequestStatusViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 30/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class RequestStatusViewController: UIViewController,UITableViewDelegate
,UITableViewDataSource{

    
    var sellv = [SellVehicleModel]()
    @IBOutlet weak var tableview: UITableView!
    
    var vn = [String]()
    var an = [String]()
    var stats = [String]()
    override func viewDidLoad() {
        navigationController?.navigationBar.topItem?.hidesBackButton = false
        navigationController?.navigationItem.hidesBackButton = false
        self.navigationItem.setHidesBackButton(false, animated: true)
        navigationController?.navigationBar.topItem?.title = "Request Status"
        navigationController?.navigationBar.isHidden = false
        
        super.viewDidLoad()

        let um = Usersmanager()
        
        //
      let res = um.getsellervehicle(sname: d2)
        if res.count ?? 0 > 0
        {
            sellv = res
        }
        //
//        let getres = [sellerRequestResponse]()
//
//        let result = um.SellerResponse(sname: d2)
//        if result.count ?? 0 > 0
//        {
//            var vnme = Array(repeating: String(), count: result.count)
//            var aname = Array(repeating: String(), count: result.count)
//            var status = Array(repeating: String(), count: result.count)
//            var c = 0
//            while c < result.count
//            {
//                vnme[c] = result[c].vehicle_name
//                aname[c] = result[c].Requested_agent
//                status[c] = result[c].status
//                c += 1
//            }
//            vn = vnme
//            an = aname
//            stats = status
//
//        }
     
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationItem.hidesBackButton = false
        navigationController?.navigationBar.topItem?.hidesBackButton = false
        self.navigationItem.setHidesBackButton(false, animated: true)

        navigationController?.navigationBar.topItem?.title = "Request Status"
        navigationController?.navigationBar.isHidden = false
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        // Set to new colour for whole app
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        // Or, Set to new colour for just this navigation bar
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        //  self.tabBarController?.navigationItem.title = "Home";
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        //Revert to old colour, whole app
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        //Revert to old colour, just this navigation bar
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sellv.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let next:RequestStatusTableViewCell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RequestStatusTableViewCell
        
        next.delegate = self
        next.btnindex.tag = indexPath.row
        
        next.status.layer.cornerRadius = next.status.layer.frame.height/8;        next.status.layer.masksToBounds = true
        //next.layer.cornerRadius = next.layer.frame.height/7
        
        next.vname.text = sellv[indexPath.row].vehicle_name
        next.agentname.text = sellv[indexPath.row].manufacturer
        next.status.text = sellv[indexPath.row].status
        
        var c = sellv[indexPath.row].price
        next.lblprice.text = "\(c)"
        
        var img:UIImage = Utilities.getimageFromurl(name: sellv[indexPath.row].v_image1)!
        next.vimg.image = img
        return next
        
    }
    
}
extension RequestStatusViewController:CellDelegate
{
    func Cellbtntapped(tag: Int) {
        print(tag)
    }
    
    
}
