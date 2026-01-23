import SwiftUI

public struct CardSurfaceModifier: ViewModifier {
    let cornerRadius: CGFloat
    let tint: Color
    let usesGlass: Bool
    let isInteractive: Bool
    let borderColor: Color
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowYOffset: CGFloat

    public init(
        cornerRadius: CGFloat = 16,
        tint: Color = Color.textPrimary.opacity(0.02),
        usesGlass: Bool = false,
        isInteractive: Bool = false,
        borderColor: Color = Color.border,
        shadowColor: Color = Color.black.opacity(0.05),
        shadowRadius: CGFloat = 6,
        shadowYOffset: CGFloat = 3
    ) {
        self.cornerRadius = cornerRadius
        self.tint = tint
        self.usesGlass = usesGlass
        self.isInteractive = isInteractive
        self.borderColor = borderColor
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowYOffset = shadowYOffset
    }

    public func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)

        if #available(iOS 26.0, *), usesGlass {
            let glass = Glass.regular.tint(tint)
            let finalGlass = isInteractive ? glass.interactive() : glass

            content
                .glassEffect(finalGlass, in: .rect(cornerRadius: cornerRadius))
                .overlay(shape.stroke(borderColor, lineWidth: 1))
                .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowYOffset)
        } else {
            content
                .background(shape.fill(Color.surface))
                .background(shape.fill(tint))
                .overlay(shape.stroke(borderColor, lineWidth: 1))
                .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowYOffset)
        }
    }
}

public extension View {
    func cardSurface(
        cornerRadius: CGFloat = 16,
        tint: Color = Color.textPrimary.opacity(0.02),
        usesGlass: Bool = false,
        isInteractive: Bool = false,
        borderColor: Color = Color.border,
        shadowColor: Color = Color.black.opacity(0.05),
        shadowRadius: CGFloat = 6,
        shadowYOffset: CGFloat = 3
    ) -> some View {
        modifier(
            CardSurfaceModifier(
                cornerRadius: cornerRadius,
                tint: tint,
                usesGlass: usesGlass,
                isInteractive: isInteractive,
                borderColor: borderColor,
                shadowColor: shadowColor,
                shadowRadius: shadowRadius,
                shadowYOffset: shadowYOffset
            )
        )
    }
}
