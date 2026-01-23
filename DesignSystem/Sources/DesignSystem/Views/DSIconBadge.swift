import SwiftUI

/// A small icon badge used for feature rows and compact callouts.
public struct DSIconBadge: View {
    let systemName: String
    let size: CGFloat
    let cornerRadius: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font

    public init(
        systemName: String,
        size: CGFloat = 32,
        cornerRadius: CGFloat = 10,
        backgroundColor: Color = Color.textPrimary.opacity(0.08),
        foregroundColor: Color = Color.textPrimary,
        font: Font = .headlineSmall()
    ) {
        self.systemName = systemName
        self.size = size
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.font = font
    }

    public var body: some View {
        Image(systemName: systemName)
            .font(font)
            .foregroundStyle(foregroundColor)
            .frame(width: size, height: size)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(backgroundColor)
            )
    }
}

#Preview("Default") {
    DSIconBadge(systemName: "sparkles")
        .padding()
        .background(Color.backgroundPrimary)
}

#Preview("Warning") {
    DSIconBadge(
        systemName: "exclamationmark.triangle.fill",
        backgroundColor: Color.warning.opacity(0.15),
        foregroundColor: Color.warning
    )
    .padding()
    .background(Color.backgroundPrimary)
}
