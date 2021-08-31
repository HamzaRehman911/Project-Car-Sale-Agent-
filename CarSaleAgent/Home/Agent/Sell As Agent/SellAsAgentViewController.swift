 //
//  SellAsAgentViewController.swift
//  CarSaleAgent
//
//  Created by Apple on 05/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//
 
import UIKit

class SellAsAgentViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    var isimageselected:UIImage!

    @IBOutlet weak var btnpostoutlets: UIButton!
    @IBOutlet weak var imgv3: UIImageView!
    @IBOutlet weak var imgv2: UIImageView!
    @IBOutlet weak var imgv1: UIImageView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var btnpic3: UIButton!
    @IBOutlet weak var btnpic2: UIButton!
    @IBOutlet weak var btnpic1: UIButton!
    
    @IBOutlet weak var txtscontact: UITextField!
    @IBOutlet weak var txtvno: UITextField!
    @IBOutlet weak var txtvname: UITextField!
    @IBOutlet weak var txtengno: UITextField!
    @IBOutlet weak var txtmodel: UITextField!
    @IBOutlet weak var txtmanu: UITextField!
    @IBOutlet weak var txtprice: UITextField!
    @IBOutlet weak var txtieng: UITextField!
    @IBOutlet weak var txtibrakes: UITextField!
    @IBOutlet weak var txtibody: UITextField!
    @IBOutlet weak var txtiseats: UITextField!
    @IBOutlet weak var txtisteering: UITextField!
    @IBOutlet weak var txtiinterior: UITextField!
    @IBOutlet weak var txtityres: UITextField!
    
    @IBOutlet weak var viewvdetail: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Sell Vehicle As Agent"
        navigationController?.navigationItem.hidesBackButton = true
       view2.layer.cornerRadius = view2.layer.frame.height/16
        view3.layer.cornerRadius = view3.layer.frame.height/16
        
        btnpic1.layer.cornerRadius = btnpic1.layer.frame.height/13
        btnpic2.layer.cornerRadius = btnpic2.layer.frame.height/13
        btnpic3.layer.cornerRadius = btnpic3.layer.frame.height/13
        
        // Do any additional setup after loading the view.
//        UIScrollView * scrollView = (UIScrollView *) self.view;
//        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1024);
        
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Sell Vehicle As Agent"
        navigationController?.navigationItem.hidesBackButton = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.topItem?.title = "Sell Vehicle As Agent"
    }
    
    @IBAction func btnaddImg1(_ sender: UIButton) {
        
        let imagecontroller1 = UIImagePickerController()
        
        imagecontroller1.delegate = self
        
        imagecontroller1.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagecontroller1, animated: true, completion: nil)
        
        isimageselected = imgv1.image
    }
    
    @IBAction func btnaddImg2(_ sender: UIButton) {
        
        let imagecontroller2 = UIImagePickerController()
       imagecontroller2.delegate = self
        
        imagecontroller2.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagecontroller2, animated: true, completion: nil)
        isimageselected = imgv2.image
        
    }
    
    @IBAction func btnaddImg3(_ sender: UIButton) {
        
        let imagecontroller3 = UIImagePickerController()
       
        imagecontroller3.delegate = self
        
        imagecontroller3.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagecontroller3, animated: true, completion: nil)
        
        isimageselected = imgv3.image
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        switch isimageselected {
        case imgv1.image:
            imgv1.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            self.dismiss(animated: true, completion: nil)
            
        case imgv2.image:
            imgv2.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            self.dismiss(animated: true, completion: nil)
            
        case imgv3.image:
            imgv3.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            self.dismiss(animated: true, completion: nil)
            
            
        default:
            print("None")
        }
    }
    //
    
    
    @IBAction func btnPost(_ sender: UIButton) {
        let amodel = AgentModel()
        let vmodel = VehicleModel()
        let umanager = Usersmanager()
        
        
        let imgData1 = imgv1.image?.stretchableImage(withLeftCapWidth: 50, topCapHeight: 50).pngData()
        let imgData2 = imgv2.image?.stretchableImage(withLeftCapWidth: 50, topCapHeight: 50).pngData()
        let imgData3 = imgv3.image?.stretchableImage(withLeftCapWidth: 50, topCapHeight: 50).pngData()
        
        let api = APIWrapper()
        
        let result = api.UploadImageMethodCall(cJson: imgData1!, controllerName: "user", actionName: "UploadImage")
        let result2 = api.UploadImageMethodCall(cJson: imgData2!, controllerName: "user", actionName: "UploadImage")
        let result3 = api.UploadImageMethodCall(cJson: imgData3!, controllerName: "user", actionName: "UploadImage")
        
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
        
       
        //
        amodel.u_id = Int(d1)!
        amodel.Agent_name = d2
        amodel.v_no = txtvno.text!
        amodel.engine = Int(txtieng.text!)!
        amodel.brakes = Int(txtibrakes.text!)!
        amodel.body = Int(txtibody.text!)!
        amodel.Seats = Int(txtiseats.text!)!
        amodel.Steering = Int(txtisteering.text!)!
        amodel.Interior = Int(txtiinterior.text!)!
        amodel.tyres = Int(txtityres.text!)!
        amodel.Price = Int(txtprice.text!)!
        amodel.status = "Not Sold"
        amodel.Method = "Direct Agent"
        amodel.Seller_contact = txtscontact.text!
        amodel.vehicle_name = txtvname.text!
        amodel.rating = "Not Rated"
        
        
        let resAmod = umanager.addagent(acceptedAgentdata: amodel)
    
        if resAmod == true
        {
            vmodel.v_no = txtvno.text!
            vmodel.vehicle_name = txtvname.text!
            vmodel.engine_no = txtengno.text!
            vmodel.model = txtmodel.text!
            vmodel.manufacturer = txtmanu.text!
            vmodel.v_status = "Not Sold"
            
            vmodel.v_image1 = imgName.replacingOccurrences(of: "\"", with: "")
            
            vmodel.v_image2 = imgName2.replacingOccurrences(of: "\"", with: "")
            
            vmodel.v_image3 = imgName3.replacingOccurrences(of: "\"", with: "")
            
            let resVmod = umanager.addvehicle(vehicle: vmodel)
            
            if resAmod == true
            {
                getagent.removeAll()
                let next:BuyerTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyerTabViewController") as! BuyerTabViewController
                next.viewDidLoad()
                
                let next2:SellAsAgentViewController = self.storyboard?.instantiateViewController(withIdentifier: "SellAsAgentViewController") as! SellAsAgentViewController
                
               // next2.viewDidLoad()
                
                self.navigationController?.pushViewController(next2, animated: true)
                
                showalertforInsertionSuccessful()
            }
            
        }
        else
        {
            showalertforInsertionFailure()
        }
       
    }
    
    func showalertforInsertionSuccessful(){
        let alert=UIAlertController(title: "Posted ", message: "Succesfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }

    func showalertforInsertionFailure(){
        let alert=UIAlertController(title: "Error ", message: "Invalid Data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok")
            
        } ))
        present(alert,animated: true)
    }

}
