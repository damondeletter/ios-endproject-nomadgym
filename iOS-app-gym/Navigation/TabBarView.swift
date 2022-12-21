//
//  TabBarView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 19/12/2022.
//

import SwiftUI
import RiveRuntime

struct TabBarView: View {
    
    var body: some View {
        RiveViewModel(fileName: "house").view()
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


