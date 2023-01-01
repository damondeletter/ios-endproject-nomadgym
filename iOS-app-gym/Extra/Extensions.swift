//
//  Extensions.swift
//  NomadGym
//
//  Created by Damon De Letter on 27/10/2022.
//

import SwiftUI

extension UIColor {

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

}

extension Color {
  static func hexColour(hexValue:UInt32)->Color
    {
      let red = Double((hexValue & 0xFF0000) >> 16) / 255.0
      let green = Double((hexValue & 0xFF00) >> 8) / 255.0
      let blue = Double(hexValue & 0xFF) / 255.0
      return Color(red:red, green:green, blue:blue)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

/* https://stackoverflow.com/questions/24263007/how-to-use-hex-color-values */
/* https://stackoverflow.com/questions/63166706/how-to-store-nested-arrays-in-appstorage-for-swiftui */
