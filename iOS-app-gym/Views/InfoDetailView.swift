//
//  InfoDetailView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 22/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct InfoDetailView: View {
    let infoblock : InfoBlock
    var body: some View {
        ZStack {
            Constants.backgroundlower
            PathComp()
            ScrollView {
                VStack {
                    WebImage(url: URL(string: infoblock.image))
                        .resizable()
                        .scaledToFill()
                        .frame(height:150)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .clipShape(Circle())
                    
                        .padding(.horizontal, 10)
                        .cornerRadius(20)
                    
                    VStack(alignment: .center) {
                        Text(infoblock.title).font(.title)
                        Text(infoblock.subtitle).font(.subheadline)
                        Text("\(infoblock.timeToRead) minute read").font(.title3)
                        
                    }
                    VStack(alignment: .leading) {
                        Text(infoblock.paragraph1).font(.body)
                        Spacer()
                        Text(infoblock.paragraph2).font(.body)
                        Spacer()
                        Text(infoblock.paragraph3).font(.body)
                        Spacer()
                        Text(infoblock.paragraph4).font(.body)
                        Spacer()
                        
                    }
                    .padding(.horizontal,5)
                    
                    VStack {
                        Text("Read more about this on: ")
                        Link("Learn more about bulking", destination: URL(string: infoblock.link)!)
                    }
                    
                    HStack {
                        Text(infoblock.date.prefix(10)).font(.body)
                        Text("By: \(infoblock.taughtBy)").font(.body)
                    }
                        
                    
                }
            }
           
        }
    }
}



