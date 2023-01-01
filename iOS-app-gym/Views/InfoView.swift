//
//  InfoView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 22/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct InfoView: View {

    @State private var infoblocks = [InfoBlock]()
    @ObservedObject var viewModel = ViewModel()
    let backgroundColor = Color.hexColour(hexValue: 0xa879fb)
    let color = Color.hexColour(hexValue: 0x6715f9)
    var body: some View {
        ZStack{
            Constants.backgroundlower
           Path()
            VStack {
                VStack {
                    Text("All articles").frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading).padding(.horizontal, 10).foregroundColor(Color.hexColour(hexValue: 0x19213F)).font(.title)
                        .fontWeight(.bold)
                }
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        ForEach(infoblocks, id: \.id) { infoblock in
                            NavigationLink(destination: InfoDetailView(infoblock: infoblock)) {
                                
                                VStack{
                                    Spacer()
                                    VStack(alignment: .leading, spacing:12)  {
                                        Text(infoblock.title)
                                            .font(.largeTitle)
                                        
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text(infoblock.subtitle)
                                            .font(.footnote.weight(.semibold))
                                        
                                        Text(infoblock.taughtBy)
                                            .font(.footnote)
                                        
                                    }
                                    .padding(20)
                                    .background(
                                        Rectangle().fill(.ultraThinMaterial)
                                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                            .blur(radius: 30)
                                        
                                    )
                                    
                                }
                                .foregroundColor(.white)
                                .background(Image("lifter").resizable().aspectRatio(contentMode: .fit))
                                .background(Image("color2").resizable().aspectRatio(contentMode: .fill))
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .frame(height: 300)
                                .padding(.trailing, 5).padding(.bottom, 10)
                                .ignoresSafeArea()
                                
                            }
                            .foregroundColor(.primary)
                            
                        }
                    }
                    
                }
                
            }.task {
                await viewModel.fetchData()
                infoblocks = viewModel.items
            }
                VStack {
                    Text("Coming soon").font(.title)
                        .fontWeight(.bold)
                    Text("Already read articles")
                }.frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading).padding(.horizontal, 10).foregroundColor(Color.hexColour(hexValue: 0x19213F))
        }
           
        }.ignoresSafeArea()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
