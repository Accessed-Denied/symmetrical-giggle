//
//  DropDownView.swift
//  Giggle
//
//  Created by Rohit Saini on 30/09/20.
//

import SwiftUI

struct DropDownView<T: DropDownItemProtocol>:View {
    @Binding var viewModel: T
    var body: some View{
        VStack{
            HStack{
                Text(viewModel.headerTitle)
                    .font(.system(size: 22,weight: .semibold))
                Spacer()
            }.padding(.vertical,10)
            Button(action:{
                viewModel.isSelected = true
            }){
                HStack{
                    Text(viewModel.dropDownTitle)
                        .font(.system(size: 28,weight:.semibold))
                    Spacer()
                    Image(systemName: "arrowtriangle.down.circle")
                        .font(.system(size: 24,weight:.medium))
                }
            }
            .buttonStyle(PrimaryButtonStyle(fillColor: .primaryButton))
            
        }.padding()
    }
}

//struct DropDownView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//        DropDownView()
//        }
//        NavigationView{
//        DropDownView()
//        }.environment(\.colorScheme, .dark)
//    }
//}
