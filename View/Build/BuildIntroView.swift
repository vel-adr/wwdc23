//
//  BuildIntroView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 18/04/23.
//

import SwiftUI

struct BuildIntroView: View {
    @Binding var isShowingOverlay: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                HStack(alignment: .top) {
                    Image("koala")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    VStack(alignment: .leading) {
                        Text("Welcome to my special playground where you can try to do experiment combining different PC components and see their effect on the PC's performance. Here, I have already prepared a good amount of PC components that you can choose to build a PC.")
                            .padding()
                        Text("After you pick the components that you want, click the button to go to the next page and run a benchmark to see the PC's performance. Also, don't be afraid to try crazy combinations. You can always go back and change the components as many times as you wants!")
                            .padding()
                        Text("Finally, I have prepared the best motherboards for you so that you have more flexibility in choosing other components. So, what you're waiting for? Go have some fun!")
                            .padding()
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color("tes"))
                    .cornerRadius(8)
                }
                .padding(.vertical)
                .padding(.bottom)
                
                Button {
                    withAnimation {
                        isShowingOverlay.toggle()
                    }
                } label: {
                    Text("Start building!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("tes"))
            }
            .padding()
            .background(.thinMaterial)
//            .cornerRadius(8)
        }
        
    }
}

//struct BuildIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildIntroView()
//    }
//}
