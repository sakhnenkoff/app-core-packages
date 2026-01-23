import SwiftUI

/// Sketch-style icon wrapper for consistent weight and rounding.
public struct SketchIcon: View {
    let systemName: String
    let size: CGFloat
    let color: Color

    public init(
        systemName: String,
        size: CGFloat = 20,
        color: Color = Color.themePrimary
    ) {
        self.systemName = systemName
        self.size = size
        self.color = color
    }

    public var body: some View {
        Image(systemName: systemName)
            .symbolRenderingMode(.monochrome)
            .font(.system(size: size, weight: .regular, design: .monospaced))
            .foregroundStyle(color)
    }
}

#Preview("Sketch Icon") {
    SketchIcon(systemName: "house")
        .padding()
        .background(Color.backgroundPrimary)
}
