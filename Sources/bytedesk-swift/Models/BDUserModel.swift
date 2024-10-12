//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2023/8/21.
//

import Foundation

public class BDUserModel: Codable, Identifiable, ObservableObject {
    //
    public var uid: String?
    public var username: String?
    public var nickname: String?
    public var avatar: String?
    
    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case uid
        case nickname
        case avatar
    }
}
