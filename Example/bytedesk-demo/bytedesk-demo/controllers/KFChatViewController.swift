//
//  KFChatViewController.swift
//  bytedesk-demo
//
//  Created by 宁金鹏 on 2023/9/5.
//
import UIKit
import bytedesk_swift

class KFChatViewController: UITableViewController {
    
    let kefuApiArray = [
        "工作组会话Push:",
        "工作组会话Present:",
        //
        "指定坐席Push:",
        "指定坐席Present:",
    ];
    // 机器人测试组
//    let kRobotWorkGroupWid = "201809061716221"
    // 获取技能组uid，登录后台->客服->渠道->ios
    // http://www.weiyuai.cn/admin/cs/channel
    // 默认设置工作组wid
    let kDefaultWorkGroupUid = "df_wg_uid"
    // 获取指定客服uid，登录后台->客服->渠道->ios
    // http://www.weiyuai.cn/admin/cs/channel
    // 指定坐席uid
    let kDefaultAgentUid = "df_ag_uid"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "联系客服";
        //
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if (section == 0) {
//            return "默认机器人"
//        } else 
        if (section == 0) {
            return "工作组会话"
        } else if (section == 1) {
            return "指定坐席会话"
        }
//        else if (section == 3){
//            return "电商客服"
//        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if (section == 0) {
            return "后台设置默认机器人";
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (section == 1) {
//            return 3
//        }
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//        if (indexPath.section == 0) {
//            cell.textLabel?.text = kefuApiArray[indexPath.row]
//            cell.detailTextLabel?.text = kRobotWorkGroupWid
//        } else 
        if (indexPath.section == 0) {
//            cell.textLabel?.text = kefuApiArray[indexPath.row + 2]
            cell.textLabel?.text = kefuApiArray[indexPath.row]
            if (indexPath.row == 0) {
                //
            } else {
                cell.detailTextLabel?.text = kDefaultWorkGroupUid
            }
        } else if (indexPath.section == 1) {
//            cell.textLabel?.text = kefuApiArray[indexPath.row + 5]
            cell.textLabel?.text = kefuApiArray[indexPath.row + 2]
            cell.detailTextLabel?.text = kDefaultAgentUid
        }
//        else if (indexPath.section == 3) {
//            cell.textLabel?.text = kefuApiArray[indexPath.row + 7]
//            cell.detailTextLabel?.text = kDefaultAgentUid
//        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("didselect", indexPath.row)
//        var title = self.kefuApiArray[indexPath.row]
        
//        if (indexPath.section == 0) {
//            if (indexPath.row == 0) {
//                BDUIApis.pushWorkGroupChat(navController: self.navigationController!, wid: kRobotWorkGroupWid, title: "技能组push")
//            } else {
//                BDUIApis.presentWorkGroupChat(navController: self.navigationController!, wid: kRobotWorkGroupWid, title: "技能组present")
//            }
//        } else 
        if (indexPath.section == 0) {
//            if (indexPath.row == 0) {
//                //
//            } else 
            if (indexPath.row == 0) {
                BDUIApis.pushWorkGroupChat(navController: self.navigationController!, uid: kDefaultWorkGroupUid)
            } else {
                BDUIApis.presentWorkGroupChat(navController: self.navigationController!, uid: kDefaultWorkGroupUid)
            }
        } else if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                BDUIApis.pushAppointChat(navController: self.navigationController!, uid: kDefaultAgentUid)
            } else {
                BDUIApis.presentAppointChat(navController: self.navigationController!, uid: kDefaultAgentUid)
            }
        }
//        else if (indexPath.section == 3) {
//            if (indexPath.row == 0) {
//                let dict: [String: Any] = [
//                    "type": "commodity",
//                    "title": "商品标题",
//                    "content": "商品详情",
//                    "price": "¥9.99",
//                    "url": "https://item.m.jd.com/product/12172344.html",
//                    "imageUrl": "https://www.kefux.com/assets/img/qrcode/luobosi_mp.png",
//                    "id": "123",
//                    "categoryCode": "345"
//                ]
//                BDUIApis.pushWorkGroupChat(navController: self.navigationController!, wid: kDefaultWorkGroupWid, title: "技能组push", custom: dict)
//            } else {
//                let dict: [String: Any] = [
//                    "type": "commodity",
//                    "title": "商品标题",
//                    "content": "商品详情",
//                    "price": "¥9.99",
//                    "url": "https://item.m.jd.com/product/12172344.html",
//                    "imageUrl": "https://www.kefux.com/assets/img/qrcode/luobosi_mp.png",
//                    "id": "123",
//                    "categoryCode": "345"
//                ]
//                BDUIApis.presentWorkGroupChat(navController: self.navigationController!, wid: kDefaultWorkGroupWid, title: "技能组present", custom: dict)
//            }
//        }
        
    }
    
}
