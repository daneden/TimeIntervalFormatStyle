import XCTest
@testable import TimeIntervalFormatStyle

final class TimeIntervalFormatStyleTests: XCTestCase {
    
	let formatWithMSStyle = TimeInterval.TimeIntervalFormatStyle([.hour, .minute, .second], unitsStyle: .abbreviated)
    func testInputZero() throws {
        XCTAssertEqual(formatWithMSStyle.format(0), "0s")
    }
    
    func testInputSecondsOnly() throws {
        XCTAssertEqual(formatWithMSStyle.format(19), "19s")
    }
}
