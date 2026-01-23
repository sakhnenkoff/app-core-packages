import SwiftUI

public struct TimePill: View {
    let title: String
    let isHighlighted: Bool
    let usesGlass: Bool

    public init(
        title: String,
        isHighlighted: Bool = true,
        usesGlass: Bool = false
    ) {
        self.title = title
        self.isHighlighted = isHighlighted
        self.usesGlass = usesGlass
    }

    public var body: some View {
        PickerPill(title: title, isHighlighted: isHighlighted, usesGlass: usesGlass)
    }
}

#Preview("Time Pill") {
    VStack(spacing: DSSpacing.md) {
        TimePill(title: "17:00")
        TimePill(title: "08:30", isHighlighted: false)
        TimePill(title: "11:15", usesGlass: true)
    }
    .padding()
    .background(Color.backgroundPrimary)
}
