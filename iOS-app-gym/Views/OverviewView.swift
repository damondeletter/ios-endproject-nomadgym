//
//  OverviewView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 18/12/2022.
//

import SwiftUI
import Firebase

struct OverviewView: View {
    @Namespace var namespace
    @State private var selectedTab : Tab = .house
    @State private var infoblocks = [InfoBlock]()
    @State private var workouts = [Workout]()
    @ObservedObject var viewModel = ViewModel()

    @State var show = true
    var body: some View {
        ZStack {
            Constants.backgroundlower
            PathComp()
                
            ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("Recent sessions").frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading).padding(.horizontal, 10).foregroundColor(Color.hexColour(hexValue: 0x19213F)).font(.title)
                            .fontWeight(.bold)
                    }
                    HStack{
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(workouts.prefix(2), id:\.id) { workout in
                                    NavigationLink(destination: HistoryDetailView(workout: workout)) {
                                        VerticalCard(workout : workout).padding(.trailing, 20)
                                    }
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
                        VStack {
                            Text("Info section").font(.title)
                                .fontWeight(.bold)
                            Text("Most recent article:")
                        }.frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading).padding(.horizontal, 10).foregroundColor(Color.hexColour(hexValue: 0x19213F))
                            ForEach(infoblocks.suffix(1), id:\.id) { infoblock in
                                NavigationLink(destination: InfoDetailView(infoblock: infoblock)) {
                                    InfoItem(namespace: namespace, show: $show, infoblock: infoblock)
                                }
                            }
                    }
                    
                }.task {
                    await viewModel.fetchData()
                    await viewModel.fetchWorkouts(Auth.auth().currentUser!.uid)
                    infoblocks = viewModel.items
                    workouts = viewModel.workouts
                    
                    
                }.padding(.top, 100).padding(.leading, 20)
           
            
        }.ignoresSafeArea()
    }

}

struct OverviewView_Previews: PreviewProvider {
    
    static var previews: some View {
        OverviewView()
    }
}
