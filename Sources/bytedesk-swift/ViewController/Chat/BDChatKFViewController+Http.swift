//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2023/9/7.
//

import UIKit

extension BDChatKFViewController {
    
    
    /// 请求会话
    func requestThread() {
         debugPrint("chatkf: \(#function), type: \(mSid) \(mType)")
        
        BytedeskApis.requestThread(type: self.mType, sid: self.mSid, forceAgent: self.mForceAgent) { threadResult in
            debugPrint("threadResult \(String(describing: threadResult.data?.uid))")
            self.dealWithRequestThreadResult(threadResult)
        } onFailure: { error in
            debugPrint("threadResult failed: \(error)")
        }
        
//        if (self.mThreadType == BD_THREAD_TYPE_APPOINTED) {
//            
//            BDCoreApis.requestThreadAgent(agentUid: self.mUUid) { threadResult in
//                self.dealWithRequestThreadResult(threadResult)
//            } onFailure: { error in
//                BDToast.show(message: error)
//            }
//
//        } else {
//            
//            BDCoreApis.requestThreadWorkgroup(workgroupWid: self.mUUid) { threadResult in
//                self.dealWithRequestThreadResult(threadResult)
//            } onFailure: { error in
//                BDToast.show(message: error)
//            }
//        }
    }
    
    /// 强制转人工
    func requestAgent() {
        // debugPrint("\(#function)")
        
        BDCoreApis.requestAgent(workgroupWid: self.mSid) { threadResult in
            self.dealWithRequestThreadResult(threadResult)
        } onFailure: { error in
            BDToast.show(message: error)
        }
    }
    
    func dealWithRequestThreadResult(_ threadResult: BDThreadResult) {
         debugPrint("chatkf: \(#function), threadResult: \(threadResult)")
        //
        let messageModel = threadResult.data
        BDCoreApis.insertMessage(messageModel!)
        //
        mThreadModel = threadResult.data?.thread
//        mThreadUid = mThreadModel?.uid
//        let appointed = mThreadModel?.appointed
//        if (appointed!) {
//            self.navigationItem.title = mThreadModel?.agent?.nickname
//        } else {
//            self.navigationItem.title = mThreadModel?.workGroup?.nickname
//        }
        let statusCode = threadResult.code
        if (statusCode == 200) {
            // 创建新会话 / 继续进行中会话
            
//            if (self.mWithCustomDict) {
//                let customJson = BDUtils.dictToJson(self.mCustomDict!)
//                self.sendCommodityMessage(customJson)
//            }
            
            BytedeskStompApi.sharedInstance().subscribe(topic: mThreadModel!.topic!)
            
        } else {
            // 请求会话失败
        }
        // TODO: 此方法简单粗暴，待改进，直接插入显示就好
        self.reloadTableData(false)
    }
    
    func sendRobotMessage(_ content: String?) {
        // debugPrint("\(#function)")
    }
    
    func queryRobotAnswer(_ qid: String?) {
        // debugPrint("\(#function)")
        
    }
    
    func rateRobotAnswer(_ aid: String?, mid: String?, rate: Bool?) {
        
    }
    
}
