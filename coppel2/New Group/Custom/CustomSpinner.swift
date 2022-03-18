//
//  CustomSpinner.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.
//

import SwiftUI

struct CustomSpinner: View {
    var frameSize: CGFloat = 72
    @State private var isAnimating = false
    
    var foreverAnimation: Animation {
        Animation
            .spring(response: 1, dampingFraction: 0.7, blendDuration: 0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        Image(systemName: "person.crop.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color("green"))
            .frame(width: frameSize)
            .rotationEffect(Angle(degrees: isAnimating ? 360.0 : 0.0))
            .animation(foreverAnimation)
            .onAppear {
                isAnimating = true
            }
    }
}

struct CustomSpinner_Previews: PreviewProvider {
    static var previews: some View {
        CustomSpinner()
    }
}
