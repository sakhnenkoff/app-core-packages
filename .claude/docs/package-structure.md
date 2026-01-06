# Package Structure

This repo is a single Swift package with multiple products. All targets are defined in the root `Package.swift`.

## Module Boundaries

- Domain
  - Entities and repository protocols only
  - No networking or storage dependencies
- Data
  - Repository implementations
  - Depends on Domain + Networking
- Networking
  - API request/response abstractions and HTTP utilities
- LocalPersistance
  - Keychain and UserDefaults caching
  - Mock implementations for testing
- DesignSystem
  - SwiftUI components, colors, typography, resources

## Folder Layout

```
Domain/
  Sources/
    Domain/
    DomainMock/
  Tests/
Data/
  Sources/
    Data/
    DataMock/
  Tests/
Networking/
  Sources/Networking/
  Tests/
LocalPersistance/
  Sources/
    LocalPersistance/
    LocalPersistanceMock/
  Tests/
DesignSystem/
  Sources/DesignSystem/
  Tests/
```

## DesignSystem Resources

Resources are bundled from:
- `DesignSystem/Sources/DesignSystem/Resources`

Keep resource paths stable so apps do not need to change references.
