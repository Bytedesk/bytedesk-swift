//
//  ContentView.swift
//  BytedeskDemo
//
//  Created by 宁金鹏 on 2023/8/18.
//

import SwiftUI

struct ApiView: View {
    @State private var title = "萝卜丝智能客服";
    private var apiArray = [
        "联系客服",
        "自定义用户信息",
        "在线状态",
        "意见反馈",
        "帮助中心",
        "网页会话",
        "切换用户",
    ]

    var body: some View {
        NavigationStack {
            List {
                Section("客服接口") {
                    ForEach(Array(apiArray.enumerated()), id: \.offset) { index, api in
                        NavigationLink("\(index + 1). \(api)") {
                            if (index == 0) {
                                ChatView() // "联系客服"
                            } else if (index == 1) {
                                UserinfoView() // "自定义用户信息"
                            } else if (index == 2) {
                                StatusView() // "在线状态"
                            } else if (index == 3) {
                                FeedbackView() // 意见反馈
                            } else if (index == 4) {
                                SupportView() // 帮助中心
                            } else if (index == 5) {
                                H5View() // 网页会话
                            } else {
                                SwitchView() // 切换用户
                            }
                        }
                    }
                }
                
                Section("技术支持") {
                    Text("官网: kefux.com, QQ-3群: 825257535")
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ApiView()
    }
}
