//
//  ViewController.swift
//  demo_kefu_uikit
//
//  Created by 宁金鹏 on 2023/9/2.
//

import UIKit
import SafariServices

//
class KFApiTableViewController: UITableViewController {
    
    let kefuApiArray = [
        "联系客服",
        "用户信息",
        "在线状态",
//        "意见反馈",
//        "帮助中心",
        "网页会话",
//        "切换用户",
//        "监听截图"
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "萝卜丝客服SwiftUIKitDemo";
        //
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "客服接口"
        }
        return "技术支持"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return kefuApiArray.count;
        }
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 使用此方法  必须注册可重用cell 在ios6.0推出的 替代以下三行代码  //在storyboard 添加 Cell identity
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if (indexPath.section == 0) {
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            cell.textLabel?.text = kefuApiArray[indexPath.row];
        } else {
            cell.textLabel?.text = "官网: kefux.com, QQ-3群: 825257535";
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.section == 1) {
            return
        }
        //
        var viewController = UITableViewController()
        if (indexPath.row == 0) {
            // 联系客服
            viewController = KFChatViewController()
        } else if (indexPath.row == 1) {
            // 用户信息
            viewController = KFUserinfoViewController()
        } else if (indexPath.row == 2) {
            // 在线状态
            viewController = KFStatusViewController()
        } else {
            // 网页形式接入
            // 注意: 登录后台->客服->技能组/账号->获取代码 获取相应URL
            let url = "https://chat.kefux.com/chat/h5/index.html?sub=vip&uid=201808221551193&wid=201807171659201&type=workGroup&aid=&ph=ph"
            if let url = URL(string: url) {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
            return
        }
//        else if (indexPath.row == 3) {
//            // TODO: 意见反馈
//            self.showToast(message: "TODO: 意见反馈", font: .systemFont(ofSize: 12.0))
//            return
//        } else if (indexPath.row == 4) {
//            // TODO: 帮助中心
////            viewController = KFSupportViewController()
//            self.showToast(message: "TODO: 帮助中心", font: .systemFont(ofSize: 12.0))
//            return
//        } else if (indexPath.row == 5) {
//            // TODO: 网页会话
//            self.showToast(message: "TODO: 网页会话", font: .systemFont(ofSize: 12.0))
//            return
//        } else if (indexPath.row == 6) {
//            // 切换用户
//            viewController = KFSwitchViewController()
//        } else if (indexPath.row == 7) {
//            // TODO: 监听截图
//            self.showToast(message: "TODO: 监听截图", font: .systemFont(ofSize: 12.0))
//            return
//        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}


extension UIViewController {

    func showToast(message : String, font: UIFont) {
        let toastMessage = message
        let alertController = UIAlertController(title: nil, message: toastMessage, preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        // 设置定时器，1 秒后自动消失
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }
    
}
