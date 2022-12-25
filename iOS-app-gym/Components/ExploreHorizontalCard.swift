//
//  ExploreHorizontalCard.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 19/12/2022.
//

import SwiftUI

struct ExploreHorizontalCard: View {
    let iconBackground = Color.hexColour(hexValue: 0x1C8CFE)
    @State private var selectedTab : Tab = .house
   @State private var show = false
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing:7) {
                HStack{
                        NavigationLink(destination: WorkoutDialogView()) {
                            Button {
                                show = true
                            }label: {
                                Image(systemName: "plus").resizable().frame(width: 28, height:28).background(
                                    Circle()
                                        .foregroundColor(iconBackground)
                                        .frame(width: 50, height: 50)
                                ).padding(.trailing,20)
                                Text("Start a new workout").fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            .sheet(isPresented: $show) {
                                WorkoutDialogView()
                            }
                            .navigationTitle("")
                            .navigationBarHidden(true)
                        }
                    
                }
                Spacer()
                HStack{
                    Button {
                        selectedTab = .arrow
                    } label: {
                        NavigationLink(destination: HistoryView()) {
                            Image(systemName: "arrow.counterclockwise.circle").resizable().frame(width: 28, height:28).background(
                                Circle()
                                    .foregroundColor(iconBackground)
                                    .frame(width: 50, height: 50)
                            ).padding(.trailing,20)
                            Text("Review your workouts").fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                
            }
            Divider()
            
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 150)
        .foregroundColor(.black)
        .background(Color.hexColour(hexValue: 0x77BAFE))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct ExploreHorizontalCard_Previews: PreviewProvider {
    static var previews: some View {
        ExploreHorizontalCard()
    }
}
