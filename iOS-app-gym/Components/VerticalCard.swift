//
//  VerticalCard.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 23/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct VerticalCard: View {
    let infoblock : InfoBlock
    
    let colors = [Color.hexColour(hexValue: 0xBB94FE),Color.hexColour(hexValue: 0x94CCFE), Color.hexColour(hexValue: 0x94ACFE),Color.hexColour(hexValue: 0xBB94FE),Color.hexColour(hexValue: 0x94CCFE),Color.hexColour(hexValue: 0x94ACFE)].shuffled()
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            WebImage(url: URL(string: infoblock.image)).resizable()
            Text(infoblock.taughtBy)
                .opacity(0.8)
                .foregroundColor(Color.hexColour(hexValue: 0x808080))
                .frame(maxWidth: .infinity, alignment: .center)
            Text(infoblock.title)
                .frame(maxWidth: 170, alignment: .center)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .layoutPriority(1)
                .multilineTextAlignment(.center)
            Text("\(infoblock.timeToRead) mins")
                .opacity(0.8)
                .foregroundColor(Color.hexColour(hexValue: 0x808080))
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(colors.randomElement())
        .frame(width: 200, height: 250)
        .mask(RoundedRectangle(cornerRadius: 50, style: .continuous))
    }
}

