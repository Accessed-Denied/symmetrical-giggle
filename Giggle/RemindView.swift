//
//  RemindView.swift
//  Giggle
//
//  Created by Rohit Saini on 30/09/20.
//

import SwiftUI

struct RemindView: View {
    var body: some View{
        VStack{
            Spacer()
           // DropDownView()
            Spacer()
            Button(action:{}){
                Text("Create")
                    .font(.system(size: 24,weight:.medium))
                    .foregroundColor(.primary)
            }.padding(.bottom,10)
            Button(action:{}){
                Text("Skip")
                    .font(.system(size: 24,weight:.medium))
                    .foregroundColor(.primary)
            }
        }.navigationTitle("Remind")
        //.navigationBarBackButtonHidden(true)
        
    }
}

struct RemindView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RemindView()
        }
    }
}
