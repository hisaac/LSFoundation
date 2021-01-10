//
//  TimeZone+LSFoundation.swift
//  LSFoundation
//

import Foundation

public extension TimeZone {

	/// Convenience initializer for UTC time
	static var UTC: TimeZone? {
		return TimeZone(identifier: "UTC")
	}
}
