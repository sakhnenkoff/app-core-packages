import Foundation
import SwiftKeychainWrapper

/// Property wrapper for declarative Keychain storage of Codable values.
///
/// Provides type-safe persistence to iOS Keychain with automatic enforcement of
/// `kSecAttrAccessibleWhenUnlockedThisDeviceOnly` accessibility for all writes.
///
/// This ensures sensitive data:
/// - Does NOT sync to iCloud Keychain
/// - Is only accessible when device is unlocked
/// - Persists across app reinstalls (tied to device)
///
/// Usage:
/// ```swift
/// @KeychainStored(key: "app_premium_status", defaultValue: false)
/// var isPremium: Bool
/// ```
///
/// - Note: Silent fallback to `defaultValue` on decode failure (no throws).
/// - Author: Matvii Sakhnenko
@propertyWrapper
public struct KeychainStored<T: Codable> {
    private let key: String
    private let defaultValue: T
    // SAFETY: KeychainWrapper is internally synchronized with NSLock.
    // TODO(CONC-006): Remove this annotation when SwiftKeychainWrapper exposes Sendable conformance.
    private nonisolated(unsafe) let keychain: KeychainWrapper

    /// Initialize property wrapper with Keychain key and default value.
    ///
    /// - Parameters:
    ///   - key: Keychain key for storage (use reverse-DNS style: "com.app.key_name")
    ///   - defaultValue: Fallback value when key has no data or decode fails
    ///   - keychain: KeychainWrapper instance (defaults to .standard)
    public init(key: String, defaultValue: T, keychain: KeychainWrapper = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.keychain = keychain
    }

    public var wrappedValue: T {
        get {
            // Fetch data from Keychain with device-only accessibility
            // Note: Pass accessibility on read for consistency, though it's primarily used for writes
            guard let data = keychain.data(forKey: key, withAccessibility: .whenUnlockedThisDeviceOnly) else {
                return defaultValue
            }
            // Decode to T, fallback to defaultValue on decode failure (silent, no throws)
            return (try? JSONDecoder().decode(T.self, from: data)) ?? defaultValue
        }
        set {
            // Encode newValue to JSON data and persist to Keychain with device-only accessibility
            // This enforces kSecAttrAccessibleWhenUnlockedThisDeviceOnly on all writes
            if let data = try? JSONEncoder().encode(newValue) {
                keychain.set(data, forKey: key, withAccessibility: .whenUnlockedThisDeviceOnly)
            }
        }
    }
}
