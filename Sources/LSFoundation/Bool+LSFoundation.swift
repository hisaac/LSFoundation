//
//  Bool+LSFoundation.swift
//  LSFoundation
//

import Foundation

public extension Bool {

	/// Returns a new value that is the toggled version of the current `Bool`
	var toggled: Bool {
		var mutableSelf = self
		mutableSelf.toggle()
		return mutableSelf
	}

	/// A more expressive way to check truthfulness
	var isTrue: Bool {
		return self == true
	}

	/// A more expressive way to check falsehood
	var isFalse: Bool {
		return self == false
	}
}
