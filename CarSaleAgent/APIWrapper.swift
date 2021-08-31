//
//  APIWrapper.swift
//
//  Created by BIIT 
//  Copyright  2020 BIIT. All rights reserved.
//

import Foundation
import AVKit

////////////////////////
/// This is the Response Returned by Web API Action (i.e. Function)
class APIMessage{
    var ResponseCode : Int = 404// Not-Ok
    var ResponseData : Data?
    var ResponseMessage : String = "OK"
}


//////////////////////
/// This class Is a wrapper whichs will handle Web API get and post method calls.
class APIWrapper{
   // private let baseURLString = "http://10.211.55.3/Demo/api/"
        private let baseURLString = "http://10.211.55.6/carsale/api/"
    
    
    ///////////////////////////
    //// This is for HTTPGet methods
    ////////////////////////////
    func getMethodCall(controllerName:String,actionName:String)->APIMessage {
        let apiMessage = APIMessage()
        
        let completePath: String =  "\(baseURLString)\(controllerName)/\(actionName)"
        guard let url = URL(string: completePath) else{
            apiMessage.ResponseCode = 209//error
            apiMessage.ResponseMessage = "Error : cannot create URL"
            return apiMessage
        }
        let group = DispatchGroup()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        group.enter()
        let task = session.dataTask(with: urlRequest){
            
            (data, response, error) in
            
            guard error == nil else {
                apiMessage.ResponseMessage = error.debugDescription
                print("error calling \(controllerName)\(actionName)")
                group.leave()
                print(error!)
                return
                
            }
            
            let rurl = (response as! HTTPURLResponse)
            apiMessage.ResponseCode = rurl.statusCode
            
            guard let responseData = data  else{
                apiMessage.ResponseMessage = "error: did not recive data"
                group.leave()
                return
            }
            
            apiMessage.ResponseData = responseData
            apiMessage.ResponseMessage = String(data: data!, encoding: .utf8) ?? rurl.description
            
            group.leave()
        }
        task.resume()
        group.wait()
        return apiMessage
    }
    
    /////////////////////////
    /// This is for HTTPPost methods
    ////////////////////////////
    func postMethodCall(controllerName:String,actionName:String,httpBody:Data)->APIMessage {
        let apiMessage = APIMessage()
        
        let completePath: String =  "\(baseURLString)\(controllerName)/\(actionName)"
        guard let url = URL(string: completePath) else{
            apiMessage.ResponseCode = 209//error
            apiMessage.ResponseMessage = "Error : cannot create URL"
            return apiMessage
        }
        let group = DispatchGroup()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = httpBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let session = URLSession.shared
        group.enter()
        let task = session.dataTask(with: urlRequest){
            
            (data, response, error) in
            
            guard error == nil else {
                apiMessage.ResponseMessage = error.debugDescription
                print("error calling \(controllerName)\(actionName)")
                group.leave()
                print(error!)
                return
            }
            
            let rurl = (response as! HTTPURLResponse)
            apiMessage.ResponseCode = rurl.statusCode
            
            guard let responseData = data  else{
                apiMessage.ResponseMessage = "error: did not recive data"
                group.leave()
                return
                
            }
            apiMessage.ResponseData = responseData
            
            apiMessage.ResponseMessage = String(data: data!, encoding: .utf8) ?? rurl.description
            
            group.leave()
        }
        task.resume()
        group.wait()
        return apiMessage
    }
    
    ///////////////////////////////////
    /////// Below is the code for AnyFile Uploads
    ///////////////////////////////////
    func createBody(parameters:[String: String],
                    boundary: String,
                    data: Data,
                    mimeType: String,
                    filename: String) -> Data {
        let body = NSMutableData()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        
        for (key, value) in parameters {
            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }

        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(data)
        body.appendString("\r\n")
        body.appendString("--".appending(boundary.appending("--")))
        let content = body as Data
        print(content)
        return body as Data
    }

    func UploadImageMethodCall(cJson:Data,controllerName:String,actionName:String)->APIMessage {
        let apiMessage = APIMessage()
        
        let completePath: String =  "\(baseURLString)\(controllerName)/\(actionName)"
        guard let url = URL(string: completePath) else{
            apiMessage.ResponseCode = 209//error
            apiMessage.ResponseMessage = "Error : cannot create URL"
            return apiMessage
        }
        let group = DispatchGroup()
        
        let params = ["user" : "abc"]
        let boundary = "Boundary-\(UUID().uuidString)"
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = createBody(parameters: params,
                                         boundary: boundary,
                                         data: cJson,//UIImageJPEGRepresentation(chosenImage, 0.7)!,
            mimeType: "image/jpg",
            filename: "hello.jpg")
        
        urlRequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("multipart/form-data",forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        group.enter()
        let task = session.dataTask(with: urlRequest){
            
            (data, response, error) in
            
            guard error == nil else {
                apiMessage.ResponseMessage = error.debugDescription
                print("error calling \(controllerName)\(actionName)")
                group.leave()
                print(error!)
                return
            }
            
            let rurl = (response as! HTTPURLResponse)
            apiMessage.ResponseCode = rurl.statusCode
            
            guard let responseData = data  else{
                apiMessage.ResponseMessage = "error: did not recive data"
                group.leave()
                return
                
            }
            apiMessage.ResponseData = responseData
            
            apiMessage.ResponseMessage = String(data: data!, encoding: .utf8) ?? rurl.description
            
            group.leave()
        }
        task.resume()
        group.wait()
        return apiMessage
    }
    
    
}

/*
     func UploadImageMethodCall(cJson:Data, endPoint:String)->APIMessage {
     let apiMessage = APIMessage()
     
     let todoEndpoint: String =  "\(baseURLString)\(endPoint)"
     guard let url = URL(string: todoEndpoint) else{
     apiMessage.ResponseCode = 209//error
     print("Error : cannot create URL")
     return apiMessage
     }
     
     
     let group = DispatchGroup()
     
     let params = ["user" : "abc"]
     let boundary = "Boundary-\(UUID().uuidString)"
     
     var urlRequest = URLRequest(url: url)
     urlRequest.httpMethod = "POST"
     urlRequest.httpBody = createBody(parameters: params,
     boundary: boundary,
     data: cJson,//UIImageJPEGRepresentation(chosenImage, 0.7)!,
     mimeType: "image/jpg",
     filename: "hello.jpg")
     
     urlRequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
     urlRequest.addValue("multipart/form-data",forHTTPHeaderField: "Accept")
     
     
     let session = URLSession.shared
     group.enter()
     let task = session.dataTask(with: urlRequest){
     
     (data, response, error) in
     
     guard error == nil else {
     
     print("error calling \(endPoint)")
     group.leave()
     print(error!)
     return
     
     }
     
     guard let responseData = data  else{
     
     print("error: did not recive data")
     group.leave()
     return
     
     }
     
     let rurl = (response as! HTTPURLResponse)
     apiMessage.ResponseCode = rurl.statusCode
     apiMessage.ResponseData = responseData
     
     apiMessage.ResponseMessage = String(data: data!, encoding: .utf8) ?? rurl.description
     
     group.leave()
     }
     task.resume()
     group.wait()
     return apiMessage
     }
     }
 */


//    extension UIImage{
//        func resizeImage(newWidth: CGFloat) -> UIImage {
//            let scale = newWidth / self.size.width
//            let newHeight = self.size.height * scale
//            UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
//            self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
//            let newImage = UIGraphicsGetImageFromCurrentImageContext()
//            UIGraphicsEndImageContext()
//            return newImage!
//            
//        }
//    }
    

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}
