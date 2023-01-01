//
//  TabBarView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 19/12/2022.
//

import SwiftUI

struct TabBarView: View {
    @AppStorage("selectedTab") var selectedTab : Tab = .house
    let color = Color.hexColour(hexValue: 0x6715f9)
    private var fillIcon : String {
        if(selectedTab.rawValue == "plus.app.fill") {
            return selectedTab.rawValue
        } else {
           return selectedTab.rawValue + ".fill"
        }
    }

    var body : some View {
        VStack{
            ZStack {
                switch selectedTab.rawValue {
                case "plus.app.fill":
                    NavigationView {
                        WorkoutView()
                    }.navigationBarTitle("Workout", displayMode: .inline)
                case "house":
                    NavigationView {
                        OverviewView()
                    }.navigationBarTitle("Home", displayMode: .inline)
                case "person":
                    NavigationView {
                        UserView()
                    }.navigationBarTitle("User info", displayMode: .inline)
                case "newspaper":
                    NavigationView {
                        InfoView()
                    }.navigationBarTitle("Info blogs", displayMode: .inline)
                case "arrow.counterclockwise.circle":
                    NavigationView {
                        HistoryView()
                    }.navigationBarTitle("History", displayMode: .inline)
                default:
                    NavigationView {
                        OverviewView()
                    }.navigationBarTitle("Home", displayMode: .inline)
                }
            }
            HStack {
                content
            }
            .frame(width: nil, height:60)
            .background(.thinMaterial)
            .cornerRadius(10).padding(.horizontal, 10).padding(.vertical,2)
        }.background(Constants.backgroundlower)
       
    }
    
    var content: some View {
                ForEach(Tab.allCases, id:\.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillIcon : tab.rawValue)
                        .scaleEffect(
                            selectedTab == tab ? 1.30 : 1.00)
                        .foregroundColor(selectedTab == tab ?  color : .black)
                        .font(.system(size: 18))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.15)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


