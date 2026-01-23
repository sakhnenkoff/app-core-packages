import SwiftUI

public struct GlassToggle: View {
    @Binding var isOn: Bool
    let onTint: Color
    let offTint: Color

    public init(
        isOn: Binding<Bool>,
        onTint: Color = Color.themePrimary,
        offTint: Color = Color.surfaceVariant
    ) {
        self._isOn = isOn
        self.onTint = onTint
        self.offTint = offTint
    }

    public var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                isOn.toggle()
            }
        } label: {
            ZStack(alignment: isOn ? .trailing : .leading) {
                Capsule()
                    .fill(isOn ? onTint.opacity(0.22) : offTint.opacity(0.8))
                    .glassSurface(
                        cornerRadius: DSRadii.pill,
                        tint: isOn ? onTint.opacity(0.18) : DesignSystem.tokens.glass.tint,
                        borderColor: Color.border,
                        shadow: DSShadows.soft,
                        isInteractive: true
                    )

                Circle()
                    .fill(Color.surface)
                    .overlay(
                        Circle().stroke(Color.border, lineWidth: 1)
                    )
                    .frame(width: 24, height: 24)
                    .padding(3)
            }
            .frame(width: 52, height: 32)
        }
        .buttonStyle(.plain)
        .accessibilityValue(isOn ? "On" : "Off")
    }
}

#Preview("Glass Toggle") {
    VStack(spacing: DSSpacing.md) {
        GlassToggle(isOn: .constant(true))
        GlassToggle(isOn: .constant(false))
    }
    .padding()
    .background(Color.backgroundPrimary)
}
