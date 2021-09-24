//
//  ConsolesView.swift
//  GameCard
//
//  Created by wayne on 2021/9/24.
//

import SwiftUI

struct ConsolesView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("Consoles")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.top, 54)
                Image("playstation-blue")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20.0)
                    .shadow(radius: 10)
                    .animation(.spring())
                    .padding()
                Image("playstation-black")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20.0)
                    .shadow(radius: 10)
                    .animation(.spring())
                    .padding()
            }
        }.frame(maxWidth: .infinity)
        
    }
}

struct ConsolesView_Previews: PreviewProvider {
    static var previews: some View {
        ConsolesView()
    }
}
