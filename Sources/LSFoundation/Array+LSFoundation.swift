//
//  Array+LSFoundation.swift
//  LSFoundation
//

import Foundation

public extension Array where Element: BinaryFloatingPoint {

	/// The average of all elements in the array
	var average: Element {
		return sum / Element(self.count)
	}
}

public extension Array where Self.Element: Equatable {

	/// Checks whether the array does not contain the given Element
	/// - Parameter element: The element to check for
	/// - Returns: True if the array does not contain contain the element
	func doesNotContain(_ element: Element) -> Bool {
		return self.contains(element).toggled
	}

	func containsAny(of elements: Element...) -> Bool {
		for element in elements {
			if self.contains(element) {
				return true
			}
		}
		return false
	}

	func containsAll(of elements: Element...) -> Bool {
		for element in elements {
			if self.doesNotContain(element) {
				return false
			}
		}
		return true
	}

	func containsNone(of elements: Element...) -> Bool {
		for element in elements {
			if self.contains(element) {
				return false
			}
		}
		return true
	}
}
