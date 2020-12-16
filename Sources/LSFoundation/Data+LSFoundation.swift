//
//  Data+LSFoundation.swift
//  LSFoundation
//

import Foundation

extension Data {

	/// Returns `Data` converted to hexidecimal string format
	var hexString: String {
		return self
			.map { return String(format: "%02hhx", $0) }
			.joined()
	}
}
