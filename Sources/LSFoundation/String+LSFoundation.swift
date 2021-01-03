//
//  String+LSFoundation.swift
//  LSFoundation
//

import Foundation

extension String {

	/// Convenience accessor for `NSString`'s `lastPathComponent` property
	public var lastPathComponent: String {
		return NSString(string: self).lastPathComponent
	}

	/// Checks if a string does not contain another string
	/// - Parameter other: The other element to check for
	/// - Returns: True if the string is not contained within the other string
	func doesNotContain<T>(_ other: T) -> Bool where T: StringProtocol {
		return self.contains(other).toggled
	}

	/// Checks if the current string contains any of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if any of the given strings are contained within the current string
	public func containsAny<T>(of other: T...) -> Bool where T: StringProtocol {
		for element in other {
			if self.contains(element) {
				return true
			}
		}
		return false
	}

	/// Checks if the current string contains all of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if all of the given strings are contained within the current string
	public func containsAll<T>(of other: T...) -> Bool where T: StringProtocol {
		for element in other {
			if self.doesNotContain(element) {
				return false
			}
		}
		return true
	}

	/// Checks if the current string does not contain any of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if none of the given strings are contained within the current string
	public func containsNone<T>(of other: T...) -> Bool where T: StringProtocol {
		for element in other {
			if self.contains(element) {
				return false
			}
		}
		return true
	}
}
