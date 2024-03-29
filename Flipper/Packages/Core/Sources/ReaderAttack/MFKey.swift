public struct MFKey64: Hashable, Sendable {
    public let value: UInt64

    public var hexValue: String {
        String(value, radix: 16)
    }

    public init(value: UInt64) {
        self.value = value
    }

    public init?<HEXValue: StringProtocol>(hexValue: HEXValue) {
        guard let value = UInt64(hexValue, radix: 16) else {
            return nil
        }
        self.value = value
    }
}

public struct MFKey32: Hashable, Sendable {
    public let value: UInt32

    public var hexValue: String {
        String(value, radix: 16)
    }

    public init(value: UInt32) {
        self.value = value
    }

    public init?<HEXValue: StringProtocol>(hexValue: HEXValue) {
        guard let value = UInt32(hexValue, radix: 16) else {
            return nil
        }
        self.value = value
    }
}
