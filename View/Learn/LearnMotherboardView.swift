//
//  LearnMotherboardView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 20/04/23.
//

import SwiftUI

struct LearnMotherboardView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack() {
            Text("Motherboard")
                .font(.largeTitle)
                .fontWeight(.bold)
            Divider()
            
            VStack {
                Image("mobo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                VStack(alignment: .leading) {
                    Text("Motherboard is the component that unites all other components in your computer system. It provides many different slots to install your CPU, RAM, Storage, GPU, etc. The first thing to look out when choosing a motherboard is to find the one that fits your CPU socket. CPUs, even which come from the same brand, can have different type of socket. If the socket doesn't fit, you can't install the CPU.")
                        .padding(.bottom)
                    Text("From there, it is more flexible. You can find a motherboard that has the feature you need. It may be the one which have more RAM slots, the one that has built-in Wi-Fi module, etc.")
                        .padding(.bottom)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .background(.thickMaterial)
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                Text("Close")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 30)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("tes"))
        }
        .padding()
    }
}

struct LearnMotherboardView_Previews: PreviewProvider {
    static var previews: some View {
        LearnMotherboardView()
    }
}
