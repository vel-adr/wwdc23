//
//  RakitPCView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 14/04/23.
//

import SwiftUI

struct BuildPCView: View {
    @State var isShowOverlay = true
    @StateObject var vm = BuildPCViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color("g1"), Color("g2")
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    ForEach(ComponentType.allCases) { type in
                        if type != .motherboard {
                            VStack {
                                Text("\(type.rawValue):")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding()
                                
                                ComponentListView(vm: vm, componentType: type)
                                    .padding(.bottom, 32)
                            }
                            .background(.thinMaterial)
                            .cornerRadius(8)
                            .padding(.vertical)
                        }
                    }
                }
                
                NavigationLink {
                    BenchmarkResultView(vm: vm)
                } label: {
                    Text("Continue")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("tes"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.vertical)
                Spacer()
            }
            .padding(.horizontal)
            
            ZStack {
                if isShowOverlay {
                    BuildIntroView(isShowingOverlay: $isShowOverlay)
                        .transition(.opacity)
                        .animation(.easeOut(duration: 1.5))
                }
            }
            .zIndex(2.0)
        }
        .navigationBarBackButtonHidden(isShowOverlay ? true : false)
    }
}

//struct RakitPCView_Previews: PreviewProvider {
//    static var previews: some View {
//        RakitPCView()
//    }
//}
