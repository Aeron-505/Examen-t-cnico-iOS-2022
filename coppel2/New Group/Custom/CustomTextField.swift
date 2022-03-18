//
//  CustomTextField.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.

import SwiftUI

struct CustomTextField: View {
    var image: String
    var title: String
    var color : Color
    var isEmail: Bool = false
    var isPassword: Bool = false
    
    @State var securityTextField: Bool = false
    @Binding var value: String
    
    var animation: Namespace.ID
    
    var body: some View{
        VStack(spacing: 6){
            HStack(alignment: .bottom){
                Image(systemName: image)
                    .font(.custom("LansburyGDemoSans", size: 15))
                    .foregroundColor(color)
                VStack(alignment: .leading, spacing: 6){
                    if value != ""{
                        Text(title)
                            .font(.custom("LansburyGDemoSans", size: 15))
                            .foregroundColor(color)
                            .matchedGeometryEffect(id: title, in: animation)
                    }
                    ZStack(alignment: Alignment(horizontal: . leading, vertical: . center)){
                        if value == ""{
                            Text(title)
                                .font(.custom("LansburyGDemoSans", size: 15))
                                .foregroundColor(color)
                                .matchedGeometryEffect(id: title, in: animation)
                        }
                        
                        if securityTextField{
                            SecureField("", text: $value)
                                .foregroundColor(color)
                        }else{
                            TextField("", text: $value)
                                .foregroundColor(color)
                        }
                    }
                }
                if isPassword{
                    Button(action: {
                        securityTextField.toggle()
                    }) {
                        Image(systemName: securityTextField ? "eye.slash" :  "eye")
                            .font(.custom("LansburyGDemoSans", size: 15))
                            .foregroundColor(color)
                    }
                }
            }
            if value == ""{
                Divider()
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(Color.clear.opacity(value != "" ? 1 : 0))
        .cornerRadius(8)
        .padding(.horizontal)
        .padding(.top)
        .animation(.linear)
    }
}


struct CustomFieldText_Previews: PreviewProvider {
    @Namespace static var animation
    @State var test = ""
    
    static var previews: some View {
        CustomTextField(image: "iphone", title: "Prueba", color: Color("GreenLight"), value: .constant(""), animation: animation)
        CustomTextField(image: "iphone", title: "Prueba", color: Color("GreenLight"), value: .constant(""),animation: animation)
            .preferredColorScheme(.dark)
    }
}
