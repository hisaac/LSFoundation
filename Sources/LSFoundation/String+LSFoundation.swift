//
//  String+LSFoundation.swift
//  LSFoundation
//

import Foundation

public extension String {

	/// Convenience accessor for `NSString`'s `lastPathComponent` property
	var lastPathComponent: String {
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
	func containsAny<T>(of other: T...) -> Bool where T: StringProtocol {
		return containsAny(of: other)
	}

	/// Checks if the current string contains any of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if any of the given strings are contained within the current string
	func containsAny<T>(of other: [T]) -> Bool where T: StringProtocol {
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
	func containsAll<T>(of other: T...) -> Bool where T: StringProtocol {
		return containsAll(of: other)
	}

	/// Checks if the current string contains all of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if all of the given strings are contained within the current string
	func containsAll<T>(of other: [T]) -> Bool where T: StringProtocol {
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
	func containsNone<T>(of other: T...) -> Bool where T: StringProtocol {
		return containsNone(of: other)
	}

	/// Checks if the current string does not contain any of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if none of the given strings are contained within the current string
	func containsNone<T>(of other: [T]) -> Bool where T: StringProtocol {
		for element in other {
			if self.contains(element) {
				return false
			}
		}
		return true
	}

	/// Checks if the current string ends with any of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if the current string ends with any of the given strings
	func endsWithAny<T>(of other: T...) -> Bool where T: StringProtocol {
		return endsWithAny(of: other)
	}

	/// Checks if the current string ends with any of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if the current string ends with any of the given strings
	func endsWithAny<T>(of other: [T]) -> Bool where T: StringProtocol {
		for element in other {
			if self.hasSuffix(element) {
				return true
			}
		}
		return false
	}

	/// Checks if the current string starts with any of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if the current string starts with any of the given strings
	func startsWithAny<T>(of other: T...) -> Bool where T: StringProtocol {
		return endsWithAny(of: other)
	}

	/// Checks if the current string starts with any of the given strings
	/// - Parameter other: The other strings to check for
	/// - Returns: True if the current string starts with any of the given strings
	func startsWithAny<T>(of other: [T]) -> Bool where T: StringProtocol {
		for element in other {
			if self.hasPrefix(element) {
				return true
			}
		}
		return false
	}
}
