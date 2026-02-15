import SwiftUI

/// Warm editorial palette with ink-blue accents and restrained highlights.
public struct EditorialGardenTheme: Theme, Sendable {
    public let tokens: DesignTokens

    public init() {
        let colors = ColorPalette(
            primary: Color(light: Color(hex: "243B6B"), dark: .skyBlue),
            secondary: Color(light: Color(hex: "33405A"), dark: .periwinkle),
            accent: Color(light: Color(hex: "B56A5D"), dark: Color(hex: "C7897D")),
            success: Color(light: Color(hex: "3F7A56"), dark: .lightSage),
            warning: Color(light: Color(hex: "A97831"), dark: .lightGold),
            error: Color(light: Color(hex: "AD4D4A"), dark: .lightCoral),
            info: Color(light: Color(hex: "365E99"), dark: .lightPowderBlue),
            backgroundPrimary: Color(light: Color(hex: "F4EEE2"), dark: .midnight),
            backgroundSecondary: Color(light: Color(hex: "F9F4EA"), dark: .midnightSecondary),
            backgroundTertiary: Color(light: Color(hex: "EEE4D4"), dark: .paleMint),
            textPrimary: Color(light: Color(hex: "1F1C18"), dark: .textPrimaryDark),
            textSecondary: Color(light: Color(hex: "5C5247"), dark: .textSecondaryDark),
            textTertiary: Color(light: Color(hex: "87796A"), dark: .textTertiaryDark),
            textOnPrimary: Color(light: .white, dark: .textPrimaryLight),
            surface: Color(light: Color(hex: "F9F3E8"), dark: .surfaceDark),
            surfaceVariant: Color(light: Color(hex: "EDE2CF"), dark: .surfaceVariantDark),
            border: Color(light: Color(hex: "D6C8B1"), dark: .borderDark),
            divider: Color(light: Color(hex: "CCBCA3"), dark: .dividerDark)
        )

        let typography = ThemeFactory.hybridTypography(
            titleDesign: .serif,
            headlineDesign: .serif,
            bodyDesign: .default
        )

        let radii = RadiiScale(
            xs: 7,
            sm: 11,
            md: 16,
            lg: 22,
            xl: 32,
            pill: 999
        )

        let shadows = ShadowScale(
            soft: ShadowToken(color: Color.black.opacity(0.05), radius: 8, y: 3),
            card: ShadowToken(color: Color.black.opacity(0.09), radius: 14, y: 6),
            lifted: ShadowToken(color: Color.black.opacity(0.14), radius: 20, y: 10)
        )

        let glass = GlassTokens(
            tint: colors.surfaceVariant.opacity(0.12),
            strongTint: colors.surfaceVariant.opacity(0.18),
            border: colors.border.opacity(0.45),
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
