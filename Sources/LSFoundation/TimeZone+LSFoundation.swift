//
//  TimeZone+LSFoundation.swift
//  LSFoundation
//

import Foundation

extension TimeZone {

	/// Convenience initializer for UTC time
	public static var UTC: TimeZone? {
		return TimeZone(identifier: "UTC")
	}
}
