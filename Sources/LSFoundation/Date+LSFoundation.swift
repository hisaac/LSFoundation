//
//  Date+LSFoundation.swift
//  LSFoundation
//

import Foundation

public extension Date {

	/// A more correct name for the `Date` type
	typealias Moment = Date

	/// A more expressive way to get the current date/time
	static var now: Date {
		Date()
	}

	/// Returns the start of the day
	var startOfDay: Date {
		Calendar.current.startOfDay(for: self)
	}

	/// Returns the last second of the day
	var endOfDay: Date? {
		self.dateAtLast(.second)
	}

	/// Returns a Date representing the last of the given component for the current Date
	/// - Parameter component: The date component to find the last of
	/// - Returns: A Date representing the last of the given component for the current Date
	func dateAtLast(_ component: Calendar.Component) -> Date? {
		guard let dayAfter = self.dayBefore,
			  let dateAtLastComponent = Calendar.current.date(byAdding: component, value: -1, to: dayAfter) else {
			return nil
		}

		return dateAtLastComponent
	}

	/// Returns the value of the last of the given component for the current Date
	/// - Parameter component: The date component to find the last of
	/// - Returns: A Date representing the last of the given component for the current Date
	func last(_ component: Calendar.Component) -> Int? {
		guard let dateAtLastComponent = self.dateAtLast(component) else { return nil }
		return Calendar.current.component(component, from: dateAtLastComponent)
	}

	/// Calculates the day before the given date
	var dayBefore: Date? {
		Calendar.current.date(byAdding: .day, value: -1, to: self.startOfDay)
	}

	/// Calculates the day after the given date
	var dayAfter: Date? {
		Calendar.current.date(byAdding: .day, value: 1, to: self.startOfDay)
	}

	/// A date representing the day after today
	static var tomorrow: Date? {
		now.dayAfter
	}

	/// A date representing the day before today
	static var yesterday: Date? {
		now.dayBefore
	}

	/// Calculates how many of the given `Calendar.Component` the origin `Date` is before the given `Date`
	/// - Parameters:
	///   - component: The `Calendar.Component` to calculate the difference of
	///   - date: The `Date` to compare to the origin `Date`
	/// - Returns: The amount of the given `Calendar.Component` the origin `Date` is before the given `Date`
	func isHowMany(ofComponent component: Calendar.Component, before date: Date) -> Int {
		self.isHowMany(ofComponent: component, from: date) * -1
	}

	/// Calculates how many of the given `Calendar.Component` the origin `Date` is after the given `Date`
	/// - Parameters:
	///   - component: The `Calendar.Component` to calculate the difference of
	///   - date: The `Date` to compare to the origin `Date`
	/// - Returns: The amount of the given `Calendar.Component` the origin `Date` is after the given `Date`
	func isHowMany(ofComponent component: Calendar.Component, after date: Date) -> Int {
		self.isHowMany(ofComponent: component, from: date)
	}

	/// Calculates how many of the given `Calendar.Component` the origin `Date` is from the given `Date`
	/// - Parameters:
	///   - component: The `Calendar.Component` to calculate the difference of
	///   - date: The `Date` to compare to the origin `Date`
	/// - Returns: The amount of the given `Calendar.Component` the origin `Date` is from the given `Date`
	func isHowMany(ofComponent component: Calendar.Component, from date: Date) -> Int {
		let currentCalendar = Calendar.current

		guard let start = currentCalendar.ordinality(of: component, in: .era, for: date) else { return 0 }
		guard let end = currentCalendar.ordinality(of: component, in: .era, for: self) else { return 0 }

		return end - start
	}

	/// The total distance between the origin `Date` and the given `Date`, to the specified granulatiry
	/// - Parameters:
	///   - date: The `Date` to compare to the origin `Date`
	///   - granularity: The granularity with which to compare. For example, pass `.hour` to find how many hours are between the two dates
	/// - Returns: The amount of `Calendar.Component`s between the origin `Date` and the given `Date`
	func distance(to date: Date, toGranularity granularity: Calendar.Component) -> Int {
		var distance = isHowMany(ofComponent: granularity, from: date)
		if distance < 0 {
			distance *= -1
		}
		return distance
	}

	/// Returns a `Date` object representing the current date with the given amount of components added
	/// - Parameters:
	///   - amount: The amount of the component to add
	///   - component: The type of component to add
	/// - Returns: Returns a date representing the current date with the given amount of components added
	func date(byAdding amount: Int, ofComponent component: Calendar.Component) -> Date? {
		Calendar.current.date(byAdding: component, value: amount, to: self)
	}

	/// Returns a `Date` object representing the current date with the given amount of components subtracted
	/// - Parameters:
	///   - amount: The amount of the component to subtract
	///   - component: The type of component to subtract
	/// - Returns: Returns a date representing the current date with the given amount of components subtracted
	func date(bySubtracting amount: Int, ofComponent component: Calendar.Component) -> Date? {
		self.date(byAdding: amount * -1, ofComponent: component)
	}

	/// Returns the given date with the hour set to the provided value
	///
	/// - parameter hour: The hour you would like the date to be set to
	/// - returns: A new date with the provided hour set
	func dateWithHourSet(to hour: Int) -> Date? {
		Calendar.current.date(bySetting: .hour, value: hour, of: self)
	}

	/// Returns the given date with the minute set to the provided value
	///
	/// - parameter minute: The minute you would like the date to be set to
	/// - returns: A new date with the provided minute set
	func dateWithMinuteSet(to minute: Int) -> Date? {
		Calendar.current.date(bySetting: .minute, value: minute, of: self)
	}

	/// Checks where the given date occurs on the same calendar day as the current date
	/// - Parameter dateToCompare: The date to compare to the current date
	/// - Returns: True if the two dates occur on the same calendar day
	func isSameDay(as dateToCompare: Date) -> Bool {
		Calendar.current.compare(self, to: dateToCompare, toGranularity: .day) == .orderedSame
	}
}
