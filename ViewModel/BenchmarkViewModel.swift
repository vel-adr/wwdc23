//
//  BenchmarkViewModel.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 16/04/23.
//

import Foundation

class BenchmarkViewModel: ObservableObject {
    @Published var cpu: Component?
    @Published var ram: Component?
    @Published var storage: Component?
    @Published var gpu: Component?
    @Published var psu: Component?
    
    @Published var isLoading = false
    @Published var isBenchmarkResultAvailable = false
    @Published var isShowingAlert = false
    @Published var alertMessage = ""
    
    func setupViewModel(cpu: Component, ram: Component, storage: Component, gpu: Component, psu: Component) {
        self.cpu = cpu
        self.ram = ram
        self.storage = storage
        self.gpu = gpu
        self.psu = psu
    }
    
    func getBenchmarkScore(type: ScoreType) -> Double {
        var score: Double = 0
        
        guard let cpuScore = cpu?.performancePoint, let gpuScore = gpu?.performancePoint, let ramScore = ram?.performancePoint, let storageScore = storage?.performancePoint else { return 0 }
        
        switch type {
        case .casual, .programming:
            score = 0.4*Double(cpuScore) + 0.35*Double(ramScore) + 0.25*Double(storageScore)
        case .gaming:
            score = 0.3*Double(cpuScore) + 0.5*Double(gpuScore) + 0.2*Double(ramScore)
        case .videoEditing:
            score = 0.4*Double(cpuScore) + 0.4*Double(ramScore) + 0.2*Double(gpuScore)
        case .rendering:
            score = 0.3*Double(cpuScore) + 0.3*Double(ramScore) + 0.4*Double(gpuScore)
        }
        
        return score
    }
    
    func getPerformancePercentage(standard: BenchmarkType) -> Double {
        var percentage: Double = 0
        var score: Double = 0
        let minimumPerformancePoint = getMinimumPerformancePoint(of: standard)
        
        switch standard {
        case .casual:
            score = getBenchmarkScore(type: .casual)
        case .casualGaming:
            score = getBenchmarkScore(type: .gaming)
        case .esportGaming:
            score = getBenchmarkScore(type: .gaming)
        case .AAAGaming:
            score = getBenchmarkScore(type: .gaming)
        case .videoEditing:
            score = getBenchmarkScore(type: .videoEditing)
        case .rendering:
            score = getBenchmarkScore(type: .rendering)
        case .webProgramming:
            score = getBenchmarkScore(type: .programming)
        case .mobileProgramming:
            score = getBenchmarkScore(type: .programming)
        }
        
        percentage = score > minimumPerformancePoint ? 1 : score/minimumPerformancePoint
//        print("percentage: \(percentage)")
        
        return percentage*100
    }
    
    func getMinimumPerformancePoint(of type: BenchmarkType) -> Double {
        var minimumPerformancePoint = 0
        
        switch type {
        case .casual:
            minimumPerformancePoint = 25
        case .casualGaming:
            minimumPerformancePoint = 30
        case .esportGaming:
            minimumPerformancePoint = 40
        case .AAAGaming:
            minimumPerformancePoint = 55
        case .videoEditing:
            minimumPerformancePoint = 50
        case .rendering:
            minimumPerformancePoint = 65
        case .webProgramming:
            minimumPerformancePoint = 30
        case .mobileProgramming:
            minimumPerformancePoint = 45
        }
        
        return Double(minimumPerformancePoint)
    }
    
    func runBenchmark() {
        isLoading = true
        isBenchmarkResultAvailable = false
        isShowingAlert = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.isPCPoweredUp() {
                self.isBenchmarkResultAvailable = true
            } else {
                if !self.isPcComponentComplete() {
                    self.alertMessage =  "PC can't turn on. Component is missing"
                    self.isShowingAlert = true
                } else if !self.isPCPoweredUp() {
                    self.alertMessage = "PC can't turn on. PSU capacity is lower than power consumed"
                    self.isShowingAlert = true
                }
            }
            self.isLoading = false
        }
    }
    
    func getPCPowerConsumption() -> Int {
        var total = 0
        total = (cpu?.wattUsage ?? 0) + (ram?.wattUsage ?? 0) + (storage?.wattUsage ?? 0) + (gpu?.wattUsage ?? 0)
        return total
    }
    
    func isPCPoweredUp() -> Bool {
        guard let psu = psu else {return false}
        
        return (psu.capacity ?? 0) >= getPCPowerConsumption()
    }
    
    func isPcComponentComplete() -> Bool {
        guard let _ = cpu, let _ = ram, let _ = storage, let _ = gpu, let _ = psu else {return false}
        return true
    }
    
    func getPerformanceLabel(for type: BenchmarkType) -> String {
        let score = getPerformancePercentage(standard: type)
        
        if score == 100 {
            return "Very Good"
        } else if score > 80 {
            return "Good Enough"
        } else {
            return "Not Recommended"
        }
    }
}

enum BenchmarkType {
    case casual
    case casualGaming
    case esportGaming
    case AAAGaming
    case videoEditing
    case rendering
    case webProgramming
    case mobileProgramming
}

enum ScoreType {
    case casual
    case gaming
    case videoEditing
    case rendering
    case programming
}
