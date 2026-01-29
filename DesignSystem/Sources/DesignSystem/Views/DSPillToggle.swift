import SwiftUI

/// A custom boolean toggle with two side-by-side pills.
///
/// On state (left pill) displays a filled icon, off state (right pill) displays a dot indicator.
/// Both pills are contained in a single rounded container with a subtle border.
public struct DSPillToggle: View {
    @Binding var isOn: Bool
    let icon: String
    let usesGlass: Bool
    let accessibilityLabel: String?

    public init(
        isOn: Binding<Bool>,
        icon: String = "leaf",
        usesGlass: Bool = true,
        accessibilityLabel: String? = nil
    ) {
        self._isOn = isOn
        self.icon = icon
        self.usesGlass = usesGlass
        self.accessibilityLabel = accessibilityLabel
    }

    public var body: some View {
        let pillSize: CGFloat = 52
        let iconSize: CGFloat = 20
        let dotSize: CGFloat = 8
        let padding = DSSpacing.xs
        let shape = RoundedRectangle(cornerRadius: DSRadii.lg, style: .continuous)

        let content = HStack(spacing: 0) {
            // On pill (icon)
            Button {
                guard !isOn else { return }
                withAnimation(.spring(duration: 0.3, bounce: 0.15)) { isOn = true }
            } label: {
                Image(systemName: icon)
                    .font(.system(size: iconSize, weight: .medium))
                    .foregroundStyle(isOn ? Color.textOnPrimary : Color.textTertiary)
                    .frame(width: pillSize, height: pillSize)
                    .background(
                        RoundedRectangle(cornerRadius: DSRadii.sm)
                            .fill(isOn ? Color.themePrimary : Color.clear)
                    )
            }
            .buttonStyle(.plain)
            .accessibilityHidden(true)

            // Off pill (dot)
            Button {
                guard isOn else { return }
                withAnimation(.spring(duration: 0.3, bounce: 0.15)) { isOn = false }
            } label: {
                Circle()
                    .fill(!isOn ? Color.themePrimary : Color.textTertiary)
                    .frame(width: dotSize, height: dotSize)
                    .frame(width: pillSize, height: pillSize)
                    .background(
                        RoundedRectangle(cornerRadius: DSRadii.sm)
                            .fill(!isOn ? Color.surfaceVariant : Color.clear)
                    )
            }
            .buttonStyle(.plain)
            .accessibilityHidden(true)
        }
        .padding(padding)
        .background(shape.fill(usesGlass ? Color.clear : Color.surface))

        let styled = Group {
            if usesGlass {
                content.glassSurface(
                    cornerRadius: DSRadii.lg,
                    tint: DesignSystem.tokens.glass.tint,
                    borderColor: Color.border,
                    shadow: DSShadows.soft,
                    isInteractive: true
                )
            } else {
                content.overlay(
                    shape.stroke(Color.border, lineWidth: 1)
                )
            }
        }

        return styled
            .animation(.spring(duration: 0.3, bounce: 0.15), value: isOn)
            .sensoryFeedback(.selection, trigger: isOn)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(resolvedAccessibilityLabel)
            .accessibilityValue(isOn ? "On" : "Off")
            .accessibilityAddTraits(.isButton)
            .accessibilityAction { isOn.toggle() }
    }

    private var resolvedAccessibilityLabel: String {
        if let accessibilityLabel {
            return accessibilityLabel
        }

        var label = icon
        if label.hasSuffix(".fill") {
            label = String(label.dropLast(5))
        }
        label = label.replacingOccurrences(of: ".", with: " ")
        return label.capitalized
    }
}

#Preview("DSPillToggle") {
    struct PreviewWrapper: View {
        @State private var isOn = true

        var body: some View {
            VStack(spacing: DSSpacing.md) {
                DSPillToggle(isOn: $isOn, icon: "leaf.fill", accessibilityLabel: "Environment mode")
                DSPillToggle(isOn: .constant(false), icon: "bell.fill")
                DSPillToggle(isOn: .constant(true), icon: "heart.fill")
            }
            .padding()
            .background(Color.backgroundPrimary)
        }
    }

    return PreviewWrapper()
}
