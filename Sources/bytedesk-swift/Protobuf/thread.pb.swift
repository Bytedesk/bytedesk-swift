// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: thread.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// prevent naming conflicts between different projects.
/// package protobuf.proto;

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Thread {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// ID
  var uid: String = String()

  /// 订阅主题
  var topic: String = String()

  /// 会话类型
  var type: String = String()

  /// 会话状态
  var status: String = String()

  /// 头像昵称等信息
  var user: User {
    get {return _user ?? User()}
    set {_user = newValue}
  }
  /// Returns true if `user` has been explicitly set.
  var hasUser: Bool {return self._user != nil}
  /// Clears the value of `user`. Subsequent reads from it will return its default value.
  mutating func clearUser() {self._user = nil}

  /// 自定义扩展/附加信息
  var extra: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _user: User? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Thread: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Thread: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Thread"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uid"),
    2: .same(proto: "topic"),
    3: .same(proto: "type"),
    4: .same(proto: "status"),
    5: .same(proto: "user"),
    6: .same(proto: "extra"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.uid) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.topic) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.type) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.status) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._user) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.extra) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.uid.isEmpty {
      try visitor.visitSingularStringField(value: self.uid, fieldNumber: 1)
    }
    if !self.topic.isEmpty {
      try visitor.visitSingularStringField(value: self.topic, fieldNumber: 2)
    }
    if !self.type.isEmpty {
      try visitor.visitSingularStringField(value: self.type, fieldNumber: 3)
    }
    if !self.status.isEmpty {
      try visitor.visitSingularStringField(value: self.status, fieldNumber: 4)
    }
    try { if let v = self._user {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    if !self.extra.isEmpty {
      try visitor.visitSingularStringField(value: self.extra, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Thread, rhs: Thread) -> Bool {
    if lhs.uid != rhs.uid {return false}
    if lhs.topic != rhs.topic {return false}
    if lhs.type != rhs.type {return false}
    if lhs.status != rhs.status {return false}
    if lhs._user != rhs._user {return false}
    if lhs.extra != rhs.extra {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
