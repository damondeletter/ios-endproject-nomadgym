//
//  HorizontalListItem.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 23/12/2022.
//

import SwiftUI

struct HorizontalListItem: View {
    @State var workoutName : String
    @State var workoutDate : String
    @State var muscles : [String]
   
    @State var time : Int
    let color = Color.hexColour(hexValue: 0x6715f9)
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(color)
                .frame(height:100)
            VStack{
                HStack {
                    Text(workoutName)
                        .foregroundColor(.white)
                        .font(.title2)
                    Spacer()
                    Text("\(time) mins")
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
                .padding()
                HStack {
                    Text("Muscles:\( muscles.joined(separator: ", "))")
                        .foregroundColor(.white)
                        .font(.body)
                    Spacer()
                    Text(workoutDate)
                        .foregroundColor(.white)
                        .font(.body)
                }
                .padding()
            }
        }
    }
}

struct HorizontalListItem_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalListItem(workoutName: "SampleWorkout", workoutDate: "2022-12-23", muscles: ["Chest", "Triceps"], time: 60)
    }
}
