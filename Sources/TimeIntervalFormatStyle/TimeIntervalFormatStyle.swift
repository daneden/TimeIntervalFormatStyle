//
//  TimeIntervalFormatStyle.swift
//  TimeIntervalFormatStyle
//
//  Created by Sommer Panage on 3/6/22.
//

import Foundation

extension DateComponentsFormatter.UnitsStyle: Codable {}
extension NSCalendar.Unit: Codable, Hashable {}

public extension TimeInterval {
    struct TimeIntervalFormatStyle {

			private var allowedUnits: NSCalendar.Unit
			private var unitsStyle: DateComponentsFormatter.UnitsStyle
        
			/// Constructer to allow extensions to set formatting
			/// - Parameter showMilliseconds: Shows millieconds. Ex: 1:03:44:789 . Default == `false`
			init(_ allowedUnits: NSCalendar.Unit = [.hour, .minute, .second], unitsStyle: DateComponentsFormatter.UnitsStyle = .abbreviated) {
				self.allowedUnits = allowedUnits
				self.unitsStyle = unitsStyle
			}
    }
}

extension TimeInterval.TimeIntervalFormatStyle: FormatStyle {
    /// Returns a string based on an input time interval. String format may include milliseconds or not
    /// Example: "2:33:29.632" aka 2 hours, 33 minutes, 29.632 seconds
    public func format(_ value: TimeInterval) -> String {
			let formatter = DateComponentsFormatter()
			formatter.allowedUnits = allowedUnits
			formatter.unitsStyle = unitsStyle
			return formatter.string(from: value) ?? ""
    }
}
