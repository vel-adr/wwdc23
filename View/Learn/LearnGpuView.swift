//
//  LearnGpuView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 19/04/23.
//

import SwiftUI

struct LearnGpuView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack() {
            Text("GPU")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Graphics Processing Unit")
                .padding(.bottom)
            Divider()
            
            VStack {
                Image("gpu-low")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                VStack(alignment: .leading) {
                    Text("GPU is the component that produce beautiful image and smooth video we see on the monitor. Without it, all we can see is a black screen. There are two types of GPU: integrated and dedicated.")
                        .padding(.bottom)
                    Text("Integrated GPU usually comes in one chip with the CPU. Integrated GPU doesn't have its own memory for graphics. Instead, it uses the RAM as its memory to store resources. Because of that, its performance is relatively slower than the dedicated one, but at the same time use less power to operate.")
                        .padding(.bottom)
                    Text("On the other hand, dedicated GPU comes as a whole separate component. It has its own memory and has more powerful performance. Oftentimes, it becomes the component that uses most power in a computer.")
                        .padding(.bottom)
                    Text("GPU is greatly affect a computer performance especially in gaming and graphic related workload like 3D rendering.")
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

struct LearnGpuView_Previews: PreviewProvider {
    static var previews: some View {
        LearnGpuView()
    }
}
