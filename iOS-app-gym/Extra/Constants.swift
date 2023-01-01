//
//  Constants.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 01/01/2023.
//

import SwiftUI

struct Constants {
    static let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    static let buttonColor = Color.hexColour(hexValue: 0x6715f9)
    static let muscles = ["Choose a muscle", "Chest", "Shoulders", "Rear delts", "Biceps", "Triceps", "Glutes", "Quads", "Hamstrings", "Calves", "Abs", "Back","Forearms"]
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()
    
    static let errormessages = ["user-not-found": "Please enter valid credentials","network-request-failed": "There is a network error, please try again later", "auth/wrong-password": "Email and password are not valid. Also,they cannot be empty"]
}
