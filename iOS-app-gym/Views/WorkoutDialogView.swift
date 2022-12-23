//
//  WorkoutDialogView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 23/12/2022.
//

import SwiftUI

struct WorkoutDialogView: View {
    var body: some View {
        NavigationView {
            List(0..<5) { item in
                Text("tekst")
            }
        }
    }
}

struct WorkoutDialogView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDialogView()
    }
}
