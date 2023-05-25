//
//  LearnRamView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 19/04/23.
//

import SwiftUI

struct LearnRamView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack() {
            Text("RAM")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Random Access Memory")
                .padding(.bottom)
            Divider()
            
            VStack {
                Image("ram-4gb")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                VStack(alignment: .leading) {
                    Text("RAM or Random Access Memory is actually categorized as a storage. But it is a different kind of storage compared to a Harddisk or SSD. RAM is a volatile storage, which means the data it contains will dissapeared when the power is shut down.")
                        .padding(.bottom)
                    Text("So why would a computer need RAM? RAM is much faster than storage like Harddisk or even SSD. So, its job is to temporarily store resources needed by a running task, so it can be accessed by the CPU quickly.  Think of it like a desk, where you can put the things you need to work from a drawer or other places. And when you are done with that work, you will put things back to where you store it before.")
                        .padding(.bottom)
                    Text("One of the important things to consider when you want to buy or build a computer is choosing the right amount of RAM capacity. The more capacity you get, the more task you can run at a time. RAM is greatly affect PC performance in gaming, video editing, rendering, and often in mobile programming (to run an emulator).")
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

struct LearnRamView_Previews: PreviewProvider {
    static var previews: some View {
        LearnRamView()
    }
}
