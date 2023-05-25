//
//  LearnView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 18/04/23.
//

import SwiftUI

struct LearnView: View {
    @State private var componentType: ComponentType? = nil
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color("g1"), Color("g2")
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Learn about PC Components")
                        .font(.largeTitle)
                        .bold()
                    HStack(alignment: .top) {
                        Image("koala")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .padding()
                        VStack(alignment: .leading) {
                            Group {
                                Text("Hi there! In this menu you will learn more about PC Components. I will make the explanation simple enough so you can understand it better!")
                                    .font(.title2)
                                    .padding(.bottom)
                                Text("Below, you can see some common PC components. To learn about it, just tap on the component that you want to know about.")
                                    .font(.title2)
                            }
                            .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color("tes"))
                        .cornerRadius(8)
                    }
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(8)
                .padding()
                
                
                VStack {
                    Text("Component List:")
                        .font(.title)
                        .bold()
                    ScrollView {
                        HStack(spacing: 32) {
                            Button {
                                componentType = .processor
                                showSheet.toggle()
                            } label: {
                                VStack {
                                    Image("cpu-dualcore")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                    Text("CPU")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.black)
                                }
                                .padding(32)
                                .background(.secondary)
                                .cornerRadius(8)
                            }
                            
                            Button {
                                componentType = .motherboard
                                showSheet.toggle()
                            } label: {
                                VStack {
                                    Image("mobo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                    Text("Motherboard")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.black)
                                }
                                .padding(32)
                                .background(.secondary)
                                .cornerRadius(8)
                            }
                            
                            Button {
                                componentType = .ram
                                showSheet.toggle()
                            } label: {
                                VStack {
                                    Image("ram-4gb")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                    Text("RAM")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.black)
                                }
                                .padding(32)
                                .background(.secondary)
                                .cornerRadius(8)
                            }
                        }
                        .padding(.bottom, 32)
                        HStack(spacing: 32) {
                            Button {
                                componentType = .storage
                                showSheet.toggle()
                            } label: {
                                VStack {
                                    Image("storage-hdd")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                    Text("Storage")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.black)
                                }
                                .padding(32)
                                .background(.secondary)
                                .cornerRadius(8)
                            }
                            
                            Button {
                                componentType = .gpu
                                showSheet.toggle()
                            } label: {
                                VStack {
                                    Image("gpu-low")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                    Text("GPU")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.black)
                                }
                                .padding(32)
                                .background(.secondary)
                                .cornerRadius(8)
                            }
                            
                            Button {
                                componentType = .powerSupply
                                showSheet.toggle()
                            } label: {
                                VStack {
                                    Image("psu-1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                    Text("PSU")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.black)
                                }
                                .padding(32)
                                .background(.secondary)
                                .cornerRadius(8)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(8)
                .padding()
            }
        }
        .sheet(item: $componentType) { componentType in
            LearnComponentSheetView(componentType: componentType)
        }
    }
}

//struct LearnView_Previews: PreviewProvider {
//    static var previews: some View {
//        LearnView()
//    }
//}
