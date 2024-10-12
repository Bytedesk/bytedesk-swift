//
//  AppDelegate.swift
//  bytedesk-demo
//
//  Created by 宁金鹏 on 2023/9/2.
//

import UIKit
import bytedesk_swift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 初始化微语智能客服
        initBytedesk()
        
        return true
    }
    
    func initBytedesk() {
        // 初始化
        // 初始化微语sdk
        // 获取企业uid，登录后台->客服->渠道->ios
		// http://www.weiyuai.cn/admin/cs/channel
        BytedeskApis.initUser(orgUid: "df_org_uid")
        //
//        BDCoreApis.initBytedesk(appkey: "a3f79509-5cb6-4185-8df9-b1ce13d3c655", subDomain: "vip") { loginResult in
//            print("微语：初始化成功")
//        } onFailure: { error in
//            print("微语：初始化失败: \(error)")
//        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

