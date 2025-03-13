//
// Theme-DefaultImplementation.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

/// Default implementation providing Bootstrap's default light theme values
/// Default implementation providing Bootstrap's default theme values
public extension Theme {
    var accent: Color { Color(hex: "#4CEC8B") }

    var secondaryAccent: Color { Color(hex: "#DDF34E") }

    var success: Color { Color(hex: "#16FF71") }

    var info: Color { Color(hex: "#E6E6E6") }

    var warning: Color {
        Color(red: 255, green: 193, blue: 7)
    }

    var danger: Color {
        Color(red: 220, green: 53, blue: 69)
    }

    var offWhite: Color {
        Color(hex: "#f8f9fa")
    }

    var offBlack: Color {
        Color(hex: "#212529")
    }

    var primary: Color { Color (hex: "#E0E0EB") }

    var emphasis: Color { Color (hex: "#FBFBFB")}

    var secondary: Color { Color(hex: "#B7B7B7") }

    var tertiary: Color { Color(hex: "#616161") }

    var background: Color { Color(hex: "#000000") }

    var secondaryBackground: Color { Color(hex: "#151516")}

    var tertiaryBackground: Color { Color(hex: "#1C1C1D") }

    var border: Color { Color(hex: "#8E8E8E") }

    var syntaxHighlighterTheme: HighlighterTheme {
        colorScheme == .dark ?
        .xcodeDark :
        .automatic
    }

    var link: Color { Color(hex: "#478BFF") }

    var hoveredLink: Color { Color(hex: "#2D73E9") }

    // Links
    var linkDecoration: TextDecoration { .underline }

    // Font Families
    var monospaceFont: Font { .default }
    var font: Font { .default }

    // Font Sizes
    var rootFontSize: LengthUnit { .default }
    var bodyFontSize: ResponsiveValues { .default }
    var inlineCodeFontSize: LengthUnit { .default }
    var codeBlockFontSize: LengthUnit { .default }

    // Line Heights
    var lineSpacing: LengthUnit { .default }

    // Heading Sizes
    var h1Size: ResponsiveValues { .default }
    var h2Size: ResponsiveValues { .default }
    var h3Size: ResponsiveValues { .default }
    var h4Size: ResponsiveValues { .default }
    var h5Size: ResponsiveValues { .default }
    var h6Size: ResponsiveValues { .default }

    // Heading Properties
    var headingFont: Font { .default }
    var headingFontWeight: FontWeight { .default }
    var headingLineSpacing: LengthUnit { .default }

    // Bottom Margins
    var headingBottomMargin: LengthUnit { .default }
    var paragraphBottomMargin: LengthUnit { .default }

    // Breakpoints
    var breakpoints: ResponsiveValues { .default}

    // Maximum widths
    var siteWidth: ResponsiveValues { .default }
}

public extension Theme {
    /// The type name, removing the word "Theme" if present
    var name: String {
        Self.baseName.titleCase()
    }
}

extension Theme {
    /// A unique identifier derived from the type name.
    static var idPrefix: String {
        Self.baseName
            .kebabCased()
            .lowercased()
    }

    /// A unique identifier derived from the type name, appending "-light" or "-dark" based on `colorScheme`.
    var cssID: String {
        let baseID = Self.idPrefix
        switch colorScheme {
        case .light where
            baseID != "light" &&
            Self.self != DefaultLightTheme.self &&
            Self.self != AutoTheme.self:
            return baseID + "-light"
        case .dark where
            baseID != "dark" &&
            Self.self != DefaultDarkTheme.self:
            return baseID + "-dark"
        default: return baseID
        }
    }
}

fileprivate extension Theme {
    static var baseName: String {
        let name = switch Self.self {
        case is DefaultDarkTheme.Type: "dark"
        case is DefaultLightTheme.Type: "light"
        case is AutoTheme.Type: "auto"
        default: String(describing: Self.self)
        }

        return name.replacingOccurrences(of: "Theme", with: "")
    }
}
