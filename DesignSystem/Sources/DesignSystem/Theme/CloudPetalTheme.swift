import SwiftUI

/// Soft pastel palette with sky-periwinkle accents and airy lavender backgrounds.
public struct CloudPetalTheme: Theme, Sendable {
    public let tokens: DesignTokens

    public init() {
        let colors = ColorPalette(
            primary: Color(light: Color(hex: "7B8CDE"), dark: Color(hex: "A8B4F0")),
            secondary: Color(light: Color(hex: "6A7BC8"), dark: Color(hex: "95A3E5")),
            accent: Color(light: Color(hex: "C890B5"), dark: Color(hex: "E0AACD")),
            success: Color(light: Color(hex: "6BAF7D"), dark: Color(hex: "8ED4A0")),
            warning: Color(light: Color(hex: "C9A84E"), dark: Color(hex: "E5CA7A")),
            error: Color(light: Color(hex: "D07070"), dark: Color(hex: "EFA0A0")),
            info: Color(light: Color(hex: "72A0CE"), dark: Color(hex: "A0C5E5")),
            backgroundPrimary: Color(light: Color(hex: "F7F6FB"), dark: Color(hex: "121318")),
            backgroundSecondary: Color(light: Color(hex: "FCFBFE"), dark: Color(hex: "181924")),
            backgroundTertiary: Color(light: Color(hex: "EEEAF5"), dark: Color(hex: "1F2033")),
            textPrimary: Color(light: Color(hex: "1C1B2A"), dark: Color(hex: "EEEDF8")),
            textSecondary: Color(light: Color(hex: "5D5B72"), dark: Color(hex: "B5B2CC")),
            textTertiary: Color(light: Color(hex: "8C89A5"), dark: Color(hex: "8582A0")),
            textOnPrimary: Color(light: .white, dark: Color(hex: "1C1B2A")),
            surface: Color(light: Color(hex: "FDFCFF"), dark: Color(hex: "1C1D2C")),
            surfaceVariant: Color(light: Color(hex: "F0EDF8"), dark: Color(hex: "262840")),
            border: Color(light: Color(hex: "D8D3E8"), dark: Color(hex: "33354F")),
            divider: Color(light: Color(hex: "CEC8E0"), dark: Color(hex: "3C3E58"))
        )

        let typography = ThemeFactory.hybridTypography(
            titleDesign: .default,
            headlineDesign: .default,
            bodyDesign: .default
        )

        let radii = RadiiScale(
            xs: 10,
            sm: 14,
            md: 18,
            lg: 24,
            xl: 32,
            pill: 999
        )

        let shadows = ShadowScale(
            soft: ShadowToken(color: Color(hex: "7B8CDE").opacity(0.06), radius: 8, y: 3),
            card: ShadowToken(color: Color(hex: "7B8CDE").opacity(0.10), radius: 14, y: 6),
            lifted: ShadowToken(color: Color(hex: "7B8CDE").opacity(0.14), radius: 20, y: 10)
        )

        let glass = GlassTokens(
            tint: colors.surfaceVariant.opacity(0.14),
            strongTint: colors.surfaceVariant.opacity(0.20),
            border: colors.border.opacity(0.5),
            shadow: ShadowToken(color: Color(hex: "7B8CDE").opacity(0.08), radius: 10, y: 4)
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
