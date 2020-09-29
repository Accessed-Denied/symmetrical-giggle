//
//  ContentView.swift
//  Giggle
//
//  Created by Rohit Saini on 29/09/20.
//

import SwiftUI

struct LandingView: View {
    @State private var isActive = false
    var body: some View {
        NavigationView{
            GeometryReader{ proxy in
                VStack{
                    Spacer().frame(height:proxy.size.height * 0.25)
                    Text("Increment")
                        .font(.system(size: 64))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    NavigationLink(destination: Text("Navigated"),isActive: $isActive){
                        Button(action: {
                            isActive = true
                        }){
                            HStack{
                                Spacer()
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 24,weight: .medium))
                                    .foregroundColor(.white)
                                Text("Create a challenge")
                                    .font(.system(size: 24,weight: .medium))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                        .padding(.horizontal,16)
                        .buttonStyle(PrimaryButtonStyle())
                    }
                    
                    
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(
                    Image("landingBg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width)
                        .overlay(Color.black.opacity(0.4))
                        .edgesIgnoringSafeArea(.all)
                )
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
