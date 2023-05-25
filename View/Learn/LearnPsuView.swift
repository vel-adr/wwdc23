//
//  LearnPsuView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 19/04/23.
//

import SwiftUI

struct LearnPsuView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack() {
            Text("PSU")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Power Supply Unit")
                .padding(.bottom)
            Divider()
            
            VStack {
                Image("psu-1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                VStack(alignment: .leading) {
                    Text("PSU is the component that supplies power to the system. There are two common types of power supply in the market: non-modular and modular. The difference between those two types is the cable. Modular PSU has detachable cables so you can plug only the cables you need, and vice versa. But keep in mind that modular PSU is more expensive than the non-modular one.")
                        .padding(.bottom)
                    Text("Another thing that is no less important is the capacity of the PSU. Make sure to choose the PSU that has enough power capacity to power up your system. A good rule of thumb is to choose a PSU that has bigger capacity than your system actually need. It is better for the upgradability.")
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

struct LearnPsuView_Previews: PreviewProvider {
    static var previews: some View {
        LearnPsuView()
    }
}
