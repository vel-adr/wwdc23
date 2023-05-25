//
//  LearnButton.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 18/04/23.
//

import SwiftUI

struct LearnButton: View {
    var function: () -> Void
    let imageName: String
    
    var body: some View {
        Button {
            self.function()
        } label: {
            Text("\(imageName)")
        }
        .buttonStyle(.borderedProminent)
        .frame(height: 30)
        .padding()
    }
}

//struct LearnButton_Previews: PreviewProvider {
//    static var previews: some View {
//        LearnButton()
//    }
//}
