//
// Created by Rene Dohan on 12/16/19.
//

import Foundation

public protocol CSAnyProtocol {
}

public extension CSAnyProtocol {

    public static func cast(_ object: Any) -> Self { object as! Self }

    public var notNil: Bool { true }

    public var isSet: Bool { true }

    public var isNil: Bool { false }

    @discardableResult
    public func also(_ function: (Self) -> Void) -> Self {
        function(self)
        return self
    }

    @discardableResult
    public func invoke(_ function: Func) -> Self {
        function()
        return self
    }

    @discardableResult
    public func invoke(from: Int, until: Int, function: (Int) -> Void) -> Self {
        from.until(until, function)
        return self
    }

    @discardableResult
    public func run(_ function: Func) -> Void {
        function()
    }

    public func then(_ function: (Self) -> Void) { function(self) }

    // let in kotlin
    public func get<ReturnType>(_ function: (Self) -> ReturnType) -> ReturnType { function(self) }

    public var asString: String { (self as? CSNameProtocol)?.name ?? "\(self)" }

    public var asInt: Int {
        let value = asString
        return value.isEmpty ? 0 : value.intValue
    }

    public func cast<T>() -> T { self as! T }

    public func castOrNil<T>() -> T? { self as? T }

//    public func equals(to object: Any?) -> Bool { //TODO: check how this is reliable
//        String(describing: self) == String(describing: object)
//    }
}

public extension CSAnyProtocol where Self: NSObject {
    public func equals(any objects: NSObject...) -> Bool {
        if objects.contains(self) { return true }
        return false
    }
}

public extension CSAnyProtocol where Self: Equatable {
    public func equals(any objects: Self...) -> Bool { objects.contains { $0 == self } }

    public func equals(_ object: Self) -> Bool { object == self }
}

public extension CSAnyProtocol where Self: Equatable, Self: AnyObject {
    public static func ==(lhs: Self, rhs: Self) -> Bool { lhs === rhs }
}

public extension CSAnyProtocol where Self: CustomStringConvertible {
    public var description: String { "\(type(of: self))" }
}

public extension CSAnyProtocol where Self: CustomStringConvertible, Self: CSNameProtocol {
    public var description: String { name }
}