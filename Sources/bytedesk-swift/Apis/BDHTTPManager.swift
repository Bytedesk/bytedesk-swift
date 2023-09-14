//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2023/8/19.
//

import Foundation
import Alamofire

public class BDHTTPManager: NSObject {
    //
    class func sharedInstance() -> BDHTTPManager {
        struct Static {
            static let instance = BDHTTPManager()
        }
        return Static.instance
    }
    //
    func registerAnonymous(appkey: String?, subDomain: String?, success:@escaping ((_ registerResult: BDUserResult)->()), failure:@escaping ((_ error: String)->()) ) {
        //
        let params: [String: Any] = [
            "appkey": appkey!,
            "subDomain": subDomain!,
            "client": BDSettings.getClient()!
        ]
        //
        AF.request(BDApiUrl.registerAnonymousURL, method: .get, parameters: params).responseDecodable(of: BDUserResult.self) { response in
            // debugPrint("Response: \(response)")
            switch response.result {
                case let .success(data):
                    // debugPrint("success \(data), status_code: \(data.status_code!), message: \(data.message!)")
                    if (data.status_code == 200) {
                        BDSettings.setUserInfo(user: data.data!)
                        success(data)
                    } else {
                        // debugPrint("failure status: \(data.status_code!)")
                        BDSettings.clearUserInfo()
                        failure(data.message!)
                    }
                    return
                case .failure(let error):
                    // debugPrint("failure \(error)")
                    failure(error.localizedDescription)
            }
           }
    }
    
    //
    func login(username: String?, password: String?, appkey: String?, subDomain: String?, success:@escaping ((_ loginResult: BDPassport)->()), failure:@escaping ((_ error: String)->())) {
        //
        let headers: HTTPHeaders = [
            "Authorization": "Basic Y2xpZW50OnNlY3JldA==",
        ]
        //
        let params: [String: Any] = [
            "username": username!,
            "password": password!,
            "grant_type": "password",
            "scope": "all"
        ]
        // debugPrint("params: \(params)")
        //
        AF.request(BDApiUrl.loginPasswordURL, method: .post, parameters: params, headers: headers).responseDecodable(of: BDPassport.self) { response in
            // debugPrint("Response: \(response)")
            switch response.result {
               case let .success(data):
                 // debugPrint("success \(data)")
                 BDSettings.setAccessToken(accessToken: data.access_token!)
                 success(data)
                 return
                case .failure(let error):
                // debugPrint("failure \(error)")
                failure(error.localizedDescription)
            }
           }
    }
    
    
    func getWorkGroupStatus(wid: String?, success:@escaping ((_ statusResult: BDStatusResult)->()), failure:@escaping ((_ error: String)->()) ) {
        //
        let params: [String: Any] = [
            "wid": wid!,
            "client": BDSettings.getClient()!
        ]
        // debugPrint("getWorkGroupStatus \(params)")
        AF.request(BDApiUrl.getWorkGroupStatus, method: .get, parameters: params).responseDecodable(of: BDStatusResult.self) { response in
            // debugPrint("Response: \(response)")
            switch response.result {
                case let .success(data):
                    // debugPrint("success \(data), status_code: \(data.status_code!), message: \(data.message!)")
                    success(data)
                    return
                case .failure(let error):
                    // debugPrint("failure \(error)")
                    failure(error.localizedDescription)
            }
           }
    }
    
    func getAgentStatus(uid: String?, success:@escaping ((_ statusResult: BDStatusResult)->()), failure:@escaping ((_ error: String)->()) ) {
        //
        let params: [String: Any] = [
            "uid": uid!,
            "client": BDSettings.getClient()!
        ]
        // debugPrint("getAgentStatus \(params)")
        AF.request(BDApiUrl.getAgentStatus, method: .get, parameters: params).responseDecodable(of: BDStatusResult.self) { response in
            // debugPrint("Response: \(response)")
            switch response.result {
                case let .success(data):
                    // debugPrint("success \(data), status_code: \(data.status_code!), message: \(data.message!)")
                    success(data)
                    return
                case .failure(let error):
                    // debugPrint("failure \(error)")
                    failure(error.localizedDescription)
            }
           }
    }


    func logout(success:@escaping ((_ registerResult: BDUserResult)->()), failure:@escaping ((_ error: String)->()) ) {
        
    }
    
    //
    func debugFun(_ url: String, method: HTTPMethod, params: Parameters?, headers: HTTPHeaders?) {
        AF.request(url, method: method, parameters: params, headers: headers).responseString { response in
            switch response.result {
            case .success(let stringValue):
                print("Raw Response: \(stringValue)")
                // 解析数据
                if let data = response.data {
                    do {
//                        let decoder = JSONDecoder()
//                        let parsedData = try decoder.decode(BDThreadResult.self, from: data)
//                        // 在此处使用解析后的数据
//                        print("Parsed Data: \(parsedData)")
                    } catch {
                        print("Error decoding data: \(error)")
                    }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    // 使用Alamofire发送网络请求并获取原始返回字符串数据
//        AF.request(API.requestThreadURL, method: .get, parameters: params, headers: headers).responseString { response in
//            switch response.result {
//            case .success(let stringValue):
//                print("Raw Response: \(stringValue)")
//                // 解析数据
//                if let data = response.data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let parsedData = try decoder.decode(BDThreadResult.self, from: data)
//                        // 在此处使用解析后的数据
//                        print("Parsed Data: \(parsedData)")
//                        success(parsedData)
//                    } catch {
//                        print("Error decoding data: \(error)")
//                        failure(error.localizedDescription)
//                    }
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//                failure(error.localizedDescription)
//            }
//        }
    
    //
    //MARK:数据请求方法
//    func afRequest(url:String, type:HTTPMethod, params:[String : AnyObject]?, success:@escaping ((_ json: JSON)->()), failure:@escaping ((_ json: String)->()) ){
////        let headers: HTTPHeaders = [
////            "Authorization": "Basic Y2xpZW50OnNlY3JldA==",
////            "Accept": "application/json"
////        ]
//        //
////        AF.request(url).responseDecodable(of: BDHttpResult.self) { response in
////            // debugPrint("Response: \(response)")
////            switch response.result {
////               case let .success(data):
////    //             success(data)
////               case let .failure(error):
////    //             failure(error)
////            }
////           }
//
////        AF.request(url, method: type, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
////            debugPrint(response)
////            // debugPrint("--------------------")
////
////            debugPrint(response.result)
////
////            switch response.result {
////                case .success(let value):
////                success(JSON(rawValue: value)!)
//////                    completion(try? SomeRequest(protobuf: value))
////                case .failure(let error):
////                    print(error)
//////                    failure(String(data: error, encoding: .utf8)!)
////            }
////        }
//
//    }

  
}
