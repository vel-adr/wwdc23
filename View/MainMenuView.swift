//
//  MainMenuView.swift
//  wwdc23
//
//  Created by Anselmus Pavel Adriska on 18/04/23.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [
                    Color("g1"), Color("g2")
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Text("Build PC With Vel")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        HStack(alignment: .top) {
                            Image("koala")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .padding()
                            VStack {
                                Text("Hello, I'm Vel! In this playground, I will try to help you understand about the components used in a PC and their effect on PC performance.")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding(.bottom)
                                Text("Don't worry if you don't have prior knowledge about PC components. You can learn about it in the \"Learn about PC Component\" menu. And when you're ready, you can try to build your first PC in the \"Build a PC\" menu. Have fun!")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color("tes"))
                            .cornerRadius(8)
                        }
                        .padding(.bottom)
                        
                        HStack {
                            NavigationLink {
                                LearnView()
                            } label: {
                                Text("Learn about PC Component")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .padding(.horizontal)
                                    .background(Color("tes"))
                                    .cornerRadius(8)
                            }
                            
                            Spacer()

                            NavigationLink {
                                BuildPCView()
                            } label: {
                                Text("Build a PC")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .padding(.horizontal)
                                    .background(Color("tes"))
                                    .cornerRadius(8)
                            }
                        }
                        .padding()
                    }
                    .padding()
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(8)
                }
                .padding()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
