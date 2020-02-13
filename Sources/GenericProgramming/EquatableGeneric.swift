/// A duplicate, simplified version of the `Equatable` protocol.
/// - Note: a duplicate protocol is used to avoid triggering existing `Equatable` derived
///   conformances.
public protocol EquatableGeneric {
    func genericEqual(_ other: Self) -> Bool

}

// Inductive cases.

extension Value: EquatableGeneric where T: EquatableGeneric {
    public func genericEqual(_ other: Self) -> Bool {
        return value.genericEqual(other.value)
    }
}

extension Case: EquatableGeneric where A: EquatableGeneric, B: EquatableGeneric {
    public func genericEqual(_ other: Self) -> Bool {
        switch (self, other) {
        case let (.shape(x), .shape(y)):
            return x.genericEqual(y)
        case let (.next(x), .next(y)):
            return x.genericEqual(y)
        default:
            return false
        }
    }
}

extension Field: EquatableGeneric where A: EquatableGeneric, B: EquatableGeneric {
    public func genericEqual(_ other: Self) -> Bool {
        return shape.genericEqual(other.shape) && next.genericEqual(other.next)
    }
}

extension Enum: EquatableGeneric where A: EquatableGeneric {
    public func genericEqual(_ other: Self) -> Bool {
        shape.genericEqual(other.shape)
    }
}

extension Struct: EquatableGeneric where A: EquatableGeneric {
    public func genericEqual(_ other: Self) -> Bool {
        shape.genericEqual(other.shape)
    }
}

// Base cases.

extension Empty: EquatableGeneric {
    public func genericEqual(_ other: Empty) -> Bool {
        return true
    }
}

extension Int: EquatableGeneric {
    public func genericEqual(_ other: Int) -> Bool {
        return self == other
    }
}

extension Float: EquatableGeneric {
    public func genericEqual(_ other: Float) -> Bool {
        return self == other
    }
}

extension Double: EquatableGeneric {
    public func genericEqual(_ other: Double) -> Bool {
        return self == other
    }
}
