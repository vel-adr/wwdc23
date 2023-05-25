//
//  LearnCpuView.swift
//  
//
//  Created by Anselmus Pavel Adriska on 18/04/23.
//

import SwiftUI

struct LearnCpuView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack() {
            Text("CPU")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Central Processing Unit")
                .padding(.bottom)
            Divider()
            
            VStack {
                Image("cpu-dualcore")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                VStack(alignment: .leading) {
                    Text("A CPU or the so-called Processor is the like the 'brain' of a computer. Without it, you computer cannot function. Like the name said, the job of the CPU is to process various tasks or instructions given by the computer program.")
                        .padding(.bottom)
                    Text("Those tasks are received by the CPU and executed by a processing unit called 'core', which is happen to be one of the most important things that affect a CPU performance. But, a core itself can only execute one task at a time. So, the more core a CPU has, the more instructions it can execute at the same time.")
                        .padding(.bottom)
                    Text("CPU is a crucial component of a computer. It is needed to run a computer and perform basic tasks like: office, browsing, and multimedia. And it is a component that affect a computer's performance greatly in programming, video editing, and gaming.")
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
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("tes"))
        }
        .padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LearnCpuView()
    }
}
