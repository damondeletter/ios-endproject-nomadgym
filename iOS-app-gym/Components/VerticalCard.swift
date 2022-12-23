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
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text("Title")
                .frame(maxWidth: 170, alignment: .center)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .layoutPriority(1)
                .multilineTextAlignment(.center)
            Text("Chest - Shoulders")
                .font(.caption)
                .foregroundColor(Color.hexColour(hexValue: 0x808080))
                .frame(maxWidth: .infinity, alignment: .center)
            Text("2022-13-18")
         
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

