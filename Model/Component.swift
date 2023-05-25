//
//  Components.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 14/04/23.
//

import Foundation

struct Component: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var desc: String
    var wattUsage: Int
    var type: ComponentType
    var performancePoint: Int?
    var capacity: Int?
    var speed: String?
    var imageName: String
}

enum ComponentType: String, CaseIterable, Identifiable {
    var id: String { UUID().uuidString }
    
    case processor = "CPU"
    case motherboard = "Motherboard"
    case storage = "Storage"
    case ram = "RAM"
    case gpu = "GPU"
    case powerSupply = "PSU"
}
