// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: events/synchronization_end.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

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

struct Metric_Events_SynchronizationEnd {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subghzCount: Int32 = 0

  var rfidCount: Int32 = 0

  var nfcCount: Int32 = 0

  var infraredCount: Int32 = 0

  var ibuttonCount: Int32 = 0

  var synchronizationTimeMs: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Metric_Events_SynchronizationEnd: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "metric.events"

extension Metric_Events_SynchronizationEnd: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SynchronizationEnd"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subghz_count"),
    2: .standard(proto: "rfid_count"),
    3: .standard(proto: "nfc_count"),
    4: .standard(proto: "infrared_count"),
    5: .standard(proto: "ibutton_count"),
    6: .standard(proto: "synchronization_time_ms"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.subghzCount) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.rfidCount) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.nfcCount) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self.infraredCount) }()
      case 5: try { try decoder.decodeSingularInt32Field(value: &self.ibuttonCount) }()
      case 6: try { try decoder.decodeSingularInt64Field(value: &self.synchronizationTimeMs) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.subghzCount != 0 {
      try visitor.visitSingularInt32Field(value: self.subghzCount, fieldNumber: 1)
    }
    if self.rfidCount != 0 {
      try visitor.visitSingularInt32Field(value: self.rfidCount, fieldNumber: 2)
    }
    if self.nfcCount != 0 {
      try visitor.visitSingularInt32Field(value: self.nfcCount, fieldNumber: 3)
    }
    if self.infraredCount != 0 {
      try visitor.visitSingularInt32Field(value: self.infraredCount, fieldNumber: 4)
    }
    if self.ibuttonCount != 0 {
      try visitor.visitSingularInt32Field(value: self.ibuttonCount, fieldNumber: 5)
    }
    if self.synchronizationTimeMs != 0 {
      try visitor.visitSingularInt64Field(value: self.synchronizationTimeMs, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Metric_Events_SynchronizationEnd, rhs: Metric_Events_SynchronizationEnd) -> Bool {
    if lhs.subghzCount != rhs.subghzCount {return false}
    if lhs.rfidCount != rhs.rfidCount {return false}
    if lhs.nfcCount != rhs.nfcCount {return false}
    if lhs.infraredCount != rhs.infraredCount {return false}
    if lhs.ibuttonCount != rhs.ibuttonCount {return false}
    if lhs.synchronizationTimeMs != rhs.synchronizationTimeMs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
