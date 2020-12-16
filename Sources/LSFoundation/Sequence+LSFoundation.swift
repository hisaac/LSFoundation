//
//  Sequence+LSFoundation.swift
//  LSFoundation
//

import Foundation

extension Sequence {

	/// This method returns each pairing of all elements as tuples within the sequence
	///
	/// For example, for an array of `[1, 2, 3, 4]`, this method would return `[(1, 2), (2, 3), (3, 4)]`
	/// - Returns: Each pairing of all elements as tuples within the sequence
	public func eachPair() -> AnySequence<(Element, Element)> {
		return AnySequence(zip(self, self.dropFirst()))
	}

	/// Checks whether or not all elements in a sequence match the given predicate
	/// - Parameter predicate: The predicate to match against
	/// - Returns: Whether or not all elements match the given predicate
	public func all(where predicate: (Element) -> Bool) -> Bool {
		for element in self {
			if predicate(element) == false {
				return false
			}
		}
		return true
	}

	/// Checks whether or not none of the elements in a sequence match the given predicate
	/// - Parameter predicate: The predicate to match against
	/// - Returns: Whether or not none of the elements match the given predicate
	public func none(where predicate: (Element) -> Bool) -> Bool {
		for element in self {
			if predicate(element) {
				return false
			}
		}
		return true
	}

	/// Checks whether or not any of the elements in a sequence match the given predicate
	/// - Parameter predicate: The predicate to match against
	/// - Returns: Whether or not any of the elements match the given predicate
	public func any(where predicate: (Element) -> Bool) -> Bool {
		for element in self {
			if predicate(element) {
				return true
			}
		}
		return false
	}

	/// Returns a count of how many elements in the sequence match the given predicate
	/// - Parameter predicate: The predicate to match against
	/// - Returns: The count of how many elements match the given predicate
	public func count(where predicate: (Element) -> Bool) -> Int {
		var count = 0
		for element in self {
			if predicate(element) {
				count += 1
			}
		}
		return count
	}
}

extension Sequence where Element: Numeric {

	/// The sum of all elements in the sequence
	public var sum: Element {
		return self.reduce(0, +)
	}
}

extension Array where Element: BinaryFloatingPoint {

	/// The average of all elements in the array
	public var average: Element {
		return sum / Element(self.count)
	}
}
