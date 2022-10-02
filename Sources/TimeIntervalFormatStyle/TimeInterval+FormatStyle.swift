//
//  TimeInterval+ParseableFormatStyle.swift
//  TimeIntervalFormatStyle
//
//  Created by Sommer Panage on 3/4/22.
//

import Foundation

public extension TimeInterval {
    
    /// Get a formatted string from a format style
    /// - Parameter formatStyle: Time Interval Format Style
    /// - Returns: Formatted string
    func formatted(_ formatStyle: TimeIntervalFormatStyle) -> String {
        formatStyle.format(self)
    }
}

public extension FormatStyle where Self == TimeInterval.TimeIntervalFormatStyle {
    
	/// Format the given string as a time interval in the format 7:54:33.632 or similar
	/// - Parameters:
	///   - allowedUnits: The bitmask of calendrical units such as day and month to include in the output string.
	///   - unitsStyle: The formatting style for unit names.
	///   - zeroFormattingBehaviour: The formatting style for units whose value is 0.
	static func timeInterval(allowedUnits: NSCalendar.Unit,
													 unitsStyle: DateComponentsFormatter.UnitsStyle,
													 zeroFormattingBehaviour: DateComponentsFormatter.ZeroFormattingBehavior = .default) -> TimeInterval.TimeIntervalFormatStyle {
		TimeInterval.TimeIntervalFormatStyle(allowedUnits, unitsStyle: unitsStyle)
	}
    
}
