//
//  ProfileView.swift
//  coppel2
//
//  Created by Macbook air Aeron505 on 17/03/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color("green"))
                .padding(/*@START_MENU_TOKEN@*/.trailing, 200.0/*@END_MENU_TOKEN@*/)
                Image("profile")
                    .padding(/*@START_MENU_TOKEN@*/.trailing, 200.0/*@END_MENU_TOKEN@*/)
                Text("                                       @GiovanniPv")
                    .font(.body)
                    .fontWeight(.black)
                    .foregroundColor(Color("green"))
                    .multilineTextAlignment(.trailing)
                    
           
                HStack{
                Text("Favorite Shows")
                    .fontWeight(.black)
                    .foregroundColor(Color("green"))
                    .multilineTextAlignment(.leading)
                    .padding(/*@START_MENU_TOKEN@*/.top, 200.0/*@END_MENU_TOKEN@*/)
            
}
                Spacer()
                ScrollView(.horizontal) {
                    HStack(alignment: .center){
                        Image("spiderman")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 200)
                        Image("wonder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 200)
                        Image("red")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 200)
                    
                    
                    
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
}
    
}
          
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
}

