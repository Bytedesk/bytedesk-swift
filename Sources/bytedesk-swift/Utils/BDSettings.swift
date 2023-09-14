//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2023/8/21.
//

import Foundation

// 存储本地设置信息 及 部分用户信息
let BD_USERNAME                 = "bd_username"
let BD_UID                      = "bd_uid"
let BD_NICKNAME                 = "bd_nickname"
let BD_REALNAME                 = "bd_realname"
let BD_PASSWORD                 = "bd_password"
let BD_AVATAR                   = "bd_avatar"
let BD_ROLE                     = "bd_role"
let BD_APPKEY                   = "bd_appkey"
let BD_SUBDOMAIN                = "bd_subdomain"
let BD_DESCRIPTION              = "bd_description"
let BD_VALIDATE_UNTIL_DATE      = "bd_validate_until_date"
let BD_ACCEPTSTATUS             = "bd_acceptstatus"
let BD_AUTOREPLYCONTENT         = "bd_autoreplycontent"
let BD_WELCOMETIP               = "bd_welcometip"
let BD_STATUS                   = "bd_status"
let BD_CURRENT_TID              = "bd_current_tid"
let BD_DEVICE_TOKEN             = "bd_device_token"
let BD_CLIENT_UUID              = "bd_client_uuid"

let BD_IS_ALREADY_LOGIN         = "bd_is_already_login"

let BD_PASSPORT_ACCESS_TOKEN    = "bd_access_token"
let BD_PASSPORT_EXPIRES_IN      = "bd_expires_in"
let BD_PASSPORT_REFRESH_TOKEN   = "bd_refresh_token"
let BD_PASSPORT_TOKEN_TYPE      = "bd_token_type"

public class BDSettings: NSObject {
    
    /// get
    static func isAlreadyLogin() -> Bool? {
        let accessToken = UserDefaults.standard.string(forKey: BD_PASSPORT_ACCESS_TOKEN);
        return accessToken != nil && !accessToken!.isEmpty
    }
    
    static func getClient() -> String? {
        return CLIENT_SWIFT
    }

    static func getSubdomain() -> String? {
        return UserDefaults.standard.string(forKey: BD_SUBDOMAIN) ?? ""
    }
    
    static func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: BD_PASSPORT_ACCESS_TOKEN) ?? ""
    }
    
    static func getUid() -> String? {
        return UserDefaults.standard.string(forKey: BD_UID) ?? ""
    }
    
    static func getUsername() -> String? {
        return UserDefaults.standard.string(forKey: BD_USERNAME) ?? "";
    }
    
    static func getNickname() -> String? {
        return UserDefaults.standard.string(forKey: BD_NICKNAME) ?? "";
    }
    
    static func getAvatar() -> String? {
        return UserDefaults.standard.string(forKey: BD_AVATAR) ?? "";
    }
    
    /// set
    static func setSubDomain(subDomain: String?) {
        UserDefaults.standard.set(subDomain, forKey: BD_SUBDOMAIN)
    }
    
    static func setAccessToken(accessToken: String?) {
//        // debugPrint("setAccessToken: \(accessToken!)")
        UserDefaults.standard.set(accessToken!, forKey: BD_PASSPORT_ACCESS_TOKEN)
    }
    
    static func setUid(uid: String?) {
//        // debugPrint("setUid: \(uid!)")
        UserDefaults.standard.set(uid!, forKey: BD_UID)
    }
    
    static func setUsername(username: String?) {
//        // debugPrint("setUsername: \(username!)")
        UserDefaults.standard.set(username!, forKey: BD_USERNAME)
    }
    
    static func setNickname(nickname: String?) {
        UserDefaults.standard.set(nickname, forKey: BD_NICKNAME)
    }
    
    static func setAvatar(avatar: String?) {
        UserDefaults.standard.set(avatar, forKey: BD_AVATAR)
    }
    
    static func setUserInfo(user: BDUserModel?) {
        setUid(uid: user?.uid)
        setUsername(username: user?.username)
        setNickname(nickname: user?.nickname)
        setAvatar(avatar: user?.avatar)
    }
    
    /// clear
    static func clearUid() {
        UserDefaults.standard.set("", forKey: BD_UID)
    }
    
    static func clearUsername() {
        UserDefaults.standard.set("", forKey: BD_USERNAME)
    }
    
    static func clearNickname() {
        UserDefaults.standard.set("", forKey: BD_NICKNAME)
    }
    
    static func clearAvatar() {
        UserDefaults.standard.set("", forKey: BD_AVATAR)
    }
    
    static func clearUserInfo() {
        clearUid()
        clearUsername()
        clearNickname()
        clearAvatar()
    }
    

}
