// swift-tools-version:5.9
import PackageDescription

let sourceDirs: [String] = [
    "components/Buttons/src",
    "components/Buttons/src/private",
    "components/Buttons/src/Theming",
    "components/Buttons/src/ButtonThemer",
    "components/Buttons/src/ColorThemer",
    "components/Buttons/src/ShapeThemer",
    "components/Buttons/src/TypographyThemer",
    "components/Cards/src",
    "components/Cards/src/Theming",
    "components/TextControls/src/Enums",
    "components/TextControls/src/BaseTextFields",
    "components/TextControls/src/BaseTextAreas",
    "components/TextControls/src/BaseTextAreas/private",
    "components/TextControls/src/OutlinedTextFields",
    "components/TextControls/src/OutlinedTextAreas",
    "components/TextControls/src/OutlinedTextFieldsTheming",
    "components/TextControls/src/OutlinedTextAreasTheming",
    "components/schemes/Color/src",
    "components/schemes/Container/src",
    "components/schemes/Shape/src",
    "components/schemes/Typography/src",
    "components/schemes/Typography/src/Scheming",
    "components/schemes/Typography/src/BasicFontScheme",
    "components/Elevation/src",
    "components/Ink/src",
    "components/Ink/src/private",
    "components/Ripple/src",
    "components/Ripple/src/private",
    "components/Shadow/src",
    "components/ShadowElevations/src",
    "components/ShadowLayer/src",
    "components/Shapes/src",
    "components/ShapeLibrary/src",
    "components/Typography/src",
    "components/Typography/src/private",
    "components/Availability/src",
    "components/AnimationTiming/src",
    "components/private/Application/src",
    "components/private/Color/src",
    "components/private/Math/src",
    "components/private/Icons/src",
    "components/private/Icons/icons/ic_check_circle/src",
    "components/private/TextControlsPrivate/src/Shared",
    "components/private/TextControlsPrivate/src/BaseStyle",
    "components/private/TextControlsPrivate/src/OutlinedStyle",
    "components/private/TextControlsPrivate/src/TextFields",
]

let unusedComponents: [String] = [
    "ActionSheet", "ActivityIndicator", "AppBar", "Banner",
    "BottomAppBar", "BottomNavigation", "BottomSheet", "ButtonBar", "Chips",
    "CollectionCells", "CollectionLayoutAttributes", "Collections", "Dialogs",
    "FeatureHighlight", "FlexibleHeader", "HeaderStackView", "LibraryInfo",
    "List", "NavigationBar", "NavigationDrawer", "OverlayWindow",
    "PageControl", "Palettes", "ProgressView", "ScalableFontDescriptor",
    "SegmentedControl", "Slider", "Snackbar", "Tabs", "TextFields", "Themes",
]

let unusedSchemes: [String] = ["Bidirectionality"]
let unusedPrivate: [String] = [
    "Dragons", "KeyboardWatcher", "Overlay", "Snapshot", "ThumbTrack", "UIMetrics",
]

let unusedIcons: [String] = [
    "ic_arrow_back", "ic_check", "ic_chevron_right", "ic_color_lens",
    "ic_feedback", "ic_help_outline", "ic_info", "ic_more_horiz",
    "ic_radio_button_unchecked", "ic_reorder", "ic_settings",
]

let usedComponentSubdirExcludes: [String] = [
    "components/Buttons/examples", "components/Buttons/tests", "components/Buttons/docs",
    "components/Cards/examples", "components/Cards/tests", "components/Cards/docs",
    "components/TextControls/examples", "components/TextControls/tests", "components/TextControls/docs",
    "components/Elevation/tests",
    "components/Ink/examples", "components/Ink/tests", "components/Ink/docs",
    "components/Ripple/examples", "components/Ripple/tests", "components/Ripple/docs",
    "components/Shadow/examples", "components/Shadow/tests",
    "components/ShadowElevations/examples", "components/ShadowElevations/tests", "components/ShadowElevations/docs",
    "components/ShadowLayer/examples", "components/ShadowLayer/tests", "components/ShadowLayer/docs",
    "components/Shapes/tests", "components/Shapes/docs",
    "components/ShapeLibrary/tests", "components/ShapeLibrary/docs",
    "components/Typography/examples", "components/Typography/tests", "components/Typography/docs",
    "components/AnimationTiming/tests", "components/AnimationTiming/docs",
    "components/schemes/Color/tests", "components/schemes/Color/docs",
    "components/schemes/Container/tests",
    "components/schemes/Shape/tests", "components/schemes/Shape/docs",
    "components/schemes/Typography/tests", "components/schemes/Typography/docs",
    "components/private/Application/tests",
    "components/private/Color/tests",
    "components/private/Math/tests",
    "components/private/TextControlsPrivate/tests",
    "components/Buttons/src/PerformantShadowMigration",
]

let topLevelExcludes: [String] = [
    "AUTHORS",
    "CHANGELOG.md",
    "CODE_OF_CONDUCT.md",
    "CONTRIBUTING.md",
    "ISSUE_TEMPLATE.md",
    "LICENSE",
    "PULL_REQUEST_TEMPLATE.md",
    "README.md",
    "ROADMAP.md",
    "VERSION",
    "mdc_hero.png",
    "components/README.md",
    "components/docs",
    "catalog",
    "contributing",
    "docs",
    "scripts",
    "snapshot_test_goldens",
    "components/private/Icons/icons/ic_check_circle/src/Info.plist",
    "components/private/Icons/tests",
]

let unusedComponentExcludes: [String] = unusedComponents.map { "components/\($0)" }
let unusedSchemeExcludes: [String] = unusedSchemes.map { "components/schemes/\($0)" }
let unusedPrivateExcludes: [String] = unusedPrivate.map { "components/private/\($0)" }
let unusedIconExcludes: [String] = unusedIcons.map { "components/private/Icons/icons/\($0)" }

let excludePaths: [String] =
    topLevelExcludes
    + unusedComponentExcludes
    + unusedSchemeExcludes
    + unusedPrivateExcludes
    + unusedIconExcludes
    + usedComponentSubdirExcludes

let package = Package(
    name: "MaterialComponents",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "MaterialComponents", targets: ["MaterialComponents"])
    ],
    targets: [
        .target(
            name: "MDFInternationalization",
            path: "External/MDFInternationalization",
            exclude: ["LICENSE", "Sources/Info.plist"],
            sources: ["Sources"],
            publicHeadersPath: "PublicHeaders",
            cSettings: [
                .headerSearchPath("Sources"),
            ]
        ),
        .target(
            name: "MDFTextAccessibility",
            path: "External/MDFTextAccessibility",
            exclude: ["LICENSE", "src/MDFTextAccessibility-Bridging-Header.h"],
            sources: ["src"],
            publicHeadersPath: "PublicHeaders",
            cSettings: [
                .headerSearchPath("src"),
                .headerSearchPath("src/private"),
            ]
        ),
        .target(
            name: "MaterialComponents",
            dependencies: [
                "MDFInternationalization",
                "MDFTextAccessibility",
            ],
            path: ".",
            exclude: excludePaths,
            sources: sourceDirs,
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("components/Buttons/src"),
                .headerSearchPath("components/Buttons/src/private"),
                .headerSearchPath("components/Buttons/src/Theming"),
                .headerSearchPath("components/Buttons/src/ButtonThemer"),
                .headerSearchPath("components/Buttons/src/ColorThemer"),
                .headerSearchPath("components/Buttons/src/ShapeThemer"),
                .headerSearchPath("components/Buttons/src/TypographyThemer"),
                .headerSearchPath("components/Cards/src"),
                .headerSearchPath("components/Cards/src/Theming"),
                .headerSearchPath("components/TextControls/src/Enums"),
                .headerSearchPath("components/TextControls/src/BaseTextFields"),
                .headerSearchPath("components/TextControls/src/BaseTextAreas"),
                .headerSearchPath("components/TextControls/src/BaseTextAreas/private"),
                .headerSearchPath("components/TextControls/src/OutlinedTextFields"),
                .headerSearchPath("components/TextControls/src/OutlinedTextAreas"),
                .headerSearchPath("components/TextControls/src/OutlinedTextFieldsTheming"),
                .headerSearchPath("components/TextControls/src/OutlinedTextAreasTheming"),
                .headerSearchPath("components/schemes/Color/src"),
                .headerSearchPath("components/schemes/Container/src"),
                .headerSearchPath("components/schemes/Shape/src"),
                .headerSearchPath("components/schemes/Typography/src"),
                .headerSearchPath("components/schemes/Typography/src/Scheming"),
                .headerSearchPath("components/schemes/Typography/src/BasicFontScheme"),
                .headerSearchPath("components/Elevation/src"),
                .headerSearchPath("components/Ink/src"),
                .headerSearchPath("components/Ink/src/private"),
                .headerSearchPath("components/Ripple/src"),
                .headerSearchPath("components/Ripple/src/private"),
                .headerSearchPath("components/Shadow/src"),
                .headerSearchPath("components/ShadowElevations/src"),
                .headerSearchPath("components/ShadowLayer/src"),
                .headerSearchPath("components/Shapes/src"),
                .headerSearchPath("components/ShapeLibrary/src"),
                .headerSearchPath("components/Typography/src"),
                .headerSearchPath("components/Typography/src/private"),
                .headerSearchPath("components/Availability/src"),
                .headerSearchPath("components/AnimationTiming/src"),
                .headerSearchPath("components/private/Application/src"),
                .headerSearchPath("components/private/Color/src"),
                .headerSearchPath("components/private/Math/src"),
                .headerSearchPath("components/private/Icons/src"),
                .headerSearchPath("components/private/Icons/icons/ic_check_circle/src"),
                .headerSearchPath("components/private/TextControlsPrivate/src/Shared"),
                .headerSearchPath("components/private/TextControlsPrivate/src/BaseStyle"),
                .headerSearchPath("components/private/TextControlsPrivate/src/OutlinedStyle"),
                .headerSearchPath("components/private/TextControlsPrivate/src/TextFields"),
            ],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreText"),
            ]
        )
    ]
)
