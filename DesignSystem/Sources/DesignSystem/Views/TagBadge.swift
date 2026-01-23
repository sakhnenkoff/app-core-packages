import SwiftUI

public struct TagBadge: View {
    let text: String
    let tint: Color

    public init(text: String, tint: Color = Color.themePrimary) {
        self.text = text
        self.tint = tint
    }

    public var body: some View {
        Text(text)
            .font(.captionSmall())
            .foregroundStyle(tint)
            .padding(.horizontal, DSSpacing.sm)
            .padding(.vertical, DSSpacing.xs)
            .background(
                Capsule()
                    .fill(tint.opacity(0.08))
            )
            .overlay(
                Capsule()
                    .stroke(tint.opacity(0.2), lineWidth: 1)
            )
    }
}

#Preview("Tag Badge") {
    TagBadge(text: "Featured")
        .padding()
        .background(Color.backgroundPrimary)
}
