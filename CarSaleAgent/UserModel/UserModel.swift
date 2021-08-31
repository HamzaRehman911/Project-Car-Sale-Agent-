//
//  UserModel.swift
//  CarSaleAgent
//
//  Created by Apple on 20/03/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
class RegModel: Codable {
    
    var Agent_name:String = ""
    var Bid:Int = 0
    var Buyer_name:String = ""
    var Reg_status:String = ""
    
}
class RefVehModel:Codable
{
    //
    
    var Agent_name:String = ""
    var model:String = ""
    var engine: Int = 0
    var tyres: Int = 0
    var brakes: Int = 0
    var body: Int = 0
    var v_no:String = ""
    var vehicle_name:String = ""
    var manufacturer:String = ""
    var engine_no:String = ""
    var v_image1:String = ""
    var v_image2:String = ""
    var v_image3:String = ""
    var Seats:Int = 0
    var Steering:Int = 0
    var Interior:Int = 0
    var rating:String = ""
    var sell_price:Int = 0
    var phoneNumber:String = ""
    var address:String = ""
    
    
}
class RefModel: Codable {
    
    var Agent_name:String = ""
    var Buyer_name:String = ""
    var v_no: String = ""
    var vehicle_name: String = ""
    var sell_price: Int = 0
    var v_status:String = ""
    
}
class GetRegBuy: Codable {
    
    var Agent_name:String = ""
    var Bid:Int = 0
    var Buyer_name:String = ""
    var Reg_status:String = ""
    var address:String = ""
    var phoneNumber:String = ""
    
    
}
class UserModel:Codable
{
    
     var u_id: Int = 0
     var u_name: String?=""
     var phoneNumber: String?=""
     var address: String? = ""
     var password: String? = ""
     var r_id: Int? = 0
     var r_name: String? = ""
    
}
class UserModelForEdit:Codable
{
    
    var u_id: Int = 0
    var u_name: String?=""
    var phoneNumber: String?=""
    var address: String? = ""
    var password: String? = ""
    var r_id: Int? = 0
    
}
class SellerModel:Codable
{
    var u_id: Int = 0
    var Seller_name:String = ""
    var v_no: String = ""
    var Requested_agent: String = ""
    var status: String = ""
    var price:Int = 0
    var Method:String = ""
}
class AgentModel:Codable {
    var u_id: Int = 0
    var Agent_name: String = ""
    var v_no: String = ""
    var engine:Int = 0
    var tyres:Int = 0
    var brakes:Int = 0
    var body:Int = 0
    var rating:String = ""
    var status:String = ""
    var Price:Int = 0
    var Seats:Int = 0
    var Steering:Int = 0
    var Interior:Int = 0
    var Method:String = ""
    var Seller_contact:String = ""
    var vehicle_name:String = ""


    
}
class ForMOdifySellerStatus:Codable
{
    var v_no:String = ""
    var status:String = ""
    var Method:String = ""
    
}
class VehicleModel: Codable {
    var v_no: String = ""
    var vehicle_name: String = ""
    var engine_no: String = ""
    var model: String = ""
    var manufacturer: String = ""
    var v_image1: String = ""
    var v_image2: String = ""
    var v_image3: String = ""
    var v_status: String = ""
    
}
class SellVehicleModel: Codable
{
    
    var u_id: Int = 0
    var u_name: String?=""
    var phoneNumber: String?=""
    var address: String? = ""
    var password: String? = ""
    var Requested_agent: String = ""
    var status: String = ""
    var v_no: String = ""
    var vehicle_name: String = ""
    var price:Int = 0
    var engine_no: String = ""
    var model: String = ""
    var manufacturer: String = ""
    var v_image1: String = ""
    var v_image2: String = ""
    var v_image3: String = ""
    var Method:String = ""

}
class getagentdataforsearch:Codable
{
    //this data is of accepted agents
    var u_id:Int = 0
    var u_name:String = ""
    var status:String = ""
    var address:String = ""
    var Price: Int = 0
    var engine: Int = 0
    var tyres: Int = 0
    var brakes: Int = 0
    var body: Int = 0
    var phoneNumber:String = ""
    var v_no:String = ""
    var vehicle_name:String = ""
    var model:String = ""
    var manufacturer:String = ""
    var engine_no:String = ""
    var v_image1:String = ""
    var v_image2:String = ""
    var v_image3:String = ""
    var Seats:Int = 0
    var Steering:Int = 0
    var Interior:Int = 0
    var Method:String = ""
    var r_name:String = ""
    var rating:String = ""
    
    
}
class BuyerModel:Codable
{
    var u_id: Int = 0
    var Buyer_name: String = ""
    var v_no: String = ""
    var vehicle_name: String = ""
    var price: Int = 0
    var status: String = ""
    var offer: Int = 0
    var offer_Response: String = ""
    var Agent_name: String = ""
    var Seller_name:String = ""
    
}
class sellerRequestResponse:Codable
{
    var vehicle_name: String = ""
    var Requested_agent: String = ""
    var v_no: String = ""
    var status: String = ""
}
//to get buyerrequestresponse from agent
class getbuyerRresponse:Codable
{
    var Buyer_name:String = ""
    var vehicle_name:String = ""
    var v_no:String = ""
    var price:Int = 0
    var offer:Int = 0
    var offer_Response:String = ""
    var Agent_name:String = ""
    var v_image1:String = ""
    var v_image2:String = ""
    var v_image3:String = ""
    var model:String = ""
    var engine_no:String = ""
    var status:String = ""
    var address:String = ""
    var Seller_name:String = ""
    
}
//to get buyerrequestv for agent

class getbuyerRequest:Codable
{
    var Buyer_name:String = ""
    var vehicle_name:String = ""
    var v_no:String = ""
    var Price:Int = 0
    var status:String = ""
    var offer:Int = 0
    var v_image1:String = ""
    var v_image2:String = ""
    var v_image3:String = ""
    var model:String = ""
    var engine_no:String = ""
    var phoneNumber:String = ""
    var address:String = ""
}
class rate: Codable {
    var rating:String = ""
}
class Resreg: Codable {
    var Agent_name:String = ""
    var Buyer_name:String = ""
    var Reg_status:String = ""
}

//
class Usersmanager
{
    
    var apiwrapper=APIWrapper()
    var decoder=JSONDecoder()
    var encoder=JSONEncoder()
    var Message=""
    
    
    
    
    public func alluser(phoneNo: String, Password : String)->[UserModel]
    {
        
       var users:[UserModel]=[]
       // var us:UserModel=""
        let result=apiwrapper.getMethodCall(controllerName: "user", actionName: "Userlogin?phoneNo=\(phoneNo)&Password=\(Password)")
      
        if result.ResponseCode==200{
            
            guard let data=result.ResponseData
                else{
                    
                    Message=result.ResponseMessage
                   return users
                   // return us
            }
            //data is now valid
            users = try! decoder.decode([UserModel].self,from: data)
          
            
        }
        else {
            
            Message=result.ResponseMessage
        }
       return users
    
    }
    
    
    
    
    public func getagentforsearch()->[getagentdataforsearch]
    {
        
        var agents:[getagentdataforsearch]=[]
        
        let result=apiwrapper.getMethodCall(controllerName: "user", actionName: "agentdataforsearch")
        
        if result.ResponseCode==200{
            
            guard let data=result.ResponseData
                else{
                    
                    Message=result.ResponseMessage
                    return agents
                    // return us
            }
            //data is now valid
            agents = try! decoder.decode([getagentdataforsearch].self,from: data)
            
            
        }
        else {
            
            Message=result.ResponseMessage
        }
        return agents
        
    }
    
    
    
    
    
    public func gettingAgentRequestdata(agentNm: String)->[SellVehicleModel]
    {
       
        var sellervehicle: [SellVehicleModel] = []
        
        let result = apiwrapper.getMethodCall(controllerName: "user", actionName: "agentrequestdata?agentNm=\(agentNm)")
        
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData
                else{
                    Message = result.ResponseMessage
                    return sellervehicle
                    
                    
            }
            
            sellervehicle = try! decoder.decode([SellVehicleModel].self, from: data)
            
        }
        else
        {
            
            Message  = result.ResponseMessage
            
        }
        return sellervehicle
        
    }
    
    
    
    
    public func adduser(user:UserModel)->Bool
    {
        let data=try! encoder.encode(user)
        
        let result = apiwrapper.postMethodCall(controllerName: "user", actionName: "insertusers", httpBody: data)
        
        if result.ResponseCode==200{
            
            return true
        }
        else{
            Message=result.ResponseMessage
            return false
        }
        
        
    }
    
    
    
    public func addagent(acceptedAgentdata: AgentModel)->Bool
    {
        let data = try! encoder.encode(acceptedAgentdata)
        let result = apiwrapper.postMethodCall(controllerName: "user", actionName: "AcceptedagentData", httpBody: data)
        
        if result.ResponseCode==200
        {
         return true
            
        }
        else{
            Message = result.ResponseMessage
            return false
        }
        
    }
    
    
    
    
    public func Modifyseller(sellermodification: ForMOdifySellerStatus)->Bool
    {
        let data = try! encoder.encode(sellermodification)
        let result = apiwrapper.postMethodCall(controllerName: "user", actionName: "ModifySeller", httpBody: data)
        
        if result.ResponseCode==200
        {
            return true
            
        }
        else{
            Message = result.ResponseMessage
            return false
        }
        
    }
    
    
    
    
    
    public func getagents()->[UserModel]
    {
        var agents:[UserModel]=[]
        // var us:UserModel=""
        let result=apiwrapper.getMethodCall(controllerName: "user", actionName: "getAgents")
        
        if result.ResponseCode==200{
            
            guard let data=result.ResponseData
                else{
                    
                    Message=result.ResponseMessage
                    return agents
                    
            }
            //data is now valid
            agents = try! decoder.decode([UserModel].self,from: data)
            
            
        }
        else {
            
            Message=result.ResponseMessage
        }
        return agents
    
    }
    
    
    
    
    public func addseller(seller:SellerModel)->Bool
    {
        let data1 = try! encoder.encode(seller)
        let result1 = apiwrapper.postMethodCall(controllerName: "user", actionName: "insertseller", httpBody: data1)
        if result1.ResponseCode==200
        {
            return true
            
        }
        else{
            Message = result1.ResponseMessage
            return false
            
        }
        
    }
    
    
    
    
    public func addvehicle(vehicle:VehicleModel)->Bool
    {
        let data2 = try! encoder.encode(vehicle)
        let result1 = apiwrapper.postMethodCall(controllerName: "user", actionName: "insertvehicle", httpBody: data2)
        if result1.ResponseCode==200
        {
            return true
            
        }
        else{
            Message = result1.ResponseMessage
            return false
            
        }
        
    }
    
    
    
    
    //
    public func addBuyer(buyer:BuyerModel)->Bool
    {
        let data2 = try! encoder.encode(buyer)
        let result1 = apiwrapper.postMethodCall(controllerName: "user", actionName: "insertBuyerdata", httpBody: data2)
        if result1.ResponseCode==200
        {
            return true
            
        }
        else{
            Message = result1.ResponseMessage
            return false
            
        }
        
    }
    
    
    
    
    //
    public func ModifyAgent(agentD:AgentModel)->Bool
    {
        let dataA = try! encoder.encode(agentD)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifyAgent", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    
    
    //
    public func SellerResponse(sname: String)->[sellerRequestResponse]
    {
        
        var seller: [sellerRequestResponse] = []
        
        let result = apiwrapper.getMethodCall(controllerName: "user", actionName: "getSellerRequestResponse?sname=\(sname)")
        
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData
                else{
                    Message = result.ResponseMessage
                    return seller
                    
                    
            }
            
            seller = try! decoder.decode([sellerRequestResponse].self, from: data)
            
        }
        else
        {
            
            Message  = result.ResponseMessage
            
        }
        return seller
        
    }
    
    
    
    
    //to getbuyerRresponse from agent
    public func getBuyerReqresponse(bname: String)->[getbuyerRresponse]
    {
        
        var buyerR: [getbuyerRresponse] = []
        
        let result = apiwrapper.getMethodCall(controllerName: "user", actionName: "getBuyerReqResponse?bname=\(bname)")
        
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData
                else{
                    Message = result.ResponseMessage
                    return buyerR
                    
                    
            }
            
            buyerR = try! decoder.decode([getbuyerRresponse].self, from: data)
            
        }
        else
        {
            
            Message  = result.ResponseMessage
            
        }
        return buyerR
        
    }
    
    
    
    
    //to get request(make an offer request) from buyer by passing agent name
    
    public func getbuyerRequestforagent(aname: String)->[getbuyerRequest]
    {
        
        var buyerReq: [getbuyerRequest] = []
        
        let result = apiwrapper.getMethodCall(controllerName: "user", actionName: "getAgentDataRfromBuyer?aname=\(aname)")
        
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData
                else{
                    Message = result.ResponseMessage
                    return buyerReq
                    
                    
            }
            
            buyerReq = try! decoder.decode([getbuyerRequest].self, from: data)
            
        }
        else
        {
            
            Message  = result.ResponseMessage
            
        }
        return buyerReq
        
    }
    
    
    
    
    //to get buyer request for seller
    public func getReqfrombuyerForseller(sname: String)->[getbuyerRequest]
    {
        
        var buyerReq: [getbuyerRequest] = []
        
        let result = apiwrapper.getMethodCall(controllerName: "user", actionName: "getReqfrombuyerForseller?sname=\(sname)")
        
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData
                else{
                    Message = result.ResponseMessage
                    return buyerReq
                    
                    
            }
            
            buyerReq = try! decoder.decode([getbuyerRequest].self, from: data)
            
        }
        else
        {
            
            Message  = result.ResponseMessage
            
        }
        return buyerReq
        
    }
    
    
    
    
    //
    //to modify buyer by agent replying to make an offer
    public func Modifybuyerbyagent(buyerD:BuyerModel)->Bool
    {
        let dataB = try! encoder.encode(buyerD)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifyBuyerbyAgent", httpBody: dataB)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    //to modify buyer when accept or reject request by seller modifyBuyerbySeller
    public func modifyBuyerbySeller(buyerD:BuyerModel)->Bool
    {
        let dataB = try! encoder.encode(buyerD)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifyBuyerbySeller", httpBody: dataB)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    
    
    //for agentProfiledata
    public func AgentProfiledata(agentName:String)->[getagentdataforsearch]
    {
        var getdata = [getagentdataforsearch]()
        let getresult = apiwrapper.getMethodCall(controllerName: "user", actionName: "AgentProfiledata?agentName=\(agentName)")
        
        if getresult.ResponseCode == 200
        {
            guard let data = getresult.ResponseData
            else
            {
                Message = getresult.ResponseMessage
                return getdata
            }
            getdata = try! decoder.decode([getagentdataforsearch].self, from: data)
        }
        else{
            Message = getresult.ResponseMessage
        }
        return getdata
    }
    
    
    

    //to updateagent when vehicle is purchased
    //
    public func modifyAgentforPur(agentData:AgentModel)->Bool
    {
        let dataA = try! encoder.encode(agentData)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifyAgentforPur", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    
    //to update buyer when he purchase vehicle
    public func modifybuyerforPur(buyerData:BuyerModel)->Bool
    {
        let dataA = try! encoder.encode(buyerData)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifybuyerforPur", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    
    //modifybuyerSforPur to modify buyer while seller car is purchased through making offer
    public func modifybuyerSforPur(buyerData:BuyerModel)->Bool
    {
        let dataA = try! encoder.encode(buyerData)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifybuyerSforPur", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    
    //modifyAtableForSeller when seller car is purchased without making offer
    public func modifyAtableForSeller(Adata:AgentModel)->Bool
    {
        let dataA = try! encoder.encode(Adata)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifyAtableForSeller", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    

    //to modify seller table when his vehicle is purchased directly without making offer
    
    public func modifyStablewhilepur(Sdata:SellerModel)->Bool
    {
        let dataA = try! encoder.encode(Sdata)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifyStablewhilepur", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    //
    public func modifyvtablewhilepur(vdata:VehicleModel)->Bool
    {
        let dataA = try! encoder.encode(vdata)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifyvtablewhilepur", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    //
    
    
    //modifyAtableForSellerbyMoffer  to modify Atable for seller when seller car is purchased through making offer
    public func modifyAtableForSellerbyMoffer(Adata:AgentModel)->Bool
    {
        let dataA = try! encoder.encode(Adata)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifyAtableForSellerbyMoffer", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    
    //modifyStablewhilepurbyMoffer modify seller when seller car is puchased through making offer
    public func modifyStablewhilepurbyMoffer(Sdata:SellerModel)->Bool
    {
        let dataA = try! encoder.encode(Sdata)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "modifyStablewhilepurbyMoffer", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    
    
    //get agent rating
    public func getRating(aname:String)->[rate]
    {
        var getdata = [rate]()
        let getresult = apiwrapper.getMethodCall(controllerName: "user", actionName: "getRating?aname=\(aname)")
        
        if getresult.ResponseCode == 200
        {
            guard let data = getresult.ResponseData
                else
            {
                Message = getresult.ResponseMessage
                return getdata
            }
            getdata = try! decoder.decode([rate].self, from: data)
        }
        else{
            Message = getresult.ResponseMessage
        }
        return getdata
    }

    
    
    //
    
    public func getbuyervehicle(bname: String)->[getbuyerRresponse]
    {
        
        var buyerR: [getbuyerRresponse] = []
        
        let result = apiwrapper.getMethodCall(controllerName: "user", actionName: "getbuyervehicle?bname=\(bname)")
        
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData
                else{
                    Message = result.ResponseMessage
                    return buyerR
                    
                    
            }
            
            buyerR = try! decoder.decode([getbuyerRresponse].self, from: data)
            
        }
        else
        {
            
            Message  = result.ResponseMessage
            
        }
        return buyerR
        
    }
    
    
    
    //too get seller vehicles
    
    public func getsellervehicle(sname: String)->[SellVehicleModel]
    {
        
        var buyerR: [SellVehicleModel] = []
        
        let result = apiwrapper.getMethodCall(controllerName: "user", actionName: "getsellervehicle?sname=\(sname)")
        
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData
                else{
                    Message = result.ResponseMessage
                    return buyerR
                    
                    
            }
            
            buyerR = try! decoder.decode([SellVehicleModel].self, from: data)
            
        }
        else
        {
            
            Message  = result.ResponseMessage
            
        }
        return buyerR
        
    }
    
    
    
    //restrict buyer to make multiple offer
    public func restrictbuyer (vno:String,bname:String) ->[BuyerModel]
    {
        var bresstrict = [BuyerModel]()
        let res = apiwrapper.getMethodCall(controllerName: "user", actionName: "restrictbuyer?vno=\(vno)&bname=\(bname)")
        
        if res.ResponseCode == 200
        {
            guard let data = res.ResponseData
                else{
                    Message = res.ResponseMessage
                    return bresstrict
                    
                    
            }
            
            bresstrict = try! decoder.decode([BuyerModel].self, from: data)
            
        }
        else
        {
            
            Message  = res.ResponseMessage
            
        }
        return bresstrict
    }
    
    
    
    
    
    
    //edit user profile
    
    public func editprofile(udata:UserModelForEdit)->Bool
    {
        let dataA = try! encoder.encode(udata)
        let resultA = apiwrapper.postMethodCall(controllerName: "user", actionName: "editprofile", httpBody: dataA)
        
        if resultA.ResponseCode == 200
        {
            return true
        }
        else{
            Message = resultA.ResponseMessage
            return false
        }
    }
    
    
    
    
    //task
    
    
    
    
    
    
    
    
    
    
    
    public func insertReg(rdata:RegModel)->Bool
    {
        let data=try! encoder.encode(rdata)
        
        let result = apiwrapper.postMethodCall(controllerName: "user", actionName: "insertReg", httpBody: data)
        
        if result.ResponseCode==200{
            
            return true
        }
        else{
            Message=result.ResponseMessage
            return false
        }
        
        
    }
    
    
    
    
    
    
   //insertRef refer insertion
    
    
    public func insertRef(rdata:RefModel)->Bool
    {
        let data=try! encoder.encode(rdata)
        
        let result = apiwrapper.postMethodCall(controllerName: "user", actionName: "insertRef", httpBody: data)
        
        if result.ResponseCode==200{
            
            return true
        }
        else{
            Message=result.ResponseMessage
            return false
        }
        
        
    }
    
    
    //RestrictAgentRef
    public func RestrictAgentRef (aname:String,bname:String,vno:String) ->[RefModel]
    {
        var bresstrict = [RefModel]()
        let res = apiwrapper.getMethodCall(controllerName: "user", actionName: "RestrictAgentRef?aname=\(aname)&bname=\(bname)&vno=\(vno)")
        
        if res.ResponseCode == 200
        {
            guard let data = res.ResponseData
                else{
                    Message = res.ResponseMessage
                    return bresstrict
                    
                    
            }
            
            bresstrict = try! decoder.decode([RefModel].self, from: data)
            
        }
        else
        {
            
            Message  = res.ResponseMessage
            
        }
        return bresstrict
    }
    
    //
    
    
    
    
    
    
    
    
    
    //get registered buyer
    
    public func getRegBuy(aname:String) ->[GetRegBuy]
    {
        var bresstrict = [GetRegBuy]()
        let res = apiwrapper.getMethodCall(controllerName: "user", actionName: "getRegBuy?aname=\(aname)")
        
        if res.ResponseCode == 200
        {
            guard let data = res.ResponseData
                else{
                    Message = res.ResponseMessage
                    return bresstrict
                    
                    
            }
            
            bresstrict = try! decoder.decode([GetRegBuy].self, from: data)
            
        }
        else
        {
            
            Message  = res.ResponseMessage
            
        }
        return bresstrict
    }
    
    //restrict buyer registration
    
    public func restrictReg(bname:String,aname:String) ->[Resreg]
    {
        var getres = [Resreg]()
        let res9 = apiwrapper.getMethodCall(controllerName: "user", actionName: "restrictReg?bname=\(bname)&aname=\(aname)")
        
        if res9.ResponseCode == 200
        {
            guard let data = res9.ResponseData
                else{
                    Message = res9.ResponseMessage
                    return getres
                    
                    
            }
            
            getres = try! decoder.decode([Resreg].self, from: data)
            
        }
        else
        {
            
            Message  = res9.ResponseMessage
            
        }
        return getres

    }

    
    
    //
    
    public func getRefVeh(bname: String)->[RefVehModel]
    {
        
        var seller: [RefVehModel] = []
        
        let result = apiwrapper.getMethodCall(controllerName: "user", actionName: "getRefVeh?bname=\(bname)")
        
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData
                else{
                    Message = result.ResponseMessage
                    return seller
                    
                    
            }
            
            seller = try! decoder.decode([RefVehModel].self, from: data)
            
        }
        else
        {
            
            Message  = result.ResponseMessage
            
        }
        return seller
        
    }
    //
    
    
    
    
    
    
    
    
}




