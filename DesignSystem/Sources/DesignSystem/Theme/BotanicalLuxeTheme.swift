import SwiftUI

/// Soft stone and fog-green neutrals with deep botanical accents.
public struct BotanicalLuxeTheme: Theme, Sendable {
    public let tokens: DesignTokens

    public init() {
        let colors = ColorPalette(
            primary: Color(light: Color(hex: "1F4C57"), dark: Color(hex: "7CB4C0")),
            secondary: Color(light: Color(hex: "273E43"), dark: Color(hex: "BFD0CC")),
            accent: Color(light: Color(hex: "B8743E"), dark: Color(hex: "D09B6D")),
            success: Color(light: Color(hex: "3E7F5B"), dark: .lightSage),
            warning: Color(light: Color(hex: "A9772F"), dark: .lightGold),
            error: Color(light: Color(hex: "A84C4C"), dark: .lightCoral),
            info: Color(light: Color(hex: "2D6E8A"), dark: .lightPowderBlue),
            backgroundPrimary: Color(light: Color(hex: "ECEBE4"), dark: .midnight),
            backgroundSecondary: Color(light: Color(hex: "F4F3ED"), dark: .midnightSecondary),
            backgroundTertiary: Color(light: Color(hex: "DFE5DD"), dark: .paleMint),
            textPrimary: Color(light: Color(hex: "1A2322"), dark: .textPrimaryDark),
            textSecondary: Color(light: Color(hex: "4A5754"), dark: .textSecondaryDark),
            textTertiary: Color(light: Color(hex: "74817B"), dark: .textTertiaryDark),
            textOnPrimary: Color(light: .white, dark: .textPrimaryLight),
            surface: Color(light: Color(hex: "F5F4EF"), dark: .surfaceDark),
            surfaceVariant: Color(light: Color(hex: "E5E8DE"), dark: .surfaceVariantDark),
            border: Color(light: Color(hex: "C9CFBF"), dark: .borderDark),
            divider: Color(light: Color(hex: "BCC4B2"), dark: .dividerDark)
        )

        let typography = ThemeFactory.hybridTypography(
            titleDesign: .default,
            headlineDesign: .rounded,
            bodyDesign: .default
        )

        let radii = RadiiScale(
            xs: 8,
            sm: 14,
            md: 20,
            lg: 28,
            xl: 36,
            pill: 999
        )

        let shadows = ShadowScale(
            soft: ShadowToken(color: Color.black.opacity(0.045), radius: 8, y: 3),
            card: ShadowToken(color: Color.black.opacity(0.085), radius: 15, y: 6),
            lifted: ShadowToken(color: Color.black.opacity(0.12), radius: 22, y: 11)
        )

        let glass = GlassTokens(
            tint: colors.surfaceVariant.opacity(0.1),
            strongTint: colors.surfaceVariant.opacity(0.16),
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
