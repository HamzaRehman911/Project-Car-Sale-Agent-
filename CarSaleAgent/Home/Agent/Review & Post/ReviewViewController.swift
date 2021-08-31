//
//  ReviewViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 04/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    //var forvname  = Array(repeating: String(), count: 100)
   // var forvname  = Array(repeating: String(), count: 100)
    //var uti = Utilities()
    var getvno:[String] = []
    var getvname:[String] = []
    var getmodel:[String] = []
    var getmake:[String] = []
    var getprice:[Int] = []
    var getphone:[String] = []
    var getimage:[UIImage] = []
    var getimage1:[UIImage] = []
    var getimage2:[UIImage] = []
    var getimage3:[UIImage] = []
    var forimg1:[UIImage] = []
    var forimg2:[UIImage] = []
    var forimg3:[UIImage] = []
    var getmultipleimage:[[UIImage]] = [[]]
    var forallimages:[[UIImage]] = [[]]
    var getdatacount:Int = 0
    
    let sellerrequest:[SellVehicleModel] = []
   
    @IBOutlet weak var pplusicon: UIView!
    

    
    @IBOutlet weak var inspectiontableview: UITableView!
    
    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        super.viewDidLoad()
        self.loadViewIfNeeded()
        //
        pplusicon.layer.cornerRadius = pplusicon.frame.width / 2
        pplusicon.clipsToBounds = true
        //
        //for agent request data
        
        let umobj = Usersmanager()
        
        let solution = umobj.gettingAgentRequestdata(agentNm: d2)
        
        if solution.count ?? 0 > 0
        {
            var forvno  = Array(repeating: String(), count: solution.count)
            var forvname  = Array(repeating: String(), count: solution.count)
            var formodel  = Array(repeating: String(), count: solution.count)
            var formake  = Array(repeating: String(), count: solution.count)
            var forprice  = Array(repeating: Int(), count: solution.count)
            var forphoneno  = Array(repeating: String(), count: solution.count)
           // var forstringtoimage  = Array(repeating: String(), count: solution.count)
            var forimage1  = Array(repeating: UIImage(), count: solution.count)
            var forimage2  = Array(repeating: UIImage(), count: solution.count)
            var forimage3  = Array(repeating: UIImage(), count: solution.count)
//            var forallimages  = Array(Array(repeating: UIImage(), count: solution.count))
           
        
            var c:Int =  0
            var cc:Int =  0
            var go:Int  = solution.count
            getdatacount = solution.count
            
          //print(solution[0].u_name)
            print(solution[0].vehicle_name)
            print(solution[0].manufacturer)
            print(solution[0].status)
            print(solution[0].address)
            print(solution[0].phoneNumber)//0367219048
            
        while c<go
        {
            forvno[c] = solution[c].v_no
            forvname[c] = solution[c].vehicle_name
            formodel[c] = solution[c].model
            formake[c] = solution[c].manufacturer
            forprice[c] = solution[c].price
            forphoneno[c] = solution[c].phoneNumber!
           // forstringtoimage[c] = solution[c].v_image1
            forimage1[c] = Utilities.getimageFromurl(name: solution[c].v_image1)!
            forimage2[c] = Utilities.getimageFromurl(name: solution[c].v_image2)!
            forimage3[c] = Utilities.getimageFromurl(name: solution[c].v_image3)!
            
           
          // forallimages[c] = Utilities.getimageFromurl(name: solution[c].v_image3)!
          // getmultipleimage[c].images = [UIImage(named: "forimage1")!,UIImage(named: "forimage2")!,UIImage(named: "forimage3")!]
           //logoImages += [UIImage(named: "logo.png")!, UIImage(named: "logo2.png")!]
           // getmultipleimage[c] += UIImage(named: forimage1[c])
            c += 1
         
            }
            getmultipleimage = [forimage1,forimage2,forimage3]
            forimg1 = forimage1
            forimg2 = forimage2
            forimg3 = forimage3
            
            
            getvno = forvno
            getvname = forvname
            getmodel = formodel
            getmake = formake
            getprice = forprice
            getphone = forphoneno
            getimage = forimage1
            getimage1 = forimage1
            getimage2 = forimage2
            getimage3 = forimage3
           // print(getmultipleimage)
            print(forallimages)
           
           
            
        }
 
    }

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getvname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:inspectionTableViewCell = inspectiontableview.dequeueReusableCell(withIdentifier: "cell") as! inspectionTableViewCell
    inspectiontableview.separatorStyle = UITableViewCell.SeparatorStyle.singleLine;
        
        
        cell.layer.borderWidth = 0.3
        cell.layer.shadowOffset = CGSize(width: -1, height: 0.3)

        cell.lblinsname.text = getvname[indexPath.row]
        
        cell.lblinsmodel.text = getmodel[indexPath.row]
        
        cell.imginspection.image = getimage[indexPath.row]
        
        return cell
        
        
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail:RequestedsellerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RequestedsellerViewController") as! RequestedsellerViewController
        
        detail.getvidfromseller = getvno[indexPath.row]
        detail.getphonefromreview = getphone[indexPath.row]
        detail.strlbl1 = getvname[indexPath.row]
        
        detail.strlbl2 = getmake[indexPath.row]
        detail.str3 = getmodel[indexPath.row]
        detail.strprice = getprice[indexPath.row]
        
        
        //detail.strimg = getmultipleimage[indexPath.row]
        detail.img1 = getimage1[indexPath.row]
        detail.img2 = getimage2[indexPath.row]
        detail.img3 = getimage3[indexPath.row]
        
        
        self.navigationController?.pushViewController(detail, animated: true)
        
        
    }

}

