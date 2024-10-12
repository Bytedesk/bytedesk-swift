//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2023/8/21.
//

import Foundation
import UIKit

//
public class BDMessageModel: Codable, Identifiable, ObservableObject {
    // ...
    init() {
        thread = BDThreadModel()
        user = BDUserModel()
    }
    // ...
    var uid: String? = ""
    var type: String? = ""
    var content: String? = ""
    var status: String? = ""
    var client: String? = ""
    var extra: String? = ""
    var createdAt: String? = ""
//    var threadTopic: String? = ""
//
    var thread: BDThreadModel?
    var user: BDUserModel?
    //
    var currentUid: String? = ""
    var contentAttr: NSAttributedString?
    
    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case uid
        case content
        case type
        case createdAt
        case status
        case client
        case thread
        case user
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(uid, forKey: .uid)
        try container.encode(content, forKey: .content)
        try container.encode(type, forKey: .type)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(status, forKey: .status)
        try container.encode(client, forKey: .client)
        try container.encode(thread, forKey: .thread)
        try container.encode(user, forKey: .user)
    }
    
    // ...
    func isNotification() -> Bool {
        if type == BytedeskConstants.MESSAGE_TYPE_SYSTEM
            || type == BytedeskConstants.MESSAGE_TYPE_CONTINUE {
            return false
        }
        return false
    }
    // ...
    func isSend() -> Bool {
        return user?.uid == BDSettings.getUid()
    }
    //
    func createdAtSize() -> CGSize {
        return createdAt!.boundingRect(with: CGSize(width: 200, height: CGFloat.greatestFiniteMagnitude),
                              options: [.usesLineFragmentOrigin],
                              attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11.0)],
                              context: nil).size
    }
    //
    func contentSize() -> CGSize {
        return content!.boundingRect(with: CGSize(width: 200, height: CGFloat.greatestFiniteMagnitude),
                              options: [.usesLineFragmentOrigin],
                              attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)],
                              context: nil).size
//        var height = size.height
////        if (height < 30) {
////            height = 30
////        }
//        var width = size.width
////        if (width < 30) {
////            width = 30
////        }
//        return CGSize(width: height, height: width)
    }
    //
    func contentViewInsets() -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 13, bottom: 13, right: 10)
    }
    //
    func contentAttrSize() -> CGSize {
        let BDScreen = UIScreen.main.bounds.size
        //
        let textView = UITextView(frame: .zero)
        textView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = false
        textView.attributedText = contentAttr
        
        let width = Int(BDScreen.width) * 3 / 5
        textView.frame = CGRect(x: 0, y: 0, width: width, height: INTPTR_MAX)
        textView.sizeToFit()
        
        if textView.frame.size.height < 40 {
            var frame = textView.frame
            frame.size.height = 40
            textView.frame = frame
        }
        return textView.frame.size
    }
    
    
    

}

