//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2024/10/11.
//

import Foundation
//import SwiftStomp

// https://github.com/Romixery/SwiftStomp
public class BytedeskStompApi: NSObject {
    
    class func sharedInstance() -> BytedeskStompApi {
        struct Static {
            static let instance = BytedeskStompApi()
        }
        return Static.instance
    }
    
    static let shared = BytedeskStompApi() // 使用单例模式
    private let stompClient: SwiftStomp
    private var subscribedTopics: [String] = []
    private var transformedTopic: String = ""
    
    // 假设我们有一些其他对象或方法来处理存储和偏好设置
    // private let bdRepository: BDRepository
    // private let preferenceManager: BDPreferenceManager
    
    private override init() {
        let url = URL(string: BytedeskConstants.STOMP_WS_URL)!
        stompClient = SwiftStomp(host: url)
        super.init()
        //
        stompClient.enableLogging = true
        stompClient.autoReconnect = true
        stompClient.delegate = self // 假设STOMPClient使用代理模式进行事件回调
        stompClient.enableAutoPing();
        // 初始化连接、心跳等其他设置...
    }
    
    private func initStomp() {
        
    }
    
    func connect() {
//        stompClient.connect()
        if !stompClient.isConnected{
            stompClient.connect()
        }
    }
    
    func subscribe(topic: String) {
        transformedTopic = topic.replacingOccurrences(of: "/", with: ".")
        // 检查是否已订阅该主题...
        if !subscribedTopics.contains(transformedTopic) {
            subscribedTopics.append(transformedTopic)
            stompClient.subscribe(to: "/topic/\(transformedTopic)")
        }
    }
    
    func unsubscribe(topic: String) {
        // 实现取消订阅的逻辑...
    }
    
    func isConnected() -> Bool {
        return stompClient.isConnected
    }
    
    func disconnect() {
        if stompClient.isConnected{
            stompClient.disconnect(force: true)
        }
    }
    
    func sendMessage(message: String) {
//        debugPrint("sendMessage \(message)")
        stompClient.send(body: message, to: "/app/\(transformedTopic)", headers: [:])
    }
}


extension BytedeskStompApi : SwiftStompDelegate {
    
    public func onConnect(swiftStomp: SwiftStomp, connectType: StompConnectType) {
        if connectType == .toSocketEndpoint{
            print("Connected to socket")
        } else if connectType == .toStomp{
            print("Connected to stomp")
            //** Subscribe to topics or queues just after connect to the stomp!
//            swiftStomp.subscribe(to: "/topic/greetings")
        }
    }
    
    public func onDisconnect(swiftStomp: SwiftStomp, disconnectType: StompDisconnectType) {
        if disconnectType == .fromSocket{
            print("Socket disconnected. Disconnect completed")
        } else if disconnectType == .fromStomp{
            print("Client disconnected from stomp but socket is still connected!")
        }
    }
    
    public func onMessageReceived(swiftStomp: SwiftStomp, message: Any?, messageId: String, destination: String, headers : [String : String]) {
        
        if let messageString = message as? String {
            print("Message with id `\(messageId)` received at destination `\(destination)`:\n\(message)")
//            logView.text += "\(Date().formatted()) [id: \(messageId), at: \(destination)]: \(message)\n"
            // 使用JSONDecoder将message字符串解析为json对象
            let messageData = messageString.data(using: .utf8)
            let decoder = JSONDecoder()
            //
            let messageModel: BDMessageModel = try! decoder.decode(BDMessageModel.self, from: messageData!)
            debugPrint("received message \(messageModel.uid) \(messageModel.type)")
            if (!messageModel.isSend()) {
                debugPrint("接收到非自己发送的消息")
                // 接收的非自己发送消息
                switch messageModel.type {
                    case BytedeskConstants.MESSAGE_TYPE_READ: fallthrough
                    case BytedeskConstants.MESSAGE_TYPE_DELIVERED:
                        // 回执消息
                        updateMessageStatus(message: messageModel)
                        return
                    case BytedeskConstants.MESSAGE_TYPE_TYPING: fallthrough
                    case BytedeskConstants.MESSAGE_TYPE_PROCESSING:
                        // 非自己发送的：正在输入
//                            handleTypingMessage(message)
                        return
                    case BytedeskConstants.MESSAGE_TYPE_PREVIEW:
                        // 非自己发送的：消息预知
//                            handlePreviewMessage(message)
                        return
                    case BytedeskConstants.MESSAGE_TYPE_FAQ_UP: fallthrough
                    case BytedeskConstants.MESSAGE_TYPE_FAQ_DOWN: fallthrough
                    case BytedeskConstants.MESSAGE_TYPE_ROBOT_UP: fallthrough
                    case BytedeskConstants.MESSAGE_TYPE_ROBOT_DOWN: fallthrough
                    case BytedeskConstants.MESSAGE_TYPE_RATE_SUBMIT: fallthrough
                    case BytedeskConstants.MESSAGE_TYPE_RATE_CANCEL:
                        // 访客提交评价或取消评价
                        updateMessageStatus(message: messageModel)
                        return
                    case BytedeskConstants.MESSAGE_TYPE_STREAM:
                        // 这个case下没有执行任何操作，可能是有意为之
                        break
                    case BytedeskConstants.MESSAGE_TYPE_TRANSFER:
                        // 转接
                        print("transfer message")
                        // handleTransferMessage(message, thread)
                        break
                    case BytedeskConstants.MESSAGE_TYPE_TRANSFER_ACCEPT:
                        // 转接被接受
                        print("transfer accept message")
                        // handleTransferAcceptMessage(message, thread)
                        return
                    case BytedeskConstants.MESSAGE_TYPE_TRANSFER_REJECT:
                        // 转接被拒绝
                        print("transfer reject message")
                        // handleTransferRejectMessage(message, thread)
                        return
                    default:
                        // 向服务器发送消息送达回执
                        // 这部分代码在Java版本中是被注释掉的，所以在此处也没有执行任何操作
                        break
                    }
            } else {
                debugPrint("接收到自己发送的消息")
                switch messageModel.type {
                    case BytedeskConstants.MESSAGE_TYPE_READ: fallthrough
                    case BytedeskConstants.MESSAGE_TYPE_DELIVERED:
                        // 自己发送的消息回执
                        updateMessageStatus(message: messageModel)
                        return;
                    case BytedeskConstants.MESSAGE_TYPE_TYPING: fallthrough
                    case BytedeskConstants.MESSAGE_TYPE_PROCESSING:
                        // 自己发送的在输入
                        return;
                    case BytedeskConstants.MESSAGE_TYPE_PREVIEW:
                        return;
                    case BytedeskConstants.MESSAGE_TYPE_TRANSFER:
                        // 转接
                        print("transfer message");
//                             handleTransferMessage(message, thread);
                        break;
                    case BytedeskConstants.MESSAGE_TYPE_TRANSFER_ACCEPT:
                        // 转接被接受
                        print("transfer accept message");
                        // handlTransferAcceptMessage(message, thread);
                        return;
                    case BytedeskConstants.MESSAGE_TYPE_TRANSFER_REJECT:
                        // 转接被拒绝
                        print("transfer reject message");
                        // handleTransferRejectMessage(message, thread);
                        return;
                    default:
                        // 收到从服务器返回自己发的消息，发送成功
//                        updateMessageSuccess(uid);
                        break;
                }
                
            }
      
            // 插入数据库
            BDDBApis.sharedInstance().insertMessage(messageModel)
            // 通知界面
            BDNotify.notifyMessageAdd(messageModel)

        } else if let message = message as? Data {
            print("Data message with id `\(messageId)` and binary length `\(message.count)` received at destination `\(destination)`")
        }
        
        print()
    }
    
    public func onReceipt(swiftStomp: SwiftStomp, receiptId: String) {
        print("Receipt with id `\(receiptId)` received")
    }
    
    public func onError(swiftStomp: SwiftStomp, briefDescription: String, fullDescription: String?, receiptId: String?, type: StompErrorType) {
        if type == .fromSocket{
            print("Socket error occurred! [\(briefDescription)]")
        } else if type == .fromStomp{
            print("Stomp error occurred! [\(briefDescription)] : \(String(describing: fullDescription))")
        } else {
            print("Unknown error occured!")
        }
    }
    
    public func onSocketEvent(eventName: String, description: String) {
        print("Socket event occured: \(eventName) => \(description)")
    }
    
    //
    public func updateMessageStatus(message: BDMessageModel) {
//        String uid = message.content!;
//        String status = message.type!;
//        messageProvider?.update(uid, status);
//        //
//        bytedeskEventBus.fire(ReceiveMessageReceiptEventBus(uid, status));
    }

    public func updateMessageSuccess(uid: String) {
//        messageProvider?.update(uid, BytedeskConstants.MESSAGE_STATUS_SUCCESS);
//        //
//        bytedeskEventBus.fire(ReceiveMessageReceiptEventBus(
//                uid, BytedeskConstants.MESSAGE_STATUS_SUCCESS));
    }

    public func handleTypingMessage(message: BDMessageModel) {
//        bytedeskEventBus.fire(ReceiveMessagePreviewEventBus(message));
    }

    public func handlePreviewMessage(message: BDMessageModel) {
//        bytedeskEventBus.fire(ReceiveMessagePreviewEventBus(message));
    }

    public func handleTransferMessage() {}
    
}

