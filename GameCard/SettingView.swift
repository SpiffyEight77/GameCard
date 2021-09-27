//
//  SettingView.swift
//  GameCard
//
//  Created by wayne on 2021/9/23.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 12) {
                    Text("Settings")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                }.padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                HStack {
                    
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
