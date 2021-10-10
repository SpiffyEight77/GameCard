//
//  ConsolesView.swift
//  GameCard
//
//  Created by wayne on 2021/9/24.
//

import SwiftUI
import SlideOverCard

//struct userTrophySummaryResponse: Codable {
//    var data: Data
//}
//
//extension userTrophySummaryResponse {
//    struct Data: Codable {
//        var trophyLevel: Int
//        var earnedTrophies : EarnedTrophies
//    }
//}
//
//extension userTrophySummaryResponse {
//    struct EarnedTrophies: Codable {
//        var platinum: Int
//        var  gold: Int
//        var silver: Int
//        var bronze: Int
//    }
//}

struct userTrophySummaryResponse {
    
    var trophyLevel: Int
    var platinum: Int
    var  gold: Int
    var silver: Int
    var bronze: Int
    
}

extension userTrophySummaryResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        // 最外层的key
        case data
        
        enum DataKeys: Int, CodingKey {
            // location层对应的key
            case trophyLevel
            case earnedTrophies
            
            enum EarnedTrophiesKeys: Int, CodingKey {
                case platinum
                case gold
                case silver
                case bronze
            }
        }
        
    }
    
    init(from decoder: Decoder) throws {
        
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        // 处理country和city的解码
        let dataContainer = try rootContainer.nestedContainer(keyedBy: CodingKeys.DataKeys.self, forKey: .data)
        trophyLevel = try dataContainer.decode(Int.self, forKey: .trophyLevel)
        
        let earnedTrophiesContainer = try dataContainer.nestedContainer(keyedBy: CodingKeys.DataKeys.EarnedTrophiesKeys.self, forKey: .earnedTrophies)
        platinum = try earnedTrophiesContainer.decode(Int.self, forKey: .platinum)
        gold = try earnedTrophiesContainer.decode(Int.self, forKey: .gold)
        silver = try earnedTrophiesContainer.decode(Int.self, forKey: .silver)
        bronze = try earnedTrophiesContainer.decode(Int.self, forKey: .bronze)
    }
    
}

struct ConsolesView: View {
    
    @State private var psnId: String = ""
    @State private var isEditing = false
    @State private var showingWarningAlert = false
    @State private var showingLoginInAlert = false
    @State private var showProfile = false
    @State private var isSync = false
    @State private var isSyncing = false
    
    @State var show = false
    
    @EnvironmentObject var user: UserStore
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                
                HStack(spacing: 12) {
                    Text("Consoles")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Button(action: {
                        if self.user.isLogged {
                            self.user.showProfile.toggle()
                        } else {
                            self.user.showLogin.toggle()
                        }
                    }) {
                        Image(systemName: "person")
                            .foregroundColor(.primary)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color("background3"))
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    
                    //                    Button(action: { self.showSettings.toggle() }) {
                    //                        Image(systemName: "gear")
                    //                            .foregroundColor(.primary)
                    //                            .font(.system(size: 16, weight: .medium))
                    //                            .frame(width: 36, height: 36)
                    //                            .background(Color("background3"))
                    //                            .clipShape(Circle())
                    //                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    //                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    //                    }
                    //                    .sheet(isPresented: $showSettings) {
                    //                        SettingView()
                    //                    }
                    
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
                        //                        .sheet(isPresented: $showProfile) {
                        //                            StatsView()
                        //                        }
                        
                        VStack {
                            Spacer()
                            HStack {
                                Image("avatar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                Text(UserDefaults.standard.string(forKey: "userName")!)
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
                                    
                                    if self.psnId.isEmpty {
                                        self.showingWarningAlert = true
                                    }
                                    
                                    if !user.isLogged {
                                        self.showingLoginInAlert = true
                                    } else {
                                        self.isSyncing.toggle()
                                    }
                                    //                                    self.isSync.toggle()
                                    
                                    let url = "http://101.35.116.189:3000/sync?psn=" + self.psnId
                                    
                                    let codeUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
                                    
                                    let session = URLSession.shared
                                    let dataTask = session.dataTask(with: codeUrl) { (data, response, error) in
                                        guard let data = data,
                                              let string = String(data: data, encoding: .utf8) else {
                                                  return
                                              }
                                        do {
                                            let res = try JSONDecoder().decode(userTrophySummaryResponse.self, from: data)
                                            UserDefaults.standard.set(psnId, forKey: "userName")
                                            //                                            UserDefaults.standard.set(userTrophySummaryResponse.CodingKeys.DataKeys.trophyLevel, forKey: "trophyLevel")
                                            
                                            let platinum = String(res.platinum)
                                            let gold = String(res.gold)
                                            let  silver = String(res.silver)
                                            let bronze = String(res.bronze)
                                            //                                            print(userTrophySummaryResponse)
                                            UserDefaults.standard.set(platinum, forKey: "platinum")
                                            UserDefaults.standard.set(gold, forKey: "gold")
                                            UserDefaults.standard.set(silver, forKey: "silver")
                                            UserDefaults.standard.set(bronze, forKey: "bronze")
                                            //                                            self.user.showLogin = false
                                            print(res)
                                            self.isSyncing.toggle()
                                            self.isSync = true
                                        } catch let error {
                                            print(error)
                                        }
                                        print(string)
                                        
                                    }
                                    
                                    dataTask.resume()
                                    
                                }
                                .frame(maxWidth: 40, maxHeight:0)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(5)
                            }
                        }
                        .padding()
                        .alert(isPresented: $showingWarningAlert) {
                            Alert(title: Text("Warning"),
                                  message: Text("PSN ID can not be null"),
                                  dismissButton: .default(Text("OK")))
                        }
                        .alert(isPresented: $showingLoginInAlert) {
                            Alert(title: Text("Warning"),
                                  message: Text("You should login in to link with your PSN ID"),
                                  dismissButton: .default(Text("OK")))
                        }
                        .disabled(isSyncing)
                        
                        if isSyncing {
                            ZStack {
                                ProgressView()
                            }
                            .frame(width:200, height: 200, alignment: .center)
                        }
                    }
                }
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .slideOverCard(isPresented: $user.showLogin) {
            // Here goes your awesome content
            SignInView()
        }
        .slideOverCard(isPresented: $showProfile) {
            // Here goes your awesome content
            TrophyView()
        }
        .slideOverCard(isPresented: $user.showProfile) {
            UserView()
        }
        
    }
}

struct ConsolesView_Previews: PreviewProvider {
    static var previews: some View {
        ConsolesView()
            .preferredColorScheme(.light)
            .environmentObject(UserStore())
    }
}
