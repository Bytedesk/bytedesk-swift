//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2024/10/11.
//

import Foundation
import Alamofire

//
public class BytedeskHttpApis: NSObject {

    class func sharedInstance() -> BytedeskHttpApis {
        struct Static {
            static let instance = BytedeskHttpApis()
        }
        return Static.instance
    }
    
    func initUser(orgUid: String, success:@escaping ((_ registerResult: BDUserResult)->()), failure:@escaping ((_ error: String)->())) {
        print("initUser \(orgUid)")
        //
        let params: [String: Any] = [
            "orgUid": orgUid,
            "uid": BDSettings.getUid()!,
            "nickname": BDSettings.getNickname()!,
            "avatar": BDSettings.getAvatar()!,
            "client": BytedeskConstants.HTTP_CLIENT
        ]
         debugPrint("initUser \(params)")
        AF.request(BDApiUrl.initUserURL, method: .get, parameters: params).responseDecodable(of: BDUserResult.self) { response in
            // debugPrint("Response: \(response)")
            switch response.result {
                case let .success(data):
                debugPrint("success \(String(describing: data.data?.uid)) \(String(describing: data.data?.nickname!)) \(String(describing: data.data?.avatar!)), code: \(data.code!), message: \(data.message!)")
                BDSettings.setOrgUid(orgUid);
                BDSettings.setUid(data.data?.uid)
                BDSettings.setNickname(data.data?.nickname)
                BDSettings.setAvatar(data.data?.avatar)
                // connect
                BytedeskStompApi.sharedInstance().connect()
                //
                success(data)
                return
                case .failure(let error):
                     debugPrint("failure \(error)")
                    failure(error.localizedDescription)
            }
           }
    }
    
    func requestThread(type: String, sid: String, forceAgent: Bool, success:@escaping ((_ registerResult: BDThreadResult)->()), failure:@escaping ((_ error: String)->()) ) {
        print("requestThread \(type) \(sid) \(forceAgent)")
        //
        let params: [String: Any] = [
            "type": type,
            "sid": sid,
            "forceAgent": forceAgent,
            "orgUid": BDSettings.getOrgUid()!,
            "uid": BDSettings.getUid()!,
            "nickname": BDSettings.getNickname()!,
            "avatar": BDSettings.getAvatar()!,
            "client": BytedeskConstants.HTTP_CLIENT
        ]
         debugPrint("requestThread params \(params)")
        AF.request(BDApiUrl.requestThreadURL, method: .get, parameters: params).responseDecodable(of: BDThreadResult.self) { response in
             debugPrint("requestThread Response: \(response)")
            switch response.result {
                case let .success(data):
                    debugPrint("success \(data), code: \(data.code!), message: \(data.message!)")
                    success(data)
                    return
                case .failure(let error):
                     debugPrint("failure \(error)")
                    failure(error.localizedDescription)
            }
           }
        
    }
    
    func sendRestMessage(json: String, success:@escaping ((_ messageResult: BDMessageSendResult)->()), failure:@escaping ((_ error: String)->()) ) {
        let params: [String: Any] = [
            "json": json,
        ]
        debugPrint("sendRestMessage: \(params)")
        AF.request(BDApiUrl.sendRestMessageURL, method: .post, parameters: params).responseDecodable(of: BDMessageSendResult.self) { response in
             debugPrint("Response: \(response)")
            switch response.result {
               case let .success(data):
                  debugPrint("success \(data)")
//                 success(data)
                 return
                case .failure(let error):
                 debugPrint("failure \(error)")
                failure(error.localizedDescription)
            }
           }
        
    }
    
}
