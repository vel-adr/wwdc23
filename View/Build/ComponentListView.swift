//
//  ComponentListView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 16/04/23.
//

import SwiftUI

struct ComponentListView: View {
    @ObservedObject var vm: BuildPCViewModel
    
    let componentType: ComponentType
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            ForEach(vm.getComponentList(type: componentType)) { el in
                Button {
                    vm.updateSelectedComponent(ofType: componentType, with: el)
                } label: {
                    VStack {
                        Image(el.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200)
                        Text(el.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        if el.desc != "" {
                            Text(el.desc)
                                .foregroundColor(.black)
                                .padding(2)
                        }
                    }
                    .padding(40)
                    .background(vm.isThisComponentSelected(component: el) ? .green : .secondary)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
            }
            Spacer()
        }
    }
}

//struct ComponentListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComponentListView()
//    }
//}
