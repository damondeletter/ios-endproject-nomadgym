//
//  VerticalCard.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 23/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct VerticalCard: View {
    let colors = [Color.hexColour(hexValue: 0xBB94FE),Color.hexColour(hexValue: 0x94CCFE), Color.hexColour(hexValue: 0x94ACFE),Color.hexColour(hexValue: 0xBB94FE),Color.hexColour(hexValue: 0x94CCFE),Color.hexColour(hexValue: 0x94ACFE)].shuffled()
    let workout : Workout
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(workout.name)
                .frame(maxWidth: 170, alignment: .center)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .layoutPriority(1)
                .multilineTextAlignment(.center)
            Text("\(workout.totalTime) mins")
                .font(.caption)
                .foregroundColor(Color.hexColour(hexValue: 0x808080))
                .frame(maxWidth: .infinity, alignment: .center)
            Text(workout.workoutdate.prefix(10))
                .foregroundColor(Color.hexColour(hexValue: 0x808080))
                .font(.caption2)
                .frame(maxWidth: 170, alignment: .center)
            
            
        }
        .foregroundColor(.white)
        .padding(30)
        .background(colors.randomElement())
        .frame(width: 200, height: 150)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

