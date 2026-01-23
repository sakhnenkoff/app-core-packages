import SwiftUI

/// A compact list row with optional leading icon and trailing accessory.
public struct DSListRow: View {
    let title: String
    let subtitle: String?
    let leadingIcon: String?
    let leadingTint: Color
    let trailingText: String?
    let trailingIcon: String?
    let showsDisclosure: Bool
    let minHeight: CGFloat
    let action: (() -> Void)?

    public init(
        title: String,
        subtitle: String? = nil,
        leadingIcon: String? = nil,
        leadingTint: Color = Color.textPrimary,
        trailingText: String? = nil,
        trailingIcon: String? = nil,
        showsDisclosure: Bool = false,
        minHeight: CGFloat = 52,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leadingIcon = leadingIcon
        self.leadingTint = leadingTint
        self.trailingText = trailingText
        self.trailingIcon = trailingIcon
        self.showsDisclosure = showsDisclosure
        self.minHeight = minHeight
        self.action = action
    }

    public var body: some View {
        let rowContent = HStack(spacing: DSSpacing.smd) {
            if let leadingIcon {
                DSIconBadge(
                    systemName: leadingIcon,
                    size: 28,
                    cornerRadius: 9,
                    backgroundColor: leadingTint.opacity(0.12),
                    foregroundColor: leadingTint,
                    font: .headlineSmall()
                )
            }

            VStack(alignment: .leading, spacing: DSSpacing.xs) {
                Text(title)
                    .font(.bodyMedium())
                    .foregroundStyle(Color.textPrimary)

                if let subtitle {
                    Text(subtitle)
                        .font(.captionLarge())
                        .foregroundStyle(Color.textSecondary)
                }
            }

            Spacer(minLength: DSSpacing.sm)

            if let trailingText {
                Text(trailingText)
                    .font(.captionLarge())
                    .foregroundStyle(Color.textTertiary)
            }

            if let trailingIcon {
                Image(systemName: trailingIcon)
                    .font(.captionLarge())
                    .foregroundStyle(Color.textTertiary)
            } else if showsDisclosure {
                Image(systemName: "chevron.right")
                    .font(.captionLarge())
                    .foregroundStyle(Color.textTertiary)
            }
        }
        .padding(.horizontal, DSSpacing.md)
        .padding(.vertical, DSSpacing.smd)
        .frame(minHeight: minHeight)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())

        if let action {
            Button(action: action) {
                rowContent
            }
            .buttonStyle(.plain)
        } else {
            rowContent
        }
    }
}

#Preview("Rows") {
    VStack(spacing: 0) {
        DSListRow(
            title: "Onboarding",
            subtitle: "Complete setup",
            leadingIcon: "sparkles",
            leadingTint: .info,
            trailingText: "2/3",
            showsDisclosure: true
        )
        Divider()
        DSListRow(
            title: "Subscription",
            subtitle: "Preview the paywall",
            leadingIcon: "creditcard.fill",
            leadingTint: .success,
            showsDisclosure: true
        )
    }
    .background(Color.surface)
    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    .padding()
    .background(Color.backgroundPrimary)
}
