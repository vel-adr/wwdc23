//
//  LearnComponentSheetView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 18/04/23.
//

import SwiftUI

struct LearnComponentSheetView: View {
    let componentType: ComponentType
    
    var body: some View {
        switch componentType {
        case .processor:
            LearnCpuView()
        case .motherboard:
            LearnMotherboardView()
        case .storage:
            LearnStorageView()
        case .ram:
            LearnRamView()
        case .gpu:
            LearnGpuView()
        case .powerSupply:
            LearnPsuView()
        }
    }
}

//struct ComponentSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComponentSheetView()
//    }
//}
