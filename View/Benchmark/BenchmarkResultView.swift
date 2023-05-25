//
//  BenchmarkResultView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 16/04/23.
//

import SwiftUI

struct BenchmarkResultView: View {
    @State var isLoading = false
    @State var isBenchmarkResultAvailable = false
    @State var isShowingOverlay = false
    @ObservedObject var vm: BuildPCViewModel
    @StateObject var benchVM = BenchmarkViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color("g1"), Color("g2")
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Your PC Build:")
                        .font(.largeTitle)
                        .bold()
                    HStack(alignment: .top) {
                        BenchmarkSelectedComponentView(component: vm.selectedCPU)
                            .padding(.horizontal)
                        BenchmarkSelectedComponentView(component: vm.selectedRAM)
                            .padding(.horizontal)
                        BenchmarkSelectedComponentView(component: vm.selectedStorage)
                            .padding(.horizontal)
                        BenchmarkSelectedComponentView(component: vm.selectedGPU)
                            .padding(.horizontal)
                        BenchmarkSelectedComponentView(component: vm.selectedPSU)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.regularMaterial)
                    
                    Text("Total power consumption: \(benchVM.getPCPowerConsumption())W")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                }
                .padding()
                .background(.thinMaterial)
                .padding()
                
                if benchVM.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2.5, anchor: .center)
                        .frame(height: 100)
                }
                
                if benchVM.isBenchmarkResultAvailable {
                    VStack {
                        Text("Benchmark Result")
                            .font(.largeTitle)
                            .bold()
                        ScrollView {
                            if #available(iOS 16.0, *) {
                                HStack {
                                    VStack {
                                        Gauge(value: benchVM.getPerformancePercentage(standard: .casual), in: 0...100) {
                                            Text("Daily Use (Browsing, Office Work, Multimedia)")
                                        } currentValueLabel: {
                                            Text(benchVM.getPerformanceLabel(for: .casual))
                                        }
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(8)
                                        
                                        Gauge(value: benchVM.getPerformancePercentage(standard: .casualGaming), in: 0...100) {
                                            Text("Casual Gaming")
                                        } currentValueLabel: {
                                            Text(benchVM.getPerformanceLabel(for: .casualGaming))
                                        }
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(8)
                                        
                                        Gauge(value: benchVM.getPerformancePercentage(standard: .esportGaming), in: 0...100) {
                                            Text("E-Sport Gaming")
                                        } currentValueLabel: {
                                            Text(benchVM.getPerformanceLabel(for: .esportGaming))
                                        }
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(8)
                                        
                                        Gauge(value: benchVM.getPerformancePercentage(standard: .AAAGaming), in: 0...100) {
                                            Text("AAA Gaming")
                                        } currentValueLabel: {
                                            Text(benchVM.getPerformanceLabel(for: .AAAGaming))
                                        }
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(8)
                                    }
                                    
                                    VStack {
                                        Gauge(value: benchVM.getPerformancePercentage(standard: .videoEditing), in: 0...100) {
                                            Text("Video Editing")
                                        } currentValueLabel: {
                                            Text(benchVM.getPerformanceLabel(for: .videoEditing))
                                        }
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(8)
                                        
                                        Gauge(value: benchVM.getPerformancePercentage(standard: .rendering), in: 0...100) {
                                            Text("3D Modelling/Rendering")
                                        } currentValueLabel: {
                                            Text(benchVM.getPerformanceLabel(for: .rendering))
                                        }
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(8)
                                        
                                        Gauge(value: benchVM.getPerformancePercentage(standard: .webProgramming), in: 0...100) {
                                            Text("Web Programming")
                                        } currentValueLabel: {
                                            Text(benchVM.getPerformanceLabel(for: .webProgramming))
                                        }
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(8)
                                        
                                        Gauge(value: benchVM.getPerformancePercentage(standard: .mobileProgramming), in: 0...100) {
                                            Text("Mobile Programming")
                                                .help("Test")
                                        } currentValueLabel: {
                                            Text(benchVM.getPerformanceLabel(for: .mobileProgramming))
                                        }
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(8)
                                    }
                                }
                            } else {
                                HStack {
                                    VStack {
                                        ProgressView("Daily Use (Browsing, Office Work, Multimedia) - \(benchVM.getPerformanceLabel(for: .casual))", value: benchVM.getPerformancePercentage(standard: .casual), total: 100)
                                            .padding()
                                        ProgressView("Casual gaming  - \(benchVM.getPerformanceLabel(for: .casualGaming))", value: benchVM.getPerformancePercentage(standard: .casualGaming), total: 100)
                                            .padding()
                                        ProgressView("E-Sport Gaming - \(benchVM.getPerformanceLabel(for: .esportGaming))", value: benchVM.getPerformancePercentage(standard: .esportGaming), total: 100)
                                            .padding()

                                        ProgressView("AAA Gaming - \(benchVM.getPerformanceLabel(for: .AAAGaming))", value: benchVM.getPerformancePercentage(standard: .AAAGaming), total: 100)
                                            .padding()

                                    }
                                    VStack {
                                        ProgressView("Video Editing - \(benchVM.getPerformanceLabel(for: .videoEditing))", value: benchVM.getPerformancePercentage(standard: .videoEditing), total: 100)
                                            .padding()

                                        ProgressView("3D Modelling/Rendering - \(benchVM.getPerformanceLabel(for: .rendering))", value: benchVM.getPerformancePercentage(standard: .rendering), total: 100)
                                            .padding()

                                        ProgressView("Web Programming - \(benchVM.getPerformanceLabel(for: .webProgramming))", value: benchVM.getPerformancePercentage(standard: .webProgramming), total: 100)
                                            .padding()

                                        ProgressView("Mobile Programming - \(benchVM.getPerformanceLabel(for: .mobileProgramming))", value: benchVM.getPerformancePercentage(standard: .mobileProgramming), total: 100)
                                            .padding()
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .background(.thinMaterial)
                    .padding()
                }
                //
                Button {
                    withAnimation {
                        benchVM.runBenchmark()
                    }
                } label: {
                    HStack {
                        Text("Run Benchmark")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Image(systemName: "play.fill")
                            .font(.title2)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 40)
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(Color("tes"))
                
                Button {
                    withAnimation {
                        isShowingOverlay.toggle()
                    }
                } label: {
                    HStack {
                        Text("About Benchmark")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Image(systemName: "info.circle")
                            .font(.title2)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 40)
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(Color("tes"))
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Change PC Part")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(Color("tes"))
            }
            
            if isShowingOverlay {
                BenchmarkAboutView(isShowingOverlay: $isShowingOverlay)
            }
        }
        .alert(isPresented: $benchVM.isShowingAlert) {
            Alert(title: Text("Warning!"), message: Text(benchVM.alertMessage), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            guard let cpu = vm.selectedCPU, let ram = vm.selectedRAM, let storage = vm.selectedStorage, let gpu = vm.selectedGPU, let psu = vm.selectedPSU else {
                print("Failed initialize BenchVM")
                return
            }
            benchVM.setupViewModel(cpu: cpu, ram: ram, storage: storage, gpu: gpu, psu: psu)
        }
    }
}

//struct BenchmarkResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        BenchmarkResultView()
//    }
//}
