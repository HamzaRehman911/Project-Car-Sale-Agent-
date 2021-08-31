//
//  SearchViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 03/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//
var toAccessagentvname :[String] = []
var toAccessagentaname :[String] = []
var toAccessagentmodel :[String] = []
var toAccessagentprice :[String] = []
var toAccessagentcity :[String] = []
var toAccessagentimage1 :[String] = []
import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    //forsearch
    let searchcontroller = UISearchController(searchResultsController: nil)
    var searching  = false
    var data = [forsellerSearch]()
    var forsearchdata = [forsellerSearch]()
    
    //forbutton
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var btnpeshawar: UIButton!
    @IBOutlet weak var btnkarachi: UIButton!
    @IBOutlet weak var btnlahore: UIButton!
    @IBOutlet weak var btnrawal: UIButton!
    
    var foraname:[String] = []
    var formodel:[String] = []
    var forcity:[String] = []
    var forimage:[UIImage] = []
    
    
    
   

    @IBOutlet weak var Navigationbar: UINavigationBar!
    
    @IBOutlet weak var viewforcityselection: UIView!
    
    @IBOutlet weak var searchtablev: UITableView!
    
    //city selection outlets
    @IBOutlet weak var selectcity: UIButton!
    //city list outlets
    var selectedcity:String = ""

    @IBOutlet var citiesselection: [UIButton]!
    var issidebtnview:Bool = false
    

    let model = Usersmanager()
    var agentmodelforsearch:[getagentdataforsearch] = []
    
    
    
    override func viewDidLoad() {
      self.navigationItem.setHidesBackButton(true, animated: true)
        //
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Search"
        //
        
        searchbar.delegate = self
        super.viewDidLoad()
        //configuresearchcontroller()
        viewforcityselection.isHidden = true
        issidebtnview = false
        
        let result = model.getagentforsearch()
        if result.count ?? 0 > 0
        {
           

            var c = 0
            while c < result.count
            {

                
                //using initilization storing data into classtype array
                let d = forsellerSearch(uid: result[c].u_id, uname: result[c].u_name,statuss: result[c].status, modl: result[c].model, cty: result[c].address, vimg: Utilities.getimageFromurl(name: result[c].v_image1)!, vimg2: Utilities.getimageFromurl(name: result[c].v_image2)!, vimg3: Utilities.getimageFromurl(name: result[c].v_image3)! , price1: result[c].Price, vnme: result[c].vehicle_name, v_no: result[c].v_no, manufac: result[c].manufacturer, enginee: result[c].engine, tyre: result[c].tyres, brake: result[c].brakes, body: result[c].body, engno: result[c].engine_no, contact: result[c].phoneNumber,method: result[c].Method, role_name: result[c].r_name, rate: result[c].rating)
                data.append(d)
                
                c += 1
                
            }

            
            print(toAccessagentvname)

        }

    //    self.view.addSubview(Navigationbar)

        citiesselection.forEach { (rolebtn) in
           // rolebtn.layer.cornerRadius = rolebtn.frame.height/2.0
            rolebtn.isHidden=true
           
            btnrawal.bringSubviewToFront(btnrawal)
            btnlahore.bringSubviewToFront(btnlahore)
            btnkarachi.bringSubviewToFront(btnkarachi)
            btnpeshawar.bringSubviewToFront(btnpeshawar)
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //

    //for select city button action
    
    @IBAction func btnselectcity(_ sender: Any) {
        viewforcityselection.isHidden = false
        citiesselection.forEach { (rolebtn) in
            UIView.animate(withDuration: 0.02, animations:{
                rolebtn.isHidden = !rolebtn.isHidden
           //     self.viewforcityselection.isHidden = !self.viewforcityselection.isHidden
                self.viewforcityselection.isHidden = false
                self.view.layoutIfNeeded()
           //rolebtn.bringSubviewToFront(rolebtn)
            
            })
        }

        if !issidebtnview
        {
            issidebtnview = true
            viewforcityselection.frame = CGRect(x: 0, y: 138, width: 111, height: 230)
            UIView.setAnimationCurve(UIView.AnimationCurve(rawValue: Int(0.3))!)

            UIView.setAnimationDelegate(self)

            UIView.beginAnimations("ViewAnimation", context: nil)
            CGRect(x: 0, y: 138, width: 0, height: 230)

            UIView.commitAnimations()


        }
        else{
            viewforcityselection.isHidden = true
            issidebtnview = false
            CGRect(x: 0, y: 138, width: 0, height: 230)

            UIView.setAnimationCurve(UIView.AnimationCurve(rawValue: Int(0.3))!)

            UIView.setAnimationDelegate(self)

            UIView.beginAnimations("ViewAnimation", context: nil)

            viewforcityselection.frame = CGRect(x: 0, y: 138, width: 111, height: 230)

            UIView.commitAnimations()

        }
        
        
    }
    
    //forcity button
    @IBAction func btnrawalpindi(_ sender: UIButton) {
        selectedcity = "Rawalpindi"
        print(selectedcity)
        print(data)
    }
    
    @IBAction func btnlahore(_ sender: UIButton) {
        selectedcity = "Lahore"
        print(selectedcity)
    }
    
    @IBAction func btnkarachi(_ sender: UIButton) {
        selectedcity = "Karachi"
        print(selectedcity)
    }
    @IBAction func btnpeshawar(_ sender: UIButton) {
        selectedcity = "Peshawar"
        print(selectedcity)
    }


    //tablview for search
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if searching{
            return forsearchdata.count
        }
        else
        {
        return data.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: SearchTableViewCell = searchtablev.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell

        if searching == true{
            cell.imgcell.image = forsearchdata[indexPath.row].vimage
            
            cell.lblcellname.text = forsearchdata[indexPath.row].vname
            
            var c = forsearchdata[indexPath.row].price
            
           // cell.lblprice.text = forsearchdata[indexPath.row].price
            cell.lblprice.text = "\(c)"
           
            cell.lblcellmodel.text = forsearchdata[indexPath.row].model
            cell.lblcellcity.text = forsearchdata[indexPath.row].city
        }
        else{
             var c = data[indexPath.row].price
            
        cell.imgcell.image = data[indexPath.row].vimage

      cell.lblcellname.text = data[indexPath.row].vname
    cell.lblprice.text = "\(c)"
        cell.lblcellmodel.text = data[indexPath.row].model
        cell.lblcellcity.text = data[indexPath.row].city

        }


        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let next:VehicleDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "VehicleDetailViewController") as! VehicleDetailViewController
        if searching == true
        {
            //var c =
            
            next.vname = forsearchdata[indexPath.row].vname
            next.price = forsearchdata[indexPath.row].price
            next.city = forsearchdata[indexPath.row].city
            next.agentname = forsearchdata[indexPath.row].u_name
            next.contact  = forsearchdata[indexPath.row].phoneno
            next.vno = forsearchdata[indexPath.row].vno
            next.manu = forsearchdata[indexPath.row].manufacturer
            next.model = forsearchdata[indexPath.row].model
            next.engno = forsearchdata[indexPath.row].eng_no
            
            next.engine = forsearchdata[indexPath.row].engine
            next.tyres = forsearchdata[indexPath.row].tyres
            next.brakes = forsearchdata[indexPath.row].brakes
            next.body = forsearchdata[indexPath.row].body
            
            next.img1 = forsearchdata[indexPath.row].vimage
            next.img2 = forsearchdata[indexPath.row].vimage2
            next.img3 = forsearchdata[indexPath.row].vimage3
            
            self.navigationController?.pushViewController(next, animated: true)
            
            
        }
        
        else{
            var c = data[indexPath.row].price
        
        next.vname = data[indexPath.row].vname
        next.price = c
        next.city = data[indexPath.row].city
        next.agentname = data[indexPath.row].u_name
        next.contact  = data[indexPath.row].phoneno
        next.vno = data[indexPath.row].vno
        next.manu = data[indexPath.row].manufacturer
        next.model = data[indexPath.row].model
        next.engno = data[indexPath.row].eng_no
        
        next.engine = data[indexPath.row].engine
        next.tyres = data[indexPath.row].tyres
        next.brakes = data[indexPath.row].brakes
        next.body = data[indexPath.row].body
        
        next.img1 = data[indexPath.row].vimage
        next.img2 = data[indexPath.row].vimage2
        next.img3 = data[indexPath.row].vimage3
        
        self.navigationController?.pushViewController(next, animated: true)
        }
        
        
    }
    
    //for searchbar to search specific tableview data
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            forsearchdata = data
            searchtablev.reloadData()
            return
        }
        forsearchdata = data.filter({forsearchdata -> Bool in forsearchdata.vname.contains(searchText) && forsearchdata.city.contains(selectedcity) })
        
        searching = true
        searchtablev.reloadData()
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        forsearchdata.removeAll()
        searchtablev.reloadData()
    }

    
   
}


class forsellerSearch  {
    var u_id:Int = 0
    var u_name: String = ""
    var status: String = ""
    var vname:String = ""
    var vno: String = ""
    var manufacturer: String = ""
    var model:String = ""
    var city: String = ""
    var price: Int = 0
    var vimage:UIImage!
    var vimage2:UIImage!
    var vimage3:UIImage!
    var engine:Int = 0
    var tyres:Int = 0
    var brakes:Int = 0
    var body:Int = 0
    var phoneno:String = ""
    var eng_no:String = ""
    var Method:String = ""
    var r_name:String = ""
    var rating:String = ""
    
    init(uid:Int,uname:String,statuss:String,modl:String,cty:String,vimg:UIImage,vimg2:UIImage,vimg3:UIImage,price1:Int,vnme:String,v_no:String,manufac:String,enginee:Int,tyre:Int,brake:Int,body:Int,engno:String,contact:String,method:String,role_name:String,rate:String) {
        u_id = uid
        u_name = uname
        status = statuss
        model = modl
        city = cty
        vimage = vimg
        vimage2 = vimg2
        vimage3 = vimg3
        price = price1
        vname = vnme
        vno = v_no
        manufacturer = manufac
        engine = enginee
        tyres = tyre
        brakes = brake
        self.body = body
        eng_no = engno
        phoneno = contact
        Method = method
        r_name = role_name
        rating = rate
        
    }
}

