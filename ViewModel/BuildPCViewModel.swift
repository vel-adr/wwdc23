//
//  RakitPCViewModel.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 14/04/23.
//

import Foundation

class BuildPCViewModel: ObservableObject {
    @Published var componentList = [
        Component(name: "CPU A", desc: "Dual (2) Core", wattUsage: 60, type: .processor, performancePoint: 30, imageName: "cpu-dualcore"),
        Component(name: "CPU B", desc: "Quad (4) Core", wattUsage: 90, type: .processor, performancePoint: 50, imageName: "cpu-quadcore"),
        Component(name: "CPU C", desc: "Octa (8) Core", wattUsage: 120, type: .processor, performancePoint: 80, imageName: "cpu-octacore"),
        
        Component(name: "4GB", desc: "", wattUsage: 2, type: .ram, performancePoint: 30, imageName: "ram-4gb"),
        Component(name: "8GB", desc: "", wattUsage: 4, type: .ram, performancePoint: 60, imageName: "ram-8gb"),
        Component(name: "16GB", desc: "", wattUsage: 6, type: .ram, performancePoint: 90, imageName: "ram-16gb"),
        
        Component(name: "Hard Disk (HDD)", desc: "500GB", wattUsage: 10, type: .storage, performancePoint: 30, imageName: "storage-hdd"),
        Component(name: "Solid State Drive (SSD)", desc: "500GB", wattUsage: 5, type: .storage, performancePoint: 70, imageName: "storage-ssd"),
        
        Component(name: "Integrated GPU", desc: "2GB Shared Memory", wattUsage: 45, type: .gpu, performancePoint: 30, imageName: "gpu-integrated"),
        Component(name: "Dedicated GPU A", desc: "4GB Memory", wattUsage: 130, type: .gpu, performancePoint: 45, imageName: "gpu-low"),
        Component(name: "Dedicated GPU B", desc: "6GB Memory", wattUsage: 220, type: .gpu, performancePoint: 60, imageName: "gpu-mid"),
        Component(name: "Dedicated GPU C", desc: "8GB Memory", wattUsage: 410, type: .gpu, performancePoint: 80, imageName: "gpu-high"),
        
        Component(name: "PSU A", desc: "250W", wattUsage: 0, type: .powerSupply, capacity: 250, imageName: "psu-1"),
        Component(name: "PSU B", desc: "400W", wattUsage: 0, type: .powerSupply, capacity: 400, imageName: "psu-2"),
        Component(name: "PSU C", desc: "600W", wattUsage: 0, type: .powerSupply, capacity: 600, imageName: "psu-3")
    ]
    
    @Published var selectedCPU: Component?
    @Published var selectedRAM: Component?
    @Published var selectedStorage: Component?
    @Published var selectedGPU: Component?
    @Published var selectedPSU: Component?
    
    func getComponentList(type: ComponentType) -> [Component] {
        var reducedComponentList: [Component] = []
        
        reducedComponentList = componentList.filter { $0.type == type }
        
        return reducedComponentList
    }
    
    func updateSelectedComponent(ofType type: ComponentType, with component: Component) {
        switch type {
        case .processor:
            self.selectedCPU = component
        case .motherboard:
            print("motherboard changed")
        case .storage:
            self.selectedStorage = component
        case .ram:
            self.selectedRAM = component
        case .gpu:
            self.selectedGPU = component
        case .powerSupply:
            self.selectedPSU = component
        }
    }
    
    func isThisComponentSelected(component: Component) -> Bool {
        var isSelected = false
        
        switch component.type {
        case .processor:
            isSelected = selectedCPU?.id == component.id
        case .motherboard:
            isSelected = false
        case .storage:
            isSelected = selectedStorage?.id == component.id
        case .ram:
            isSelected = selectedRAM?.id == component.id
        case .gpu:
            isSelected = selectedGPU?.id == component.id
        case .powerSupply:
            isSelected = selectedPSU?.id == component.id
        }
        
        return isSelected
    }
}
