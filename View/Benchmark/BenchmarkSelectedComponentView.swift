//
//  BenchmarkSelectedComponentView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 19/04/23.
//

import SwiftUI

struct BenchmarkSelectedComponentView: View {
    var component: Component?
    
    var body: some View {
        VStack {
            Text(component?.type.rawValue ?? "")
                .font(.title3)
                .fontWeight(.medium)
                .lineLimit(2)
            if component?.imageName == nil {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 100)
            } else {
                Image(component?.imageName ?? "cpu-dualcore")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 100)
            }
            Text(component?.name ?? "N/A")
                .padding(2)
            if component?.desc != "" {
                Text(component?.desc ?? "")
                    .font(.caption)
            }
        }
        .padding()
    }
}

//struct BenchmarkSelectedComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        BenchmarkSelectedComponentView()
//    }
//}
