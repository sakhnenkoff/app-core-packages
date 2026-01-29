import SwiftUI

/// A pill that displays a time value.
///
/// Supports two modes:
/// - Static: Display-only with a title string
/// - Interactive: Tappable with time picker sheet
public struct TimePill: View {
    private enum Mode {
        case staticTitle(String)
        case interactive(Binding<Date>)
    }

    private let mode: Mode
    let isHighlighted: Bool
    let usesGlass: Bool
    let accessibilityLabel: String?
    @State private var isShowingPicker = false

    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()

    /// Creates a static time pill for display only.
    public init(
        title: String,
        isHighlighted: Bool = true,
        usesGlass: Bool = false,
        accessibilityLabel: String? = nil
    ) {
        self.mode = .staticTitle(title)
        self.isHighlighted = isHighlighted
        self.usesGlass = usesGlass
        self.accessibilityLabel = accessibilityLabel
    }

    /// Creates an interactive time pill with time picker.
    public init(
        time: Binding<Date>,
        isHighlighted: Bool = true,
        usesGlass: Bool = false,
        accessibilityLabel: String? = nil
    ) {
        self.mode = .interactive(time)
        self.isHighlighted = isHighlighted
        self.usesGlass = usesGlass
        self.accessibilityLabel = accessibilityLabel
    }

    private var displayTitle: String {
        switch mode {
        case .staticTitle(let title):
            return title
        case .interactive(let binding):
            return Self.timeFormatter.string(from: binding.wrappedValue)
        }
    }

    private var isInteractive: Bool {
        if case .interactive = mode {
            return true
        }
        return false
    }

    public var body: some View {
        switch mode {
        case .staticTitle:
            pillContent
        case .interactive(let binding):
            Button {
                isShowingPicker = true
            } label: {
                pillContent
            }
            .buttonStyle(.plain)
            .contentShape(Capsule())
            .accessibilityLabel(accessibilityLabel ?? "Select time")
            .accessibilityValue(displayTitle)
            .sheet(isPresented: $isShowingPicker) {
                timePickerSheet(binding: binding)
            }
        }
    }

    private var pillContent: some View {
        let textContent = Text(displayTitle)
            .font(.bodyMedium())
            .foregroundStyle(isHighlighted ? Color.themePrimary : Color.textSecondary)
            .padding(.horizontal, DSSpacing.md)
            .padding(.vertical, DSSpacing.smd)

        return Group {
            if usesGlass {
                textContent
                    .background(Capsule().fill(Color.clear))
                    .glassSurface(
                        cornerRadius: DSRadii.pill,
                        tint: isHighlighted ? Color.themePrimary.opacity(0.15) : DesignSystem.tokens.glass.tint,
                        borderColor: .clear,
                        shadow: DSShadows.soft,
                        isInteractive: isInteractive
                    )
            } else {
                textContent
                    .background(Capsule().fill(isHighlighted ? Color.surface : Color.surfaceVariant))
                    .overlay(
                        Capsule().stroke(Color.themePrimary.opacity(0.2), lineWidth: 1)
                    )
            }
        }
    }

    private func timePickerSheet(binding: Binding<Date>) -> some View {
        NavigationStack {
            VStack(spacing: DSSpacing.xl) {
                DatePicker(
                    String(localized: "Time", bundle: .module),
                    selection: binding,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(.wheel)
                .labelsHidden()

                DSButton(title: "Done", style: .primary) {
                    isShowingPicker = false
                }
            }
            .padding(DSSpacing.xl)
            .navigationTitle("Select Time")
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
}

#Preview("Static TimePill") {
    VStack(spacing: DSSpacing.md) {
        TimePill(title: "17:00")
        TimePill(title: "08:30", isHighlighted: false)
        TimePill(title: "11:15", usesGlass: true)
    }
    .padding()
    .background(Color.backgroundPrimary)
}

#Preview("Interactive TimePill") {
    struct PreviewWrapper: View {
        @State private var time = Date()

        var body: some View {
            VStack(spacing: DSSpacing.md) {
                TimePill(time: $time, accessibilityLabel: "Reminder time")
                TimePill(time: $time, usesGlass: true, accessibilityLabel: "Reminder time")

                Text("Selected: \(time.formatted(date: .omitted, time: .shortened))")
                    .font(.bodySmall())
                    .foregroundStyle(Color.textSecondary)
            }
            .padding()
            .background(Color.backgroundPrimary)
        }
    }

    return PreviewWrapper()
}
