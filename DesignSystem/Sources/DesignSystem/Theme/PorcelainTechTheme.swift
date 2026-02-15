import SwiftUI

/// Porcelain neutral base with indigo and mineral-teal accents.
public struct PorcelainTechTheme: Theme, Sendable {
    public let tokens: DesignTokens

    public init() {
        let colors = ColorPalette(
            primary: Color(light: Color(hex: "3A3FD4"), dark: .skyBlue),
            secondary: Color(light: Color(hex: "2A324C"), dark: .periwinkle),
            accent: Color(light: Color(hex: "2B8A8B"), dark: Color(hex: "5AB5B8")),
            success: Color(light: Color(hex: "2F8A67"), dark: .lightSage),
            warning: Color(light: Color(hex: "B9873D"), dark: .lightGold),
            error: Color(light: Color(hex: "B55353"), dark: .lightCoral),
            info: Color(light: Color(hex: "2F72D8"), dark: .lightPowderBlue),
            backgroundPrimary: Color(light: Color(hex: "F2F5F8"), dark: .midnight),
            backgroundSecondary: Color(light: Color(hex: "F7FAFC"), dark: .midnightSecondary),
            backgroundTertiary: Color(light: Color(hex: "E7EDF5"), dark: .paleMint),
            textPrimary: Color(light: Color(hex: "18202C"), dark: .textPrimaryDark),
            textSecondary: Color(light: Color(hex: "4D5C6F"), dark: .textSecondaryDark),
            textTertiary: Color(light: Color(hex: "78879A"), dark: .textTertiaryDark),
            textOnPrimary: Color(light: .white, dark: .textPrimaryLight),
            surface: Color(light: Color(hex: "F9FBFE"), dark: .surfaceDark),
            surfaceVariant: Color(light: Color(hex: "EAF0F7"), dark: .surfaceVariantDark),
            border: Color(light: Color(hex: "CDD9E7"), dark: .borderDark),
            divider: Color(light: Color(hex: "C3D0E0"), dark: .dividerDark)
        )

        let typography = ThemeFactory.hybridTypography(
            titleDesign: .rounded,
            headlineDesign: .rounded,
            bodyDesign: .default,
            bodyWeight: .medium
        )

        let radii = RadiiScale(
            xs: 6,
            sm: 10,
            md: 14,
            lg: 18,
            xl: 26,
            pill: 999
        )

        let shadows = ShadowScale(
            soft: ShadowToken(color: Color.black.opacity(0.05), radius: 7, y: 3),
            card: ShadowToken(color: Color.black.opacity(0.09), radius: 12, y: 5),
            lifted: ShadowToken(color: Color.black.opacity(0.13), radius: 18, y: 9)
        )

        let glass = GlassTokens(
            tint: colors.surfaceVariant.opacity(0.1),
            strongTint: colors.surfaceVariant.opacity(0.16),
            border: colors.border.opacity(0.5),
            shadow: ShadowToken(color: Color.black.opacity(0.08), radius: 10, y: 4)
        )

        self.tokens = DesignTokens(
            colors: colors,
            typography: typography,
            spacing: ThemeFactory.spacing(),
            radii: radii,
            shadows: shadows,
            glass: glass,
            layout: ThemeFactory.layout()
        )
    }
}
