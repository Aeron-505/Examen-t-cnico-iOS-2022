//
//  ContentView.swift
//  coppel2
//
//  Created by Macbook air Aeron505 on 16/03/22.
//

import SwiftUI

struct ContentView: View {
    @State var isActive:Bool = false
    @State private var auth = UserDefaults.standard.bool(forKey: "auth")
    
    var body: some View {
        NavigationView{
            VStack {
                if self.isActive {
                    if auth{
                        HomeView()
                    }else{
                        LoginView()
                    }
                } else {
                    SplashView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class RefreshActionPerformer: ObservableObject {
    @Published private(set) var isPerforming = false
    
    func perform(_ action: RefreshAction) async {
        guard !isPerforming else { return }
        isPerforming = true
        await action()
        isPerforming = false
    }
}
