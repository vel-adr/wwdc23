//
//  LearnStorageView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 19/04/23.
//

import SwiftUI

struct LearnStorageView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack() {
            Text("Storage")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Non-Volatile Storage")
                .padding(.bottom)
            Divider()
            
            VStack {
                HStack {
                    Image("storage-hdd")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .padding()
                    Image("storage-ssd")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .padding()
                }
                
                VStack(alignment: .leading) {
                    Text("Storage! Just like the name said, its job is to store data. But this storage I'm talking about is the non-volatile storage, which means the data it contains will not dissapear when the power is shut down.")
                        .padding(.bottom)
                    Text("There are 2 types of common storage used in a computer nowadays: a hard disk (HDD) and a solid state drive (SSD). Hard disk is the slower one compared to an SSD because it works mechanically by spinning a literal disks to read and store data. But, while it is slower than an SSD, you can get much bigger capacity with the same price.")
                        .padding(.bottom)
                    Text("As explained before, SSD or Solid State Drive on the other hand comes with faster speed. It is possible because SSD works with no mechanical mechanism. It stores data in a memory chip instead of a disk. SSD is lighter and use less power than a hard disk, but it is more expensive.")
                        .padding(.bottom)
                    Text("The speed of storage can affect your smoothness in performing tasks on the computer greatly.")
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

struct LearnStorageView_Previews: PreviewProvider {
    static var previews: some View {
        LearnStorageView()
    }
}
