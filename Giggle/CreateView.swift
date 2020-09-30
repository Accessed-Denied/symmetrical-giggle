//
//  CreateView.swift
//  Giggle
//
//  Created by Rohit Saini on 30/09/20.
//

import SwiftUI

struct CreateView: View {
    @State private var isActive = false
    var body: some View {
        ScrollView{
            VStack{
                DropDownView()
                DropDownView()
                DropDownView()
                DropDownView()
                Spacer()
                NavigationLink(destination: RemindView(),isActive: $isActive){
                    Button(action:{
                        isActive = true
                    }){
                        Text("Next").font(.system(size: 24,weight:.medium))
                    }
                }
                
            }.navigationBarTitle("Create")
            .navigationBarBackButtonHidden(true)
        }
    }
}





struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
