import SwiftUI

/// Minimal neutral palette with an Apple-like feel
public extension Color {

    // MARK: - Light Mode Brand Colors

    /// Primary brand (near black)
    static let yaleBlue = Color(hex: "111111")

    /// Secondary brand (deep charcoal)
    static let oxfordNavy = Color(hex: "1F2937")

    /// Brand accent (charcoal)
    static let prussianBlue = Color(hex: "2B2B2B")

    /// Info (blue)
    static let powderBlue = Color(hex: "2563EB")

    /// Tertiary background (soft mist)
    static let mintCream = Color(hex: "F2F2F4")

    /// Neutral surface background
    static let cloudWhite = Color(hex: "FFFFFF")

    /// Off-white primary background
    static let canvasWhite = Color(hex: "F7F7F7")

    /// Subtle surface tint
    static let surfaceTint = Color(hex: "F2F3F5")

    /// Soft border
    static let borderLight = Color(hex: "E5E7EB")

    /// Divider gray
    static let dividerLight = Color(hex: "E2E4E8")

    /// Primary text
    static let textPrimaryLight = Color(hex: "111111")

    /// Secondary text
    static let textSecondaryLight = Color(hex: "6B7280")

    /// Tertiary text
    static let textTertiaryLight = Color(hex: "9CA3AF")

    /// Success green
    static let sageGreen = Color(hex: "16A34A")

    /// Warning amber
    static let goldenrod = Color(hex: "F59E0B")

    /// Error red
    static let coralRed = Color(hex: "EF4444")

    // MARK: - Dark Mode Brand Colors (Lighter Variants)

    /// Primary for dark mode
    static let skyBlue = Color(hex: "EDEDED")

    /// Secondary for dark mode
    static let periwinkle = Color(hex: "C4CAD3")

    /// Accent for dark mode
    static let steelBlue = Color(hex: "DADADA")

    /// Info for dark mode
    static let lightPowderBlue = Color(hex: "60A5FA")

    /// Tertiary background for dark mode
    static let paleMint = Color(hex: "141419")

    /// Dark primary background
    static let midnight = Color(hex: "0B0C0E")

    /// Dark secondary background
    static let midnightSecondary = Color(hex: "111317")

    /// Dark surface
    static let surfaceDark = Color(hex: "121418")

    /// Dark surface variant
    static let surfaceVariantDark = Color(hex: "1A1C21")

    /// Dark border
    static let borderDark = Color(hex: "242730")

    /// Dark divider
    static let dividerDark = Color(hex: "1E2128")

    /// Primary text (dark)
    static let textPrimaryDark = Color(hex: "F5F5F7")

    /// Secondary text (dark)
    static let textSecondaryDark = Color(hex: "C7CBD1")

    /// Tertiary text (dark)
    static let textTertiaryDark = Color(hex: "8A9099")

    /// Success green (dark)
    static let lightSage = Color(hex: "4ADE80")

    /// Warning amber (dark)
    static let lightGold = Color(hex: "FBBF24")

    /// Error red (dark)
    static let lightCoral = Color(hex: "F87171")

    // MARK: - Adaptive Colors (Auto-switch based on color scheme)

    /// Adaptive primary color - mint (light) / bright mint (dark)
    public static var adaptivePrimary: Color {
        Color(light: .yaleBlue, dark: .skyBlue)
    }

    /// Adaptive secondary color - ink (light) / soft slate (dark)
    public static var adaptiveSecondary: Color {
        Color(light: .oxfordNavy, dark: .periwinkle)
    }

    /// Adaptive accent color - teal (light) / mint (dark)
    public static var adaptiveAccent: Color {
        Color(light: .prussianBlue, dark: .steelBlue)
    }

    /// Adaptive info color - sky (light) / sky (dark)
    public static var adaptiveInfo: Color {
        Color(light: .powderBlue, dark: .lightPowderBlue)
    }

    /// Adaptive success color - green (light) / green (dark)
    public static var adaptiveSuccess: Color {
        Color(light: .sageGreen, dark: .lightSage)
    }

    /// Adaptive warning color - amber (light) / amber (dark)
    public static var adaptiveWarning: Color {
        Color(light: .goldenrod, dark: .lightGold)
    }

    /// Adaptive error color - red (light) / red (dark)
    public static var adaptiveError: Color {
        Color(light: .coralRed, dark: .lightCoral)
    }

    /// Adaptive primary background - off-white (light) / midnight (dark)
    public static var adaptiveBackgroundPrimary: Color {
        Color(light: .canvasWhite, dark: .midnight)
    }

    /// Adaptive secondary background - white (light) / midnight secondary (dark)
    public static var adaptiveBackgroundSecondary: Color {
        Color(light: .cloudWhite, dark: .midnightSecondary)
    }

    /// Adaptive tertiary background - mist (light) / deep slate (dark)
    public static var adaptiveTertiaryBackground: Color {
        Color(light: .mintCream, dark: .paleMint)
    }

    /// Adaptive surface - white (light) / dark surface (dark)
    public static var adaptiveSurface: Color {
        Color(light: .cloudWhite, dark: .surfaceDark)
    }

    /// Adaptive surface variant - tinted surface (light) / deep surface (dark)
    public static var adaptiveSurfaceVariant: Color {
        Color(light: .surfaceTint, dark: .surfaceVariantDark)
    }

    /// Adaptive border color
    public static var adaptiveBorder: Color {
        Color(light: .borderLight, dark: .borderDark)
    }

    /// Adaptive divider color
    public static var adaptiveDivider: Color {
        Color(light: .dividerLight, dark: .dividerDark)
    }

    /// Adaptive primary text color
    public static var adaptiveTextPrimary: Color {
        Color(light: .textPrimaryLight, dark: .textPrimaryDark)
    }

    /// Adaptive secondary text color
    public static var adaptiveTextSecondary: Color {
        Color(light: .textSecondaryLight, dark: .textSecondaryDark)
    }

    /// Adaptive tertiary text color
    public static var adaptiveTextTertiary: Color {
        Color(light: .textTertiaryLight, dark: .textTertiaryDark)
    }
}

// MARK: - Color Helper Extension

extension Color {
    /// Creates an adaptive color that changes based on light/dark mode
    init(light: Color, dark: Color) {
        self.init(uiColor: UIColor(dynamicProvider: { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        }))
    }
}
