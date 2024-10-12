//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2023/8/21.
//

import Foundation

public class BDThreadModel: Codable, Identifiable, ObservableObject {
    //
    init() {
        user = BDUserModel()
    }
    //
    public var uid: String?
    public var topic: String? = ""
    public var type: String?
    public var status: String?
    public var extra: String?
    //
    public var user: BDUserModel?
    
    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case uid
        case topic
        case type
        case status
        case extra
        case user
    }
}
