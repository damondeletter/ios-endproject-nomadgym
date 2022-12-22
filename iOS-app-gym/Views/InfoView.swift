//
//  InfoView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 22/12/2022.
//

import SwiftUI

struct InfoView: View {
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    @State private var infoblocks = [InfoBlock]()
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        ZStack{
            backgroundlower
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 300))
                path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                path.addLine(to: CGPoint(x: 450, y: 0))
            }.fill(.white)
            VStack {
                Text("TEST")
                 
                    ForEach(infoblocks, id: \.id) { infoblock in
                        
                            Text(infoblock.subtitle)
                                .font(.headline)
                    }
                
            }.task {
                await viewModel.fetchData()
                infoblocks = viewModel.items

                
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
