//
//  TimeIntervalFormatStyle.swift
//  TimeIntervalFormatStyle
//
//  Created by Sommer Panage on 3/6/22.
//

import Foundation

extension DateComponentsFormatter.UnitsStyle: Codable {}
extension DateComponentsFormatter.ZeroFormattingBehavior: Codable, Hashable {}
extension NSCalendar.Unit: Codable, Hashable {}

public extension TimeInterval {
    struct TimeIntervalFormatStyle {

			private var allowedUnits: NSCalendar.Unit
			private var unitsStyle: DateComponentsFormatter.UnitsStyle
			private var zeroFormattingBehaviour: DateComponentsFormatter.ZeroFormattingBehavior
        
			/// Constructer to allow extensions to set formatting
			/// - Parameters:
			///   - allowedUnits: The bitmask of calendrical units such as day and month to include in the output string.
			///   - unitsStyle: The formatting style for unit names.
			///   - zeroFormattingBehaviour: The formatting style for units whose value is 0.
			init(_ allowedUnits: NSCalendar.Unit = [.hour, .minute, .second],
					 unitsStyle: DateComponentsFormatter.UnitsStyle = .abbreviated,
					 zeroFormattingBehaviour: DateComponentsFormatter.ZeroFormattingBehavior = .default) {
				self.allowedUnits = allowedUnits
				self.unitsStyle = unitsStyle
				self.zeroFormattingBehaviour = zeroFormattingBehaviour
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
			formatter.zeroFormattingBehavior = zeroFormattingBehaviour
			return formatter.string(from: value) ?? ""
    }
}
