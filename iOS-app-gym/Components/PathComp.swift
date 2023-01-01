//
//  Path.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 01/01/2023.
//

import SwiftUI

struct PathComp: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 300))
                path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                path.addLine(to: CGPoint(x: 450, y: 0))
            }.fill(.white)
        }
    }
}

struct Path_Previews: PreviewProvider {
    static var previews: some View {
        Path()
    }
}
