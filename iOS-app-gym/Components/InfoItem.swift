//
//  InfoItem.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 19/12/2022.
//

import SwiftUI

struct InfoItem: View {
    var namespace : Namespace.ID
    @Binding var show : Bool
    let infoblock : InfoBlock
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading, spacing:12)  {
                Text(infoblock.title)
                    .font(.largeTitle)
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(infoblock.subtitle)
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text(infoblock.taughtBy)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle().fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            
        }
        .foregroundColor(.white)
        .background(Image("lifter").resizable().aspectRatio(contentMode: .fit).matchedGeometryEffect(id: "image", in: namespace))
        .background(Image("color2").resizable().aspectRatio(contentMode: .fill).matchedGeometryEffect(id: "background", in: namespace))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous).matchedGeometryEffect(id: "mask", in: namespace))
        .frame(height: 300)
        .padding(.trailing, 5).padding(.bottom, 10)
        .ignoresSafeArea()
    }
}

