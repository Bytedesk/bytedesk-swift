//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2024/10/11.
//

import Foundation

struct BytedeskConstants {
    
    // 本地测试
    //  static let IS_DEBUG = true;
    //  static let API_BASE_URL = "http://127.0.0.1:9003";
    //  static let STOMP_WS_URL = "ws://127.0.0.1:9003/stomp";

    // 线上环境
   static let IS_DEBUG = false;
   static let API_BASE_URL = "https://api.weiyuai.cn";
   static let STOMP_WS_URL = "wss://api.weiyuai.cn/stomp";
//
    static let HTTP_CLIENT = "ios";
    static let PLATFORM = "weiyuai";
    static let LOCALE = "locale";
    static let VISITOR_UID = "visitor_uid";
    static let VISITOR_NICKNAME = "visitor_nickname";
    static let VISITOR_AVATAR = "visitor_avatar";
    static let VISITOR_ORGUID = "visitor_orguid";
    static let VISITOR_DEVICEUID = "visitor_deviceuid";
    static let I18N_PREFIX = "i18n.";
// 登录超时
    static let EVENT_BUS_LOGIN_TIMEOUT = "EVENT_BUS_LOGIN_TIMEOUT";
// 用户名或密码错误
    static let EVENT_BUS_LOGIN_ERROR_400 = "EVENT_BUS_LOGIN_ERROR_400";
// 服务器错误500
    static let EVENT_BUS_SERVER_ERROR_500 = "EVENT_BUS_SERVER_ERROR_500";
// token失效
    static let EVENT_BUS_TOKEN_INVALID = "EVENT_BUS_TOKEN_INVALID";
    static let EVENT_BUS_SWITCH_THEME = "EVENT_BUS_SWITCH_THEME";
//
    static let EVENT_BUS_MESSAGE_TYPE_STATUS = "EVENT_BUS_MESSAGE_TYPE_STATUS";
    static let EVENT_BUS_MESSAGE_TYPE_TYPING = "EVENT_BUS_MESSAGE_TYPE_TYPING";
    static let EVENT_BUS_MESSAGE_TYPE_PROCESSING =
            "EVENT_BUS_MESSAGE_TYPE_PROCESSING";
    static let EVENT_BUS_MESSAGE_TYPE_STREAM = "EVENT_BUS_MESSAGE_TYPE_STREAM";
    static let EVENT_BUS_MESSAGE_TYPE_PREVIEW = "EVENT_BUS_MESSAGE_TYPE_PREVIEW";
    static let EVENT_BUS_MESSAGE_TYPE_CONTENT = "EVENT_BUS_MESSAGE_TYPE_CONTENT";
//
    static let THEME_MODE_TYPE = "THEME_MODE_TYPE";
    static let THEME_MODE_TYPE_LIGHT = "light";
    static let THEME_MODE_TYPE_DARK = "dark";
    static let THEME_MODE_TYPE_SYSTEM = "system";
//
    static let THEME_NAME_TYPE = "THEME_NAME_TYPE";
    static let THEME_NAME_TYPE_DARK = "dark";
    static let THEME_NAME_TYPE_LIGHT = "light";
//
    static let PLAY_AUDIO = "PLAY_AUDIO";
//
    static let CONFIG_ENABLED = "CONFIG_ENABLED";
    static let CONFIG_API_HOST = "CONFIG_API_HOST";
    static let CONFIG_HTML_HTML = "CONFIG_HTML_HOST";
//
    static let USER_TYPE_AGENT = "AGENT";
    static let USER_TYPE_SYSTEM = "SYSTEM";
    static let USER_TYPE_VISITOR = "VISITOR";
    static let USER_TYPE_ROBOT = "ROBOT";
    static let USER_TYPE_MEMBER = "MEMBER";
    static let USER_TYPE_ASSISTANT = "ASSISTANT";
    static let USER_TYPE_CHANNEL = "CHANNEL";
    static let USER_TYPE_LOCAL = "LOCAL";
    static let USER_TYPE_USER = "USER";
//
// 会话类型 = 工作组会话、访客跟客服一对一、同事一对一、群组会话
    static let THREAD_TYPE_AGENT = "AGENT";
    static let THREAD_TYPE_WORKGROUP = "WORKGROUP";
    static let THREAD_TYPE_KB = "KB";
    static let THREAD_TYPE_LLM = "LLM";
    static let THREAD_TYPE_MEMBER = "MEMBER";
    static let THREAD_TYPE_GROUP = "GROUP";
    static let THREAD_TYPE_LEAVEMSG = "LEAVEMSG";
    static let THREAD_TYPE_FEEDBACK = "FEEDBACK";
    static let THREAD_TYPE_ASSISTANT = "ASSISTANT";
    static let THREAD_TYPE_CHANNEL = "CHANNEL";
    static let THREAD_TYPE_LOCAL = "LOCAL";
//
    static let THREAD_STATUS_QUEUING = "QUEUING"; // 排队中
    static let THREAD_STATUS_NORMAL = "NORMAL"; // 正常
    static let THREAD_STATUS_REENTER = "REENTER"; // 会话进行中，访客关闭会话页面之后，重新进入
    static let THREAD_STATUS_REOPEN = "REOPEN"; // 会话关闭之后，重新进入
    static let THREAD_STATUS_OFFLINE = "OFFLINE"; // 客服不在线
    static let THREAD_STATUS_RATED = "RATED"; // rated, prevent repeated rate
    static let THREAD_STATUS_AUTO_CLOSED = "AUTO_CLOSED";
    static let THREAD_STATUS_AGENT_CLOSED = "AGENT_CLOSED";
    static let THREAD_STATUS_DISMISSED = "DISMISSED"; // 会话解散
    static let THREAD_STATUS_MUTED = "MUTED"; // 会话静音
    static let THREAD_STATUS_FORBIDDEN = "FORBIDDEN"; // 会话禁言
    static let THREAD_STATUS_MONITORED = "MONITORED"; // 会话监控
// 消息发送状态
// 发送中
    static let MESSAGE_STATUS_SENDING = "SENDING"; // sending
    static let MESSAGE_STATUS_TIMEOUT = "TIMEOUT"; // network send failed
    static let MESSAGE_STATUS_BLOCKED = "BLOCKED"; // in black list
    static let MESSAGE_STATUS_NOTFRIEND = "NOTFRIEND"; // not friend
    static let MESSAGE_STATUS_ERROR = "ERROR"; // other send error
    static let MESSAGE_STATUS_SUCCESS = "SUCCESS"; // send success
    static let MESSAGE_STATUS_RECALL = "RECALL"; // recall back
    static let MESSAGE_STATUS_DELIVERED = "DELIVERED"; // send to the other client
    static let MESSAGE_STATUS_READ = "READ"; // read by the other client
    static let MESSAGE_STATUS_DESTROYED = "DESTROYED"; // destroyed after read
    static let MESSAGE_STATUS_UNPRECESSED = "UNPRECESSED"; // not processed
    static let MESSAGE_STATUS_PROCESSED = "PROCESSED"; // leave message processed
    static let MESSAGE_STATUS_LEAVE_MSG_SUBMIT = "LEAVE_MSG_SUBMIT"; // 提交留言
    static let MESSAGE_STATUS_RATE_SUBMIT = "RATE_SUBMIT"; // 提交会话评价
    static let MESSAGE_STATUS_RATE_CANCEL = "RATE_CANCEL"; // 取消评价会话
    static let MESSAGE_STATUS_RATE_UP = "RATE_UP"; // 评价消息up
    static let MESSAGE_STATUS_RATE_DOWN = "RATE_DOWN"; // 评价消息down
//
// 消息类型
    static let MESSAGE_TYPE_WELCOME = "WELCOME";
    static let MESSAGE_TYPE_CONTINUE = "CONTINUE";
    static let MESSAGE_TYPE_SYSTEM = "SYSTEM";
    static let MESSAGE_TYPE_TEXT = "TEXT"; // 文本消息类型
    static let MESSAGE_TYPE_IMAGE = "IMAGE"; // 图片消息类型
    static let MESSAGE_TYPE_FILE = "FILE"; // 文件消息类型
    static let MESSAGE_TYPE_AUDIO = "AUDIO"; // 语音消息类型
    static let MESSAGE_TYPE_VIDEO = "VIDEO"; // 视频消息类型
    static let MESSAGE_TYPE_MUSIC = "MUSIC";
    static let MESSAGE_TYPE_LOCATION = "LOCATION";
    static let MESSAGE_TYPE_GOODS = "GOODS";
    static let MESSAGE_TYPE_CARD = "CARD";
    static let MESSAGE_TYPE_EVENT = "EVENT";
//
    static let MESSAGE_TYPE_GUESS = "GUESS"; // 猜你想问
    static let MESSAGE_TYPE_HOT = "HOT"; // 热门问题
    static let MESSAGE_TYPE_SHORTCUT = "SHORTCUT"; // 快捷路径
    static let MESSAGE_TYPE_ORDER = "ORDER"; // 订单
    static let MESSAGE_TYPE_POLL = "POLL"; // 投票
    static let MESSAGE_TYPE_FORM = "FORM"; // 表单：询前表单
    static let MESSAGE_TYPE_LEAVE_MSG = "LEAVE_MSG"; // 留言
    static let MESSAGE_TYPE_LEAVE_MSG_SUBMIT = "LEAVE_MSG_SUBMIT"; // 留言提交
    static let MESSAGE_TYPE_TICKET = "TICKET"; // 客服工单
    static let MESSAGE_TYPE_TYPING = "TYPING"; // 正在输入
    static let MESSAGE_TYPE_PROCESSING = "PROCESSING"; // 正在处理，等待大模型回复中
    static let MESSAGE_TYPE_STREAM = "STREAM"; // 流式消息TEXT，大模型回复
    static let MESSAGE_TYPE_PREVIEW = "PREVIEW"; // 消息预知
    static let MESSAGE_TYPE_RECALL = "RECALL"; // 撤回
    static let MESSAGE_TYPE_DELIVERED = "DELIVERED"; // 回执: 已送达
    static let MESSAGE_TYPE_READ = "READ"; // 回执: 已读
    static let MESSAGE_TYPE_QUOTATION = "QUOTATION"; // qoute message
    static let MESSAGE_TYPE_KICKOFF = "KICKOFF"; // kickoff other clients
    static let MESSAGE_TYPE_SHAKE = "SHAKE"; // shake window
//
    static let MESSAGE_TYPE_FAQ = "FAQ"; // 常见问题FAQ
    static let MESSAGE_TYPE_FAQ_Q = "FAQ_Q"; // 常见问题FAQ-问题
    static let MESSAGE_TYPE_FAQ_A = "FAQ_A"; // 常见问题FAQ-答案
    static let MESSAGE_TYPE_FAQ_UP = "FAQ_UP"; // 常见问题答案评价:UP
    static let MESSAGE_TYPE_FAQ_DOWN = "FAQ_DOWN"; // 常见问题答案评价:DOWN
    static let MESSAGE_TYPE_ROBOT = "ROBOT"; // 机器人
    static let MESSAGE_TYPE_ROBOT_UP = "ROBOT_UP"; // 机器人答案评价:UP
    static let MESSAGE_TYPE_ROBOT_DOWN = "ROBOT_DOWN"; // 机器人答案评价:DOWN
//
    static let MESSAGE_TYPE_RATE = "RATE"; // 访客主动评价
    static let MESSAGE_TYPE_RATE_INVITE = "RATE_INVITE"; // 客服邀请评价
    static let MESSAGE_TYPE_RATE_SUBMIT = "RATE_SUBMIT"; // 访客提交评价
    static let MESSAGE_TYPE_RATE_CANCEL = "RATE_CANCEL"; // 访客取消评价
//
    static let MESSAGE_TYPE_AUTO_CLOSED = "AUTO_CLOSED"; // 自动关闭
    static let MESSAGE_TYPE_AGENT_CLOSED = "AGENT_CLOSED"; // 客服关闭
//
    static let MESSAGE_TYPE_TRANSFER = "TRANSFER"; // 转接
    static let MESSAGE_TYPE_TRANSFER_ACCEPT = "TRANSFER_ACCEPT"; // 转接-接受
    static let MESSAGE_TYPE_TRANSFER_REJECT = "TRANSFER_REJECT"; // 转接-拒绝
//
    static let MESSAGE_TYPE_INVITE = "INVITE"; // 邀请
    static let MESSAGE_TYPE_INVITE_ACCEPT = "INVITE_ACCEPT"; // 邀请-接受
    static let MESSAGE_TYPE_INVITE_REJECT = "INVITE_REJECT"; // 邀请-拒绝
//
    static let TOPIC_FILE_ASSISTANT = "file";
    static let TOPIC_SYSTEM_NOTIFICATION = "system";
// 注意：没有 "/" 开头，防止stomp主题中奖 "/" 替换为 "."之后，在最前面多余一个 "."
    static let TOPIC_USER_PREFIX = "user/";
// static let TOPIC_PRIVATE_PREFIX = "private/";
// static let TOPIC_GROUP_PREFIX = "group/";
    static let TOPIC_FILE_PREFIX = "file/";
    static let TOPIC_SYSTEM_PREFIX = "system/";
// static let TOPIC_ROBOT_PREFIX = "robot/";
//
    static let TOPIC_ORGNIZATION_PREFIX = "org/";
    static let TOPIC_ORG_MEMBER_PREFIX = "org/member/";
    static let TOPIC_ORG_DEPARTMENT_PREFIX = "org/department/";
    static let TOPIC_ORG_GROUP_PREFIX = "org/group/";
    static let TOPIC_ORG_PRIVATE_PREFIX = "org/private/";
    static let TOPIC_ORG_ROBOT_PREFIX = "org/robot/";
    static let TOPIC_ORG_AGENT_PREFIX = "org/agent/";
    static let TOPIC_ORG_WORKGROUP_PREFIX = "org/workgroup/";
    static let TOPIC_ORG_KB_PREFIX = "org/kb/";
    static let TOPIC_ORG_KBDOC_PREFIX = "org/kbdoc/";
//
    static let KB_TYPE_ASSISTANT = "ASSISTANT";
    static let KB_TYPE_HELPDOC = "HELPDOC";
    static let KB_TYPE_LLM = "LLM";
    static let KB_TYPE_KEYWORD = "KEYWORD";
    static let KB_TYPE_FAQ = "FAQ";
    static let KB_TYPE_QUICKREPLY = "QUICKREPLY";
    static let KB_TYPE_AUTOREPLY = "AUTOREPLY";
    static let KB_TYPE_BLOG = "BLOG";
    static let KB_TYPE_EMAIL = "EMAIL";
    static let KB_TYPE_TABOO = "TABOO";
//
    static let UPLOAD_TYPE_CHAT = "CHAT";
//
    static let AUTO_REPLY_TYPE_FIXED = "FIXED";
    static let AUTO_REPLY_TYPE_KEYWORD = "KEYWORD";
    static let AUTO_REPLY_TYPE_LLM = "LLM";
// 
    static let EVENT_BUS_MESSAGE = "BYTEDESK_EVENT_BUS_MESSAGE";
// 连接中
    static let CONNECTION_STATUS_CONNECTING = "connecting";
// 连接成功
    static let CONNECTION_STATUS_CONNECTED = "connected";
// 连接断开
    static let CONNECTION_STATUS_DISCONNECTED = "disconnncted";
// 长连接状态
    static let EVENT_BUS_CONNECTION_STATUS = "EVENT_BUS_CONNECTION_STATUS";
    
    
}
