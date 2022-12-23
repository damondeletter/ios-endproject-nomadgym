//
//  OverviewView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 18/12/2022.
//

import SwiftUI
import Firebase

struct OverviewView: View {
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    @Namespace var namespace
    @State private var infoblocks = [InfoBlock]()
    @ObservedObject var viewModel = ViewModel()
    @State var show = false
    var body: some View {
        ZStack {
            backgroundlower
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 300))
                path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                path.addLine(to: CGPoint(x: 450, y: 0))
            }.fill(.white)
            
                
            ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("Articles").frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading).padding(.horizontal, 10).foregroundColor(Color.hexColour(hexValue: 0x19213F)).font(.title)
                            .fontWeight(.bold)
                    }
                    HStack{
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(infoblocks.prefix(4), id:\.id) { infoblock in
                                    VerticalCard(infoblock: infoblock).padding(.trailing, 20)
                                    
                                }
                            }
                        }
                        
                    }
                    VStack {
                        Text("Workout").frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading).padding(.horizontal, 10).foregroundColor(Color.hexColour(hexValue: 0x19213F)).font(.title)
                            .fontWeight(.bold)
                        ExploreHorizontalCard()
                    }
                    VStack {
                        if !show {
                            Text("Info section").frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading).padding(.horizontal, 10).foregroundColor(Color.hexColour(hexValue: 0x19213F)).font(.title)
                                .fontWeight(.bold)
                            ForEach(infoblocks.prefix(1), id:\.id) { infoblock in
                                InfoItem(namespace: namespace, show: $show, infoblock: infoblock).onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                        show.toggle()
                                        
                                    }}
                            }
                    }
                        
                    }
                    
                }.task {
                    await viewModel.fetchData()
                    infoblocks = viewModel.items
                    
                    
                }.padding(.top, 100).padding(.leading, 20)
            if show {InfoSegment(namespace: namespace, show: $show)}
            
        }.ignoresSafeArea()
    }

}

struct OverviewView_Previews: PreviewProvider {
    
    static var previews: some View {
        OverviewView()
    }
}
