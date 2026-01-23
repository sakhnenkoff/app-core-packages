import SwiftUI

public struct AmbientBackground: View {
    private let intensity: CGFloat

    public init(intensity: CGFloat = 0.08) {
        self.intensity = intensity
    }

    public var body: some View {
        ZStack {
            Color.backgroundPrimary

            RadialGradient(
                colors: [
                    Color.surfaceVariant.opacity(intensity),
                    Color.clear
                ],
                center: .topLeading,
                startRadius: 0,
                endRadius: 240
            )

            RadialGradient(
                colors: [
                    Color.surfaceVariant.opacity(intensity * 0.7),
                    Color.clear
                ],
                center: .bottomTrailing,
                startRadius: 0,
                endRadius: 260
            )

            LinearGradient(
                colors: [
                    Color.backgroundTertiary.opacity(intensity * 0.5),
                    Color.clear
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .ignoresSafeArea()
    }
}

public extension View {
    func ambientBackground(intensity: CGFloat = 0.12) -> some View {
        background(AmbientBackground(intensity: intensity))
    }
}
