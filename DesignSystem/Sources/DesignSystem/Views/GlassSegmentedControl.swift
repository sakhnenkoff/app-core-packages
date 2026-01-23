import SwiftUI

public struct GlassSegmentedControl: View {
    let items: [String]
    @Binding var selection: String

    public init(items: [String], selection: Binding<String>) {
        self.items = items
        self._selection = selection
    }

    public var body: some View {
        if #available(iOS 26.0, *) {
            GlassEffectContainer(spacing: 0) {
                segments
            }
        } else {
            segments
        }
    }

    private var segments: some View {
        HStack(spacing: 0) {
            ForEach(items, id: \.self) { item in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selection = item
                    }
                } label: {
                    Text(item)
                        .font(.captionLarge())
                        .foregroundStyle(selection == item ? Color.themePrimary : Color.textSecondary)
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(segmentBackground(isSelected: selection == item))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(2)
        .background(Color.surfaceVariant.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: DSRadii.lg, style: .continuous))
    }

    private func segmentBackground(isSelected: Bool) -> some View {
        Group {
            if isSelected {
                RoundedRectangle(cornerRadius: DSRadii.md, style: .continuous)
                    .fill(Color.surface)
                    .glassSurface(
                        cornerRadius: DSRadii.md,
                        tint: DesignSystem.tokens.glass.strongTint,
                        borderColor: Color.border.opacity(0.7),
                        shadow: DSShadows.soft,
                        isInteractive: true
                    )
            } else {
                Color.clear
            }
        }
    }
}

#Preview("Glass Segmented") {
    GlassSegmentedControl(items: ["Daily", "Weekly", "Monthly"], selection: .constant("Daily"))
        .padding()
        .background(Color.backgroundPrimary)
}
