//
//  Bool+LSFoundation.swift
//  LSFoundation
//

import Foundation

extension Bool {

	/// Returns a new value that is the toggled version of the current `Bool`
	public var toggled: Bool {
		return !self
	}

	/// A more expressive way to check truthfulness
	public var isTrue: Bool {
		return self == true
	}

	/// A more expressive way to check falsehood
	public var isFalse: Bool {
		return self == false
	}
}
