//
//  Numeric+LSFoundation.swift
//  LSFoundation
//

import Foundation

// swiftlint:disable operator_whitespace
/// Adds ability to multiply `Int` and `CGFloat` variables together without having to manually do conversion
public func *(lhs: Int, rhs: CGFloat) -> CGFloat {
	return CGFloat(lhs) * rhs
}

/// Adds ability to multiply `Int` and `CGFloat` variables together without having to manually do conversion
public func *(lhs: CGFloat, rhs: Int) -> CGFloat {
	return lhs * CGFloat(rhs)
}
// swiftlint:enable operator_whitespace
