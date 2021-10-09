//
//  TrophyView.swift
//  GameCard
//
//  Created by Wayne Wen on 2021/10/9.
//

import SwiftUI

struct TrophyView: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Text("Stats")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }.padding(.horizontal)
            .padding(.leading, 14)
            
            HStack(spacing: 10) {
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("Nekocon233")
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            HStack(spacing: 30) {
                VStack {
                    Image("platinum")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    Text("9")
                        .fontWeight(.semibold)
                    
                }
                
                VStack {
                    Image("gold")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    Text("32")
                        .fontWeight(.semibold)
                }
                
                VStack {
                    Image("silver")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    Text("119")
                        .fontWeight(.semibold)
                }
                
                
                VStack {
                    Image("bronze")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text("794")
                        .fontWeight(.semibold)
                }
                
            }
        }.padding()
    }
}

struct TrophyView_Previews: PreviewProvider {
    static var previews: some View {
        TrophyView()
    }
}
