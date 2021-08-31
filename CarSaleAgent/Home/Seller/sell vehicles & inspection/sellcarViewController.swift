//
//  sellcarViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 01/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//
var vehicle_id = 0
import UIKit

class sellcarViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var imgfordropdown: UIImageView!
    //outletsoftextfields
    @IBOutlet weak var txtvno: UITextField!
    @IBOutlet weak var txtvname: UITextField!
    @IBOutlet weak var txtengineno: UITextField!
    @IBOutlet weak var txtmaker: UITextField!
    @IBOutlet weak var txtmodel: UITextField!
    @IBOutlet weak var txtprice: UITextField!
    
    @IBOutlet weak var btnselectOutlet: UIButton!
    
    //togetagentwhile selecting drop down agent
    var selectedagent: String = ""
    
    //forselectionof agent
    var selectagent:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","",""]
    
     var issideviewopen:Bool = false
    
    @IBOutlet weak var sideselectionview: UIView!
    @IBOutlet weak var agentselectiontview: UITableView!
    //
    var um = Usersmanager()

    var isimageselected:UIImage!
    
    //for agentselectiontableview

    //this class is for sellcar view

    @IBOutlet weak var btns1: UIButton!
    @IBOutlet weak var btns2: UIButton!
    @IBOutlet weak var btns3: UIButton!
    @IBOutlet weak var btns4: UIButton!

    
    
    @IBOutlet var sellcarmainview: UIView!
    
    @IBOutlet weak var imgview1: UIImageView!
    @IBOutlet weak var imgview2: UIImageView!
    @IBOutlet weak var imgview3: UIImageView!
    @IBOutlet weak var imgview4: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for seller changed scenario hiding select button to post data directly by seller(if want to show selectAgent button later then need to unhide that button from below)
      //  btnselectOutlet.isHidden = true
     //  imgfordropdown.isHidden = true
       //  sideselectionview.isHidden = true
        //
        let agentresponse = um.getagents()
        
        if agentresponse.count ?? 0 > 0
        {
            let gt:Int = agentresponse.count
            var c:Int = 0
            while c<gt{
                var getagent = agentresponse[c].u_name!
                print(getagent)
                selectagent[c] = getagent
                c += 1
                
            }
        }
        else
        {
        
            print("No Agents to display")
        }
//
  
       navigationController?.navigationItem.hidesBackButton = true
       // issideviewopen = false
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //btnselectOutlet.isHidden = true
    navigationController?.navigationItem.hidesBackButton = true
    navigationController?.setNavigationBarHidden(true, animated: animated)
        // Set to new colour for whole app
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        // Or, Set to new colour for just this navigation bar
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        //  self.tabBarController?.navigationItem.title = "Home";
      //  btnselectOutlet.layer.borderWidth = 1.5
       // agentselectiontview.layer.borderWidth = 1.5
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        //Revert to old colour, whole app
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        //Revert to old colour, just this navigation bar
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        // btnselectOutlet.layer.borderWidth = 1.5
    }

    
    //btnselectimages code
    
    @IBAction func btnselect1(_ sender: UIButton) {
        let imagecontroller = UIImagePickerController()
        
        imagecontroller.delegate = self
        imagecontroller.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagecontroller, animated: true, completion: nil)
        
       isimageselected = imgview1.image
        
    }
    
    
    
    
    @IBAction func btnselect2(_ sender: UIButton) {
        let imagecontroller2 = UIImagePickerController()
        imagecontroller2.delegate = self
        imagecontroller2.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagecontroller2, animated: true, completion: nil)
        isimageselected = imgview2.image
        
    }
    

    
    @IBAction func btnselect3(_ sender: UIButton) {
        let imagecontroller3 = UIImagePickerController()
        imagecontroller3.delegate = self
        imagecontroller3.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagecontroller3, animated: true, completion: nil)
        
        isimageselected = imgview3.image
        
    }

    
    @IBAction func btnselect4(_ sender: UIButton) {
        let imagecontroller4 = UIImagePickerController()
        imagecontroller4.delegate = self
        imagecontroller4.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagecontroller4, animated: true, completion: nil)
        
        isimageselected = imgview4.image
        
    }
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        switch isimageselected {
        case imgview1.image:
            imgview1.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            self.dismiss(animated: true, completion: nil)
            
        case imgview2.image:
            imgview2.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            self.dismiss(animated: true, completion: nil)
        
        case imgview3.image:
            imgview3.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            self.dismiss(animated: true, completion: nil)
            
        case imgview4.image:
            imgview4.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            self.dismiss(animated: true, completion: nil)
        
        default:
            print("None")
        }

    }
    
   
    
    
    //btnuploadimages code
    
    @IBAction func btnupload(_ sender: UIButton) {
       //
        
       
    }
    
    
    //for agentselectiondropdown button
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectagent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let agentcell:agentselectionTableViewCell = agentselectiontview.dequeueReusableCell(withIdentifier: "cell") as! agentselectionTableViewCell
        agentcell.lblselectagent.text = selectagent[indexPath.row]
        
        return agentcell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       selectedagent = selectagent[indexPath.row]
       print(selectedagent)
        if selectedagent.count > 0
        {
        btnselectOutlet.titleLabel?.text = selectedagent
            
            imgfordropdown.image = #imageLiteral(resourceName: "down")
            agentselectiontview.isHidden = true
            sideselectionview.isHidden = true
            
            issideviewopen = false
            
            //clearifying the actuall size of view and tview before hiding
            sideselectionview.frame = CGRect(x: 11, y: 426, width: 159, height: 88)
            
            agentselectiontview.frame = CGRect(x: 0, y: 0, width: 159, height: 90)
            
            
            UIView.setAnimationDuration(0.3)
            
            UIView.setAnimationDelegate(self)
            
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideselectionview.frame = CGRect(x: 11 , y: 426, width: 0, height: 88)
            
            agentselectiontview.frame = CGRect(x: 0, y: 0, width: 0, height: 90)
            
            UIView.commitAnimations()
            
        }
        
       // print(selectagent[indexPath.row])
    }
    
    
    
    
    //btnselectAgent
    
//    @IBAction func btnselectagent(_ sender: UIButton) {
//        imgfordropdown.image = #imageLiteral(resourceName: "up")
//        agentselectiontview.isHidden = false
//        sideselectionview.isHidden = false
//        self.view.bringSubviewToFront(sideselectionview)
//        if !issideviewopen{
//            issideviewopen = true
//
//            //clearifying the actuall size of view and tview before showing
//            sideselectionview.frame = CGRect(x: 11 , y: 426, width: 0, height: 88)
//
//            agentselectiontview.frame = CGRect(x: 0, y: 0, width: 0, height: 90)
//
//            UIView.setAnimationDuration(0.3)
//
//            UIView.setAnimationDelegate(self)
//
//            UIView.beginAnimations("TableAnimation", context: nil)
//
//            sideselectionview.frame = CGRect(x: 11, y: 426, width: 159, height: 88)
//
//            agentselectiontview.frame = CGRect(x: 0, y: 0, width: 159, height: 90)
//
//            UIView.commitAnimations()
//        }
//
//        else{
//            imgfordropdown.image = #imageLiteral(resourceName: "down")
//            agentselectiontview.isHidden = true
//            sideselectionview.isHidden = true
//
//            issideviewopen = false
//
//            //clearifying the actuall size of view and tview before hiding
//            sideselectionview.frame = CGRect(x: 11, y: 426, width: 159, height: 88)
//
//            agentselectiontview.frame = CGRect(x: 0, y: 0, width: 159, height: 90)
//
//
//            UIView.setAnimationDuration(0.3)
//
//            UIView.setAnimationDelegate(self)
//
//            UIView.beginAnimations("TableAnimation", context: nil)
//
//            sideselectionview.frame = CGRect(x: 11 , y: 426, width: 0, height: 88)
//
//            agentselectiontview.frame = CGRect(x: 0, y: 0, width: 0, height: 90)
//
//            UIView.commitAnimations()
//
//
//        }
//
//
//    }
    
   
    //save record of seller into databse
    
    @IBAction func btndone(_ sender: UIButton) {
        
        let sellM = SellerModel()
        let vehicleM = VehicleModel()
        let agentM = AgentModel()
        
        
        var str :String = txtvno.text!
        
        print(str)
        vehicle_id = Int(txtvno.text!)!
        
        //forsellerinsertion into database
        sellM.u_id = Int(d1)!
        sellM.Seller_name = d2
        sellM.v_no = txtvno.text!
      //  sellM.Requested_agent = selectedagent (for previous scenario when seller send request to agent)
        sellM.Requested_agent = "None"
     //   sellM.status = "Pending"
        sellM.status = "Not Sold"
        sellM.price = Int(txtprice.text!)!
     // sellM.Method = "Through Agent"
        sellM.Method = "Private"
        
        
        let sm = Usersmanager()
        let solution1 = sm.addseller(seller: sellM)
        
        //Agent insertion
        agentM.u_id = Int(d1)!
        agentM.Agent_name = "None"
        agentM.v_no = txtvno.text!
        agentM.engine = 0
        agentM.brakes = 0
        agentM.body = 0
        agentM.Seats = 0
        agentM.Steering = 0
        agentM.Interior = 0
        agentM.tyres = 0
        agentM.status = "Not Sold"
        agentM.Price = Int(txtprice.text!)!
        agentM.Method = "Private"
        agentM.Seller_contact = d3
        agentM.vehicle_name = txtvname.text!
        agentM.rating = "Not Rated"
        
        let solution3 = sm.addagent(acceptedAgentdata: agentM)

        
        //forvehicle insertion into database
        vehicleM.v_no = txtvno.text!
        vehicleM.vehicle_name = txtvname.text!
        vehicleM.engine_no = txtengineno.text!
        vehicleM.model = txtmodel.text!
        vehicleM.manufacturer = txtmaker.text!
        vehicleM.v_status = "Not Sold"
       //var imgtest:UIImage = #imageLiteral(resourceName: "n1")
        
        let imgData1 = imgview1.image?.stretchableImage(withLeftCapWidth: 80, topCapHeight: 70).pngData()
        let imgData2 = imgview2.image?.stretchableImage(withLeftCapWidth: 80, topCapHeight: 70).pngData()
        let imgData3 = imgview3.image?.stretchableImage(withLeftCapWidth: 80, topCapHeight: 70).pngData()
        let imgData4 = imgview4.image?.stretchableImage(withLeftCapWidth: 80, topCapHeight: 70).pngData()
        
        
        
        let api = APIWrapper()
        
        let result = api.UploadImageMethodCall(cJson: imgData1!, controllerName: "user", actionName: "UploadImage")
        let result2 = api.UploadImageMethodCall(cJson: imgData2!, controllerName: "user", actionName: "UploadImage")
        let result3 = api.UploadImageMethodCall(cJson: imgData3!, controllerName: "user", actionName: "UploadImage")
//        let result4 = api.UploadImageMethodCall(cJson: imgData4!, controllerName: "user", actionName: "UploadImage")
        
        var imgName = ""
        var imgName2 = ""
        var imgName3 = ""
      //  var imgName4 = ""
        if(result.ResponseCode == 200)
        {
            imgName = String(data: result.ResponseData!,encoding: .utf8)!
            
        }
        if (result2.ResponseCode == 200)
        {
            imgName2 = String(data: result2.ResponseData!,encoding: .utf8)!
        }
        if (result3.ResponseCode == 200)
        {
            imgName3 = String(data: result3.ResponseData!,encoding: .utf8)!
        }
//        if (result4.ResponseCode == 200)
//        {
//            imgName4 = String(data: result4.ResponseData!,encoding: .utf8)!
//        }
        
            
        vehicleM.v_image1 = imgName.replacingOccurrences(of: "\"", with: "")
        vehicleM.v_image2 = imgName2.replacingOccurrences(of: "\"", with: "")
        vehicleM.v_image3 = imgName3.replacingOccurrences(of: "\"", with: "")
       // vehicleM.v_image4 = imgName4.replacingOccurrences(of: "\"", with: "")
        let vm = Usersmanager()
        let solution2 = vm.addvehicle(vehicle: vehicleM)
        
        if solution2 && solution1 && solution3 == true
        {
            let next2:SellerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "SellerTabViewController") as! SellerTabViewController
            getagent.removeAll()
            
            next2.viewDidLoad()

            
            
            let next:sellcarViewController = self.storyboard?.instantiateViewController(withIdentifier: "sellcarViewController") as! sellcarViewController
            
            next.viewDidLoad()
            
            self.navigationController?.pushViewController(next, animated: true)
            showalertforInsertionSuccessful()
            
        }
        else
        {
            showalertforfailure()
            
        }
        
    }
    
    
    
//  Alert messages
    func showalertforInsertionSuccessful(){
        let alert=UIAlertController(title: "Sending Request ", message: "Succesfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }
//    func showalertforvehicle(){
//        let alert=UIAlertController(title: "Vehicle Insertion", message: "Succesfull", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
//
//        } ))
//        present(alert,animated: true)
//    }
    func showalertforfailure(){
        let alert=UIAlertController(title: "Sending Request ", message: "Failed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }
//
}
