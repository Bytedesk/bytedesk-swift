//
//  ChatView.swift
//  demo_kefu_swift
//
//  Created by 宁金鹏 on 2023/8/18.
//

import SwiftUI
import bytedesk_swift

// "联系客服"
struct ChatView: View {
    //
    
    var body: some View {
        NavigationView {
            List {
                
                Section("工作组会话") {
                    //
                    NavigationLink {
                        KFChatView()
                    } label: {
                        Text("未读消息数")
                    }
                    //
                    NavigationLink {
                        
                    } label: {
                        Text("工作组会话Push")
                    }
                    //
                    NavigationLink {
                        
                    } label: {
                        Text("工作组会话Present")
                    }
                }
                
                Section("指定坐席会话") {
                    //
                    NavigationLink {
                        
                    } label: {
                        Text("指定坐席Push")
                    }
                    //
                    NavigationLink {
                        
                    } label: {
                        Text("指定坐席Present")
                    }
                }
                
                Section("电商客服") {
                    //
                    NavigationLink {
                        
                    } label: {
                        Text("电商客服Push")
                    }
                    //
                    NavigationLink {
                        
                    } label: {
                        Text("电商客服Present")
                    }
                }
                
                Section("默认机器人") {
                    //
                    NavigationLink {
                        
                    } label: {
                        Text("默认机器人Push")
                    }
                    //
                    NavigationLink {
                        
                    } label: {
                        Text("默认机器人Present")
                    }
                }
                
            }
            .navigationTitle("联系客服")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    VStack {
//                        Text("Title").font(.headline)
//                        Text("Subtitle").font(.subheadline)
//                    }
//                }
//            }
        
        }

    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
