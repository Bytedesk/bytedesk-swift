//
//  SwiftUIView.swift
//  
//
//  Created by 宁金鹏 on 2023/8/17.
//

import SwiftUI

public struct KFChatView: View {
    
    public init() {
        
    }
    
    public var body: some View {
        VStack {
            Text("Hello, Bytedesk!")
            Image("avatar_user", bundle: .module)
//                .resizable()
                .frame(width: 50)
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        KFChatView()
    }
}
