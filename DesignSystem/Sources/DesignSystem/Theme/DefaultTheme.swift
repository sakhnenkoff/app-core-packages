import SwiftUI

/// Default theme tuned for a minimal, Apple-like aesthetic
public struct DefaultTheme: Theme, Sendable {
    public let colors: ColorPalette
    public let typography: TypographyScale
    public let spacing: SpacingScale

    public init() {
        self.colors = ColorPalette(
            // Brand Colors (adaptive for dark mode)
            primary: .adaptivePrimary,          // Near-black (light) / Soft white (dark)
            secondary: .adaptiveSecondary,      // Charcoal (light) / Cool gray (dark)
            accent: .adaptiveAccent,            // Dark accent (light) / Light accent (dark)
            // Semantic Colors (adaptive for dark mode)
            success: .adaptiveSuccess,          // Green (light) / Green (dark)
            warning: .adaptiveWarning,          // Amber (light) / Amber (dark)
            error: .adaptiveError,              // Red (light) / Red (dark)
            info: .adaptiveInfo,                // Blue (light) / Blue (dark)
            // Background Colors
            backgroundPrimary: .adaptiveBackgroundPrimary,                         // Off-white (light) / Deep charcoal (dark)
            backgroundSecondary: .adaptiveBackgroundSecondary,                     // White (light) / Dark surface (dark)
            backgroundTertiary: .adaptiveTertiaryBackground,                       // Mist (light) / Tinted dark (dark)
            // Text Colors
            textPrimary: .adaptiveTextPrimary,                                     // Near-black (light) / Off-white (dark)
            textSecondary: .adaptiveTextSecondary,                                 // Muted gray (light) / Soft gray (dark)
            textTertiary: .adaptiveTextTertiary,                                   // Light gray (light) / Muted gray (dark)
            textOnPrimary: Color(light: .white, dark: .textPrimaryLight),           // Adaptive contrast on primary
            // Surface Colors
            surface: .adaptiveSurface,                                             // White (light) / Dark surface (dark)
            surfaceVariant: .adaptiveSurfaceVariant,                               // Tinted surface (light) / Deep surface (dark)
            border: .adaptiveBorder,                                               // Subtle border
            divider: .adaptiveDivider                                              // Divider color
        )

        self.typography = TypographyScale(
            // Titles
            titleLarge: TextStyle(size: 34, weight: .semibold),
            titleMedium: TextStyle(size: 28, weight: .semibold),
            titleSmall: TextStyle(size: 22, weight: .semibold),
            // Headlines
            headlineLarge: TextStyle(size: 20, weight: .semibold),
            headlineMedium: TextStyle(size: 17, weight: .semibold),
            headlineSmall: TextStyle(size: 15, weight: .semibold),
            // Body
            bodyLarge: TextStyle(size: 17, weight: .regular),
            bodyMedium: TextStyle(size: 15, weight: .regular),
            bodySmall: TextStyle(size: 13, weight: .regular),
            // Caption
            captionLarge: TextStyle(size: 12, weight: .regular),
            captionSmall: TextStyle(size: 11, weight: .regular),
            // Button
            buttonLarge: TextStyle(size: 17, weight: .semibold),
            buttonMedium: TextStyle(size: 15, weight: .semibold),
            buttonSmall: TextStyle(size: 13, weight: .semibold)
        )

        self.spacing = SpacingScale(
            xs: 4,
            sm: 8,
            smd: 12,
            md: 16,
            mlg: 20,
            lg: 24,
            xl: 32,
            xxlg: 40,
            xxl: 48
        )
    }
}
