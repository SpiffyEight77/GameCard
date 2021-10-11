//
//  TrophyView.swift
//  GameCard
//
//  Created by Wayne Wen on 2021/10/9.
//

import SwiftUI
import Kingfisher

struct TrophyView: View {
    @EnvironmentObject var user: UserStore
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Text("Stats")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }.padding(.horizontal)
                .padding(.leading, 14)
            
            HStack(spacing: 10) {
                KFImage(URL(string: UserDefaults.standard.string(forKey: "avatar")!)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(UserDefaults.standard.string(forKey: "psnId")!)
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
                    Text(UserDefaults.standard.string(forKey: "platinum")!)
                        .fontWeight(.semibold)
                    
                }
                
                VStack {
                    Image("gold")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    Text(UserDefaults.standard.string(forKey: "gold")!)
                        .fontWeight(.semibold)
                }
                
                VStack {
                    Image("silver")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    Text(UserDefaults.standard.string(forKey: "silver")!)
                        .fontWeight(.semibold)
                }
                
                
                VStack {
                    Image("bronze")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text(UserDefaults.standard.string(forKey: "bronze")!)
                        .fontWeight(.semibold)
                }
                
            }
        }
        .padding()
    }
}

struct TrophyView_Previews: PreviewProvider {
    static var previews: some View {
        TrophyView()
    }
}
