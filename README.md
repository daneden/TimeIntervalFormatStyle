# TimeIntervalFormatStyle

Simple FormatStyle conformace for TimeInterval, with format configurations passed to `DateComponentsFormatter`

## Usage in SwiftUI

```Swift

struct TimeIntervalText: View {
	var duration: TimeInterval
	
	var body: some View {
		Text("Duration: \(duration.formatted(.timeInterval([.hour, .minute, .second], unitsStyle: .spellout)))")
	}
}

```
