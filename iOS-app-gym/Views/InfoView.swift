//
//  InfoView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 22/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct InfoView: View {
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    @State private var infoblocks = [InfoBlock]()
    @ObservedObject var viewModel = ViewModel()
    let backgroundColor = Color.hexColour(hexValue: 0xa879fb)
    let color = Color.hexColour(hexValue: 0x6715f9)
    var body: some View {
        ZStack{
            backgroundlower
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 300))
                path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                path.addLine(to: CGPoint(x: 450, y: 0))
            }.fill(.white)
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(infoblocks, id: \.id) { infoblock in
                            NavigationLink(destination: InfoDetailView(infoblock: infoblock)) {
                                
                                VStack {
                                    WebImage(url: URL(string: infoblock.image)).resizable().frame(width: 300, height: 200)
                                        .scaledToFit()
                                        .cornerRadius(16)
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(infoblock.title).font(.title)
                                            Text(infoblock.subtitle).font(.subheadline)
                                            Text(infoblock.description).font(.subheadline).frame(maxWidth: 250)
                                                .multilineTextAlignment(.leading)
                                            Text("Taught by: \(infoblock.taughtBy)")
                                        }
                                        .layoutPriority(100)
                                        Spacer()
                                    }
                                    .padding()
                                    
                                    .cornerRadius(8)
                                    .foregroundColor(.black)
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.gray, lineWidth: 4)
                                )
                        
                                .padding([.top,.horizontal])
                               
                            }
                            .foregroundColor(.primary)
                            
                        }
                    }
                
                }
                
            }.task {
                await viewModel.fetchData()
                infoblocks = viewModel.items

                
            }
        }.ignoresSafeArea()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
