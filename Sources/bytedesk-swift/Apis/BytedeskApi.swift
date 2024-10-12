//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2024/10/11.
//
import Foundation

// A Swift class that is intended to be used by Objective-C code must also inherit from NSObject.
public class BytedeskApis: NSObject {
    
    public static func initUser(orgUid: String) {
        initUserWithCallback(orgUid: orgUid) { userResult in
            debugPrint("initUser success")
        } onFailure: { error in
            debugPrint("initUser failed \(error)")
        }
    }
    
    public static func initUserWithCallback(orgUid: String, onSuccess:@escaping ((_ userResult: BDUserResult)->()), onFailure:@escaping ((_ error: String)->())) {
        BytedeskHttpApis.sharedInstance().initUser(orgUid: orgUid) { userResult in
            onSuccess(userResult)
        } failure: { error in
            onFailure(error)
        }
    }
    
    public static func requestThread(type: String, sid: String, forceAgent: Bool, onSuccess:@escaping ((_ threadResult: BDThreadResult)->()), onFailure:@escaping ((_ error: String)->())) {
        
        BytedeskHttpApis.sharedInstance().requestThread(type: type, sid: sid, forceAgent: forceAgent) { threadResult in
            onSuccess(threadResult)
        } failure: { error in
            onFailure(error)
        }
    }
    
    
    
    public static func sendRestMessage(json: String, onSuccess:@escaping ((_ messageResult: BDMessageSendResult)->()), onFailure:@escaping ((_ error: String)->())) {
        
        BytedeskHttpApis.sharedInstance().sendRestMessage(json: json) { messageResult in
            onSuccess(messageResult)
        } failure: { error in
            onFailure(error)
        }
    }
    
    
}
