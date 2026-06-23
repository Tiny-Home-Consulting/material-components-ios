# Material Components for iOS

## Installation

This fork distributes Material Components as a Swift Package. The upstream CocoaPods support has been removed.

In Xcode: **File → Add Package Dependencies…** and enter the repository URL.

In `Package.swift`:

```swift
.package(url: "https://github.com/Tiny-Home-Consulting/material-components-ios.git", branch: "feature/CPC-12885-Add-SPM-Compatibility")
```

Add the `MaterialComponents` library product to any target that imports it.

## Useful Links

- [How To Use MDC-iOS](docs/)
- [All Components](components/)
- [MDC-iOS on Stack Overflow](https://www.stackoverflow.com/questions/tagged/material-components+ios) (external site)
- [Material.io](https://material.io) (external site)
- [Material Design Guidelines](https://material.io/guidelines) (external site)
