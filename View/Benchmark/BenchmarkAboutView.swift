//
//  BenchmarkAboutView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 18/04/23.
//

import SwiftUI

struct BenchmarkAboutView: View {
    @Binding var isShowingOverlay: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("About Benchmark")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(alignment: .top) {
                    Image("koala")
                        .resizable()
                        .scaledToFit()
                         .frame(height: 200)
                    VStack(alignment: .leading) {
                        Text("These benchmarks are simplification of real benchmarks to see how a component affect the computer's performance in selected common scenario. I hope they can be a good start to give you a rough idea of what components to prioritize when you want to build or buy a computer that suits your needs.")
                            .font(.title3)
                            .padding()
                        Text("I try to design the formula that is used for the benchmark calculation to resemble and mimic how a real computer would perform. For example: for gaming, I place the GPU as the most influential factor in determining the score.")
                            .font(.title3)
                            .padding()
                    }
                    .foregroundColor(.white)
                    .background(Color("tes"))
                    .cornerRadius(8)
                }
                .padding(.bottom)
                
                Button {
                    withAnimation {
                        isShowingOverlay.toggle()
                    }
                } label: {
                    Text("Go back")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 30)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("tes"))
            }
            .padding()
//            .background(.white.opacity(0.6))
            .background(.thinMaterial)
        }
        
    }
}

//struct BenchmarkAboutView_Previews: PreviewProvider {
//    static var previews: some View {
//        BenchmarkAboutView()
//    }
//}
