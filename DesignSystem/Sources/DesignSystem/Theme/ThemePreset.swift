import SwiftUI

public enum ThemePreset: String, CaseIterable, Sendable {
    case defaultTheme
    case editorialGarden
    case porcelainTech
    case botanicalLuxe

    public var displayName: String {
        switch self {
        case .defaultTheme:
            "Default"
        case .editorialGarden:
            "Editorial Garden"
        case .porcelainTech:
            "Porcelain Tech"
        case .botanicalLuxe:
            "Botanical Luxe"
        }
    }

    public func makeTheme() -> any Theme {
        switch self {
        case .defaultTheme:
            DefaultTheme()
        case .editorialGarden:
            EditorialGardenTheme()
        case .porcelainTech:
            PorcelainTechTheme()
        case .botanicalLuxe:
            BotanicalLuxeTheme()
        }
    }
}
