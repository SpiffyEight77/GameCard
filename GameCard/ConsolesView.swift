//
//  ConsolesView.swift
//  GameCard
//
//  Created by wayne on 2021/9/24.
//

import SwiftUI

struct ConsolesView: View {
    
    @State private var psnId: String = ""
    @State private var isEditing = false
    @State private var showingAlert = false
    @State private var showSettings = false
    @State private var showProfile = false
    @State private var isSync = false
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                
                HStack(spacing: 12) {
                    Text("Consoles")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Button(action: { self.showSettings.toggle() }) {
                        Image(systemName: "person")
                            .foregroundColor(.primary)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color("background3"))
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingView()
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                if (isSync) {
                    
                    ZStack {
                        Button(action: {
                            self.showProfile.toggle()
                        }) {
                            Image("playstation-blue")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20.0)
                                .shadow(radius: 10)
                                .animation(.spring())
                                .padding()
                        }
                        .sheet(isPresented: $showProfile) {
                            StatsView()
                        }

                        VStack {
                            Spacer()
                            HStack {
                                Image("avatar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                Text("Nekocon233")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }.padding()
                        }
                        .padding()
                    }
                    
                    
                } else {
                    
                    ZStack {
                        Image("playstation-blue")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20.0)
                            .shadow(radius: 10)
                            .animation(.spring())
                            .padding()
                        
                        VStack {
                            Spacer()
                            HStack {
                                TextField(
                                    "PSN ID",
                                    text: $psnId
                                ) { isEditing in
                                    self.isEditing = isEditing
                                }
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .border(Color(UIColor.separator))
                                .frame(width: 200, height: 50, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.center)
                                
                                Button("Sync") {
                                    self.isSync.toggle()
                                }
                                .frame(maxWidth: 40, maxHeight:0)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(5)
                            }
                        }
                        .padding()
                    }
                }
                
            }
        }.frame(maxWidth: .infinity)
    }
}

struct ConsolesView_Previews: PreviewProvider {
    static var previews: some View {
        ConsolesView()
            .preferredColorScheme(.light)
    }
}
