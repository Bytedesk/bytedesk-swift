//
//  KFSwitchViewController.swift
//  demo_kefu_uikit
//
//  Created by 宁金鹏 on 2023/9/5.
//
import UIKit

class KFSwitchViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "切换用户"
        //
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // Mark: Table
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "切换用户需要先退出之前的登录用户"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        if (indexPath.row == 0) {
            cell.textLabel?.text = "用户信息"
        } else if (indexPath.row == 1) {
            cell.textLabel?.text = "用户1男"
        } else if (indexPath.row == 2) {
            cell.textLabel?.text = "用户2女"
        } else if (indexPath.row == 3) {
            cell.textLabel?.text = "退出登录"
        }
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didselect", indexPath.row)
    }
    
}
