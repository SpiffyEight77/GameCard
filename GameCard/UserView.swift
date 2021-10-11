//
//  UserView.swift
//  GameCard
//
//  Created by Wayne Wen on 2021/10/9.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject var user: UserStore
    
    var body: some View {
        VStack (spacing: 30) {
            HStack(spacing: 12) {
                Text("Settings")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            //            .padding(.top, 30)
            
            HStack(spacing: 10) {
                Image("notion-avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                Text(UserDefaults.standard.string(forKey: "userName")!)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("background3"))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
            HStack(spacing: 10) {
                
                VStack {
                    HStack {
                        Image(systemName: "pip.exit")
                        Text("Sign out")
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .onTapGesture {
                        UserDefaults.standard.set(false, forKey: "isLogged")
                        UserDefaults.standard.set("", forKey: "userName")
                        UserDefaults.standard.removeObject(forKey: "accessToken")
                        self.user.isLogged = false
                        self.user.showProfile = false
                        self.user.showLogin = false
                    }
                    Divider()
                    HStack {
                        Image(systemName: "terminal.fill")
                        Text("Version")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("0.0.1（Build 2）")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("background3"))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
        }
        .padding()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
            .environmentObject(UserStore())
    }
}
