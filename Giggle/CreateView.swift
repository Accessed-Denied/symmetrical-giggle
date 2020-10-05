//
//  CreateView.swift
//  Giggle
//
//  Created by Rohit Saini on 30/09/20.
//

import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = CreateChallengeViewModel()
    @State private var isActive = false
    
    var dropdownList: some View{
        ForEach(viewModel.dropdowns.indices, id: \.self){ index in
            DropDownView(viewModel: $viewModel.dropdowns[index])
        }
    }
    var body: some View {
        ScrollView{
            VStack{
                dropdownList
                Spacer()
                NavigationLink(destination: RemindView(),isActive: $isActive){
                    Button(action:{
                        isActive = true
                    }){
                        Text("Next").font(.system(size: 24,weight:.medium))
                    }
                    .padding()
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
