//
//  SignInView.swift
//  GameCard
//
//  Created by wayne on 2021/9/28.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Text("Sign In")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            
            
            Spacer()
            
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
