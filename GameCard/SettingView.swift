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
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                HStack(spacing: 10) {
                    Image("avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    Text("Nekocon233")
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
                            Image(systemName: "eyes")
                            Text("Appearances")
                                .fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                        Divider()
                        HStack {
                            Image(systemName: "circle.grid.cross.fill")
                            Text("Unbind PSN")
                                .fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                        Divider()
                        HStack {
                            Image(systemName: "pip.exit")
                            Text("Sign out")
                                .fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                    }
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("background3"))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                
                HStack(spacing: 10) {
                    VStack {
                        HStack {
                            Image(systemName: "doc.fill")
                            Text("Privacy Policy")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        Divider()
                        HStack {
                            Image(systemName: "doc.fill")
                            Text("Terms of Service")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("background3"))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                
                HStack(spacing: 10) {
                    VStack {
                        HStack {
                            Image(systemName: "terminal.fill")
                            Text("Version")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("0.0.1（Build 1）")
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
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
