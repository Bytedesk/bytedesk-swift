//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2023/8/19.
//

import UIKit

// Swift 中的类如果要供Objective-C 调用，必须也继承自NSObject
public class BDUIApis: NSObject {
    
    static public func pushWorkGroupChat(navController: UINavigationController, wid: String, title: String) {
        let chatVC = BDChatKFViewController()
        chatVC.initWithWorkGroupWid(wid: wid, title, true)
        navController.pushViewController(chatVC, animated: true)
    }
    
    static public func pushWorkGroupChat(navController: UINavigationController, wid: String, title: String, custom: [String: Any]) {
        let chatVC = BDChatKFViewController()
        chatVC.initWithWorkGroupWid(wid: wid, title, true, custom: custom)
        navController.pushViewController(chatVC, animated: true)
    }
    
    static public func presentWorkGroupChat(navController: UINavigationController, wid: String, title: String) {
        let chatVC = BDChatKFViewController()
        chatVC.initWithWorkGroupWid(wid: wid, title, false)
        let chatNavigationController = UINavigationController.init(rootViewController: chatVC)
        navController.present(chatNavigationController, animated: true)
    }
    
    static public func presentWorkGroupChat(navController: UINavigationController, wid: String, title: String, custom: [String: Any]) {
        let chatVC = BDChatKFViewController()
        chatVC.initWithWorkGroupWid(wid: wid, title, false, custom: custom)
        let chatNavigationController = UINavigationController.init(rootViewController: chatVC)
        navController.present(chatNavigationController, animated: true)
    }
    
    static public func pushAppointChat(navController: UINavigationController, uid: String, title: String) {
        let chatVC = BDChatKFViewController()
        chatVC.initWithAgentUid(uid: uid, title, true)
        navController.pushViewController(chatVC, animated: true)
    }
    
    static public func pushAppointChat(navController: UINavigationController, uid: String, title: String, custom: [String: Any]) {
        let chatVC = BDChatKFViewController()
        chatVC.initWithAgentUid(uid: uid, title, true, custom: custom)
        navController.pushViewController(chatVC, animated: true)
    }
    
    static public func presentAppointChat(navController: UINavigationController, uid: String, title: String) {
        let chatVC = BDChatKFViewController()
        chatVC.initWithAgentUid(uid: uid, title, false)
        let chatNavigationController = UINavigationController.init(rootViewController: chatVC)
        navController.present(chatNavigationController, animated: true)
    }
    
    static public func presentAppointChat(navController: UINavigationController, uid: String, title: String, custom: [String: Any]) {
        let chatVC = BDChatKFViewController()
        chatVC.initWithAgentUid(uid: uid, title, false, custom: custom)
        let chatNavigationController = UINavigationController.init(rootViewController: chatVC)
        navController.present(chatNavigationController, animated: true)
    }
    
    // MARK:
    
    static func showTip(with viewController: UIViewController, message: String) {
        let alertController = UIAlertController(title: nil, message: "", preferredStyle: .alert)
        if let firstSubview = alertController.view.subviews.first,
            let alertContentView = firstSubview.subviews.first {
            for subSubView in alertContentView.subviews {
                subSubView.backgroundColor = UIColor(red: 141/255.0, green: 0/255.0, blue: 254/255.0, alpha: 1.0)
            }
        }
        let attributedString = NSMutableAttributedString(string: message)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], range: NSRange(location: 0, length: attributedString.length))
        alertController.setValue(attributedString, forKey: "attributedTitle")
        viewController.present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }

    static func showError(with viewController: UIViewController, message: String) {
        let alertController = UIAlertController(title: nil, message: "", preferredStyle: .alert)
        if let firstSubview = alertController.view.subviews.first,
            let alertContentView = firstSubview.subviews.first {
            for subSubView in alertContentView.subviews {
                subSubView.backgroundColor = UIColor(red: 141/255.0, green: 0/255.0, blue: 254/255.0, alpha: 1.0)
            }
        }
        let attributedString = NSMutableAttributedString(string: message)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], range: NSRange(location: 0, length: attributedString.length))
        alertController.setValue(attributedString, forKey: "attributedTitle")
        viewController.present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }
    
}
