import XCTest
@testable import TimeIntervalFormatStyle

final class TimeIntervalFormatStyleTests: XCTestCase {
    
	let formatWithMSStyle = TimeInterval.TimeIntervalFormatStyle([.hour, .minute, .second], unitsStyle: .positional, zeroFormattingBehaviour: .pad)
    func testInputZero() throws {
        XCTAssertEqual(formatWithMSStyle.format(0), "00:00:00")
    }
    
    func testInputSecondsOnly() throws {
        XCTAssertEqual(formatWithMSStyle.format(19), "00:00:19")
    }
}
