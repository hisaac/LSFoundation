//
//  URL+LSFoundation.swift
//  LSFoundation
//

import Foundation

extension URL {
	/// Convenience initializer allowing for the creation of a `URL` using a `StaticString`
	/// - Parameter string: The `StaticString` to use to create the `URL`
	public init(staticString string: StaticString) {
		guard let url = URL(string: "\(string)") else {
			preconditionFailure("Invalid static URL string: \(string)")
		}
		self = url
	}
}
