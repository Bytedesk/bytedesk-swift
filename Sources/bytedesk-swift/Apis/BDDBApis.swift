//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2023/8/19.
//

import Foundation
import SQLite

// Swift 中的类如果要供Objective-C 调用，必须也继承自NSObject
public class BDDBApis {
    //
    var db: Connection?
    private var isTableCreated = false
    //
    let messageTable = Table("message")
    //
    let uidColumn = Expression<String>("uid")
    let typeColumn = Expression<String?>("type")
    //
    let contentColumn = Expression<String?>("content")
    let createdAtColumn = Expression<String?>("createdAt")
    //
    let threadTopicColumn = Expression<String?>("threadTopic")
    //
    let statusColumn = Expression<String?>("status")
    let userUidColumn = Expression<String?>("userUid")
    //
    let currentUidColumn = Expression<String?>("currentUid")
    //
    init() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let bytedeskDBPath = path + "/db-v2.sqlite3"
//            let bytedeskDBPath = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("bytedesk-v1.db").path
             debugPrint("bytedeskDBPath \(bytedeskDBPath)")
            db = try Connection(bytedeskDBPath)
            //
            try createMessageTable()
        } catch {
            // debugPrint("BDDBApis init \(error)")
        }
    }
    //
    class func sharedInstance() -> BDDBApis {
        struct Static {
            static let instance = BDDBApis()
        }
        return Static.instance
    }
    
    // 创建message表
    func createMessageTable() throws {
        guard !isTableCreated else {
            return
        }
        // debugPrint("createMessageTable")
        //
        try db!.run(messageTable.create(ifNotExists: true) { table in
            table.column(uidColumn, primaryKey: true)
            table.column(typeColumn)
            //
            table.column(contentColumn)
            table.column(createdAtColumn)
            //
            table.column(threadTopicColumn)
            //
            table.column(statusColumn)
            table.column(userUidColumn)
            //
            table.column(currentUidColumn)
        })
        //
        isTableCreated = true
    }

    // 在message表中插入一条记录
    func insertMessage(_ messageModel: BDMessageModel) {
        // debugPrint("insertMessage \(messageModel.type!)")
        let insert = messageTable.insert(uidColumn <- messageModel.uid!,
                                    typeColumn <- messageModel.type!,
                                    contentColumn <- messageModel.content,
                                    createdAtColumn <- messageModel.createdAt,
                                    threadTopicColumn <- messageModel.thread?.topic,
                                    statusColumn <- messageModel.status,
                                    userUidColumn <- messageModel.user?.uid,
                                    currentUidColumn <- BDSettings.getUid())
        do {
            try db!.run(insert)
        } catch {
             debugPrint("BDDBApis insert \(error)")
        }
    }

    // 查询message表
    func queryMessage() -> [BDMessageModel] {
        // debugPrint("queryMessage")
        //
        var messages: [BDMessageModel] = []
        do {
            for row in try db!.prepare(messageTable) {
                let mid = row[uidColumn]
                let type = row[typeColumn]
                let content = row[contentColumn]
                let createdAt = row[createdAtColumn]
                let threadTopic = row[threadTopicColumn]
                let status = row[statusColumn]
                let userUid = row[userUidColumn]
                let currentUid = row[currentUidColumn]
                //
                let message = BDMessageModel()
                message.uid = mid
                message.type = type
                message.content = content
                message.createdAt = createdAt
                message.thread?.topic = threadTopic
                message.status = status
                message.user?.uid = userUid
                message.currentUid = currentUid
                messages.append(message)
            }
        } catch {
            // debugPrint("BDDBApis query \(error)")
        }
        return messages
    }
    

    //
    func queryMessagesByThreadTopic(_ threadTopic: String) -> [BDMessageModel] {
        let query = messageTable.filter(threadTopicColumn == threadTopic && currentUidColumn == BDSettings.getUid())
        //
        var messages: [BDMessageModel] = []
        do {
            messages = try db!.prepare(query).map { row in
                let mid = row[uidColumn]
                let type = row[typeColumn]
                let content = row[contentColumn]
                let createdAt = row[createdAtColumn]
                let threadTopic = row[threadTopicColumn]
                let status = row[statusColumn]
                let userUid = row[userUidColumn]
                let currentUid = row[currentUidColumn]
                //
                let message = BDMessageModel()
                message.uid = mid
                message.type = type
                message.content = content
                message.createdAt = createdAt
                message.thread?.topic = threadTopic
                message.status = status
                message.user?.uid = userUid
                message.currentUid = currentUid
                return message
            }
        } catch {
            // debugPrint("BDDBApis query \(error)")
        }
        return messages
    }
    
    func clearMessageTable() {
        let messageTable = Table("message")
        let deleteQuery = messageTable.delete()
        do {
            try db!.run(deleteQuery)
            print("表message中的记录已成功清空")
        } catch {
            print("清空表message中的记录时出现错误: \(error)")
        }
    }

    func deleteMessagesByThreadTopic(_ threadTopic: String) {
        let query = messageTable.filter(threadTopicColumn == threadTopic)
        do {
            try db!.run(query.delete())
        } catch {
            print("清空表message中的记录时出现错误: \(error)")
        }
    }
    
    func deleteMessageByMid(_ mid: String) {
        let query = messageTable.filter(uidColumn == mid)
        do {
            try db!.run(query.delete())
        } catch {
            print("清空表message中的记录时出现错误: \(error)")
        }
    }
    
    
}
