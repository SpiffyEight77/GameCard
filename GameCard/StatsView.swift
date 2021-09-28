//
//  StatsView.swift
//  GameCard
//
//  Created by wayne on 2021/9/24.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 12) {
                    Text("Stats")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "arrow.clockwise.circle")
                            .foregroundColor(.primary)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color("background3"))
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                }.padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                HStack(spacing: 10) {
                    Image("avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text("Nekocon233")
                        .fontWeight(.semibold)
                    Spacer()
                    Image("bronze3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    Text("Level 253")
                        .fontWeight(.semibold)
                }.padding()
            }
            
            VStack(alignment: .center){
                HStack(spacing: 50) {
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
            
            VStack {
                Text("Games played")
                    .fontWeight(.semibold)
            }.padding()
            
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    Image("game1").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                    VStack(alignment: .leading) {
                        Text("Kena: Bridge of Spirits")
                            .fontWeight(.semibold)
                        HStack(spacing: 15) {
                            VStack {
                                Image("platinum")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("0")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("gold")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("0")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("silver")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("0")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("bronze")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("11")
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                            VStack {
                                Text("16%")
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                        }
                    }
                }
            }.padding()
            
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    Image("game2").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                    VStack(alignment: .leading) {
                        Text("Ghost of Tsushima")
                            .fontWeight(.semibold)
                        HStack(spacing: 15) {
                            VStack {
                                Image("platinum")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("1")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("gold")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("4")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("silver")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("13")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("bronze")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("55")
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                            VStack {
                                Text("96%")
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                        }
                    }
                }
            }.padding()
            
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    Image("game3").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                    VStack(alignment: .leading) {
                        Text("英雄伝説 零の軌跡：改")
                            .fontWeight(.semibold)
                        HStack(spacing: 15) {
                            VStack {
                                Image("platinum")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("0")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("gold")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("0")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("silver")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("1")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("bronze")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("20")
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                            VStack {
                                Text("31%")
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                        }
                    }
                }
            }.padding()
            
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    Image("game4").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                    VStack(alignment: .leading) {
                        Text("Ratchet & Clank™")
                            .fontWeight(.semibold)
                        HStack(spacing: 15) {
                            VStack {
                                Image("platinum")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("1")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("gold")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("2")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("silver")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("14")
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Image("bronze")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("30")
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                            VStack {
                                Text("100%")
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                        }
                    }
                }
            }.padding()
            
            
        }
        
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
        
    }
}
