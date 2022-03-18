//  LoginView.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.

import SwiftUI

struct LoginView: View {
    @Namespace static var animation
    @ObservedObject var loginMV = LoginViewModel()
    @State var securityTextField = true
    
    var body: some View {
        
        ZStack{
            Image("coppel1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            if loginMV.loading{
                CustomSpinner()
            }
            VStack {
                Spacer()
                Text("Sing In")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("green"))
                    .kerning(1.9)
                    .frame(maxWidth: .infinity, alignment: .leading)
                CustomTextField(image: "envelope", title: "username", color: Color("green"), isEmail: true, value: $loginMV.username, animation: LoginView.animation)
                    .padding()
                CustomTextField(image: "key", title: "paswword", color: Color("green"), isPassword: true, securityTextField: securityTextField, value: $loginMV.password, animation: LoginView.animation)
                    .padding()
                Text(loginMV.error)
                    .foregroundColor(Color("red"))
                NavigationLink(destination: HomeView(),isActive: $loginMV.complete){
                    Button(action: {
                        loginMV.SignIn()
                    }) {
                        Text("Log In")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("green").opacity(!loginMV.isUsernameEmpty() ? 1 : 0.3))
                            .cornerRadius(15)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top,10)
                }
            }
            
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


