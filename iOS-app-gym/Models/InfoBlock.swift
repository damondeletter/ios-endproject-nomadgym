//
//  InfoBlock.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 19/12/2022.
//

import Foundation

struct InfoBlock : Identifiable, Codable, Hashable {
    
    var id = UUID()
    var title : String
    var length: String
    var description: String
    var taughtBy: String // change to user
    var para1 : String
    var para2 : String
    var para3 : String
    var quote : String
    var image : String
    var thumnnail : String
}

var infoblocks = [
    InfoBlock(title: "Title1", length: "10 minutes", description: "The best way to build muscle mass!", taughtBy: "Damon", para1: "Blablalblalablalblablablalbalbalblablalba", para2: "Nog meer gedoe hier zetten want ja weet je wel want je weet wel waarom en daarom ja daarom is", para3: "Ik weet niet meer wat ik hier moet zetten, dus daarom zet ik hier maar deze tekst neer.", quote:"Mass moves mass",image: "workouthome", thumnnail: "panda"),
    InfoBlock(title: "Title2", length: "10 minutes", description: "The coolest way to", taughtBy: "Damon", para1: "Blablalblalablalblablablalbalbalblablalba", para2: "Nog meer gedoe hier zetten want ja weet je wel want je weet wel waarom en daarom ja daarom is", para3: "Ik weet niet meer wat ik hier moet zetten, dus daarom zet ik hier maar deze tekst neer.", quote:"Mass moves mass",image: "workouthome", thumnnail: "panda"),
    InfoBlock(title: "Title1", length: "10 minutes", description: "The best way to build muscle mass!", taughtBy: "Damon", para1: "Blablalblalablalblablablalbalbalblablalba", para2: "Nog meer gedoe hier zetten want ja weet je wel want je weet wel waarom en daarom ja daarom is", para3: "Ik weet niet meer wat ik hier moet zetten, dus daarom zet ik hier maar deze tekst neer.", quote:"Mass moves mass",image: "workouthome", thumnnail: "panda"),
    InfoBlock(title: "Title2", length: "10 minutes", description: "The coolest way to", taughtBy: "Damon", para1: "Blablalblalablalblablablalbalbalblablalba", para2: "Nog meer gedoe hier zetten want ja weet je wel want je weet wel waarom en daarom ja daarom is", para3: "Ik weet niet meer wat ik hier moet zetten, dus daarom zet ik hier maar deze tekst neer.", quote:"Mass moves mass",image: "workouthome", thumnnail: "panda")
]
