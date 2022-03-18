//
//  CustomSpinner.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Color.green
            .edgesIgnoringSafeArea(.all)
        Image("splash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 200)
    }
  }
}
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
