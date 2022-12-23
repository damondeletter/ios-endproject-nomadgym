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

extension TabView {

    func myTabViewStyle() -> some View {
        self.background(LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 500, alignment: .top)
            .opacity(0.5)

    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

/* https://www.youtube.com/watch?v=h4vyOz4Tztg */
/* https://stackoverflow.com/questions/24263007/how-to-use-hex-color-values */
