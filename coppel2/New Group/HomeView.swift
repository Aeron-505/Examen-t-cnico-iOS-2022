//
//  SignInRequest.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.
//
import SwiftUI

struct HomeView: View {
    @State private var showActionSheet = false
    @State private var showProfile = false
    @State private var logout = false
    @ObservedObject private var homeVM = HomeViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button(action: {
                        showActionSheet.toggle()
                    }){
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding(.top)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .frame(height: 100)
                    }
                }
                .background(Color("blue"))
                .edgesIgnoringSafeArea(.top)
                ScrollView(showsIndicators: false){
                    ForEach(homeVM.popularMovie.results){movie in
                        CustomCardMovie(image: movie.poster_path, title: movie.title, release_date: movie.release_date, vote_count: movie.vote_count, overview: movie.overview)
                        }
                    .onAppear(){
                        homeVM.getPopularMovies()
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.black).opacity(0.8)
            }
            NavigationLink(destination: ProfileView(),
                           isActive: $showProfile) {
                EmptyView()
            }
            NavigationLink(destination: LoginView(),
                           isActive: $logout) {
                EmptyView()
            }
        }
        
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("What do you want to do?"), buttons: [
                .default(Text("View Profile")) {
                    showProfile.toggle()
                },
                .default(Text("Log Out")) {
                    UserDefaults.standard.set(false, forKey: "auth")
                    logout.toggle()
                },
                .cancel()
            ])
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
