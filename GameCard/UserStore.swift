//
//  UserStore.swift
//  GameCard
//
//  Created by Wayne Wen on 2021/10/9.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    
    @Published var isSynced: Bool = UserDefaults.standard.bool(forKey: "isSynced") {
        didSet {
            UserDefaults.standard.set(self.isSynced, forKey: "isSynced")
        }
    }
    
    @Published var accessToken: String = UserDefaults.standard.string(forKey: "accessToken") ?? "" {
        didSet {
            UserDefaults.standard.set(self.accessToken, forKey: "accessToken")
        }
    }
    
    @Published var userName: String = UserDefaults.standard.string(forKey: "userName") ?? "" {
        didSet {
            UserDefaults.standard.set(self.userName, forKey: "userName")
        }
    }
    
    @Published var psnId: String = UserDefaults.standard.string(forKey: "psnId") ?? "" {
        didSet {
            UserDefaults.standard.set(self.psnId, forKey: "psnId")
        }
    }
    
    @Published var avatar: String = UserDefaults.standard.string(forKey: "avatar") ?? "" {
        didSet {
            UserDefaults.standard.set(self.avatar, forKey: "avatar")
        }
    }
    
    
    @Published var platinum: String = UserDefaults.standard.string(forKey: "platinum") ?? "" {
        didSet {
            UserDefaults.standard.set(self.platinum, forKey: "platinum")
        }
    }
    
    @Published var gold: String = UserDefaults.standard.string(forKey: "gold") ?? "" {
        didSet {
            UserDefaults.standard.set(self.gold, forKey: "gold")
        }
    }

    
    @Published var silver: String = UserDefaults.standard.string(forKey: "silver") ?? "" {
        didSet {
            UserDefaults.standard.set(self.silver, forKey: "silver")
        }
    }
    
    @Published var bronze: String = UserDefaults.standard.string(forKey: "bronze") ?? "" {
        didSet {
            UserDefaults.standard.set(self.bronze, forKey: "bronze")
        }
    }
    
//    @Published var trophyLevel: Int = UserDefaults.standard.integer(forKey: "trophyLevel") {
//        didSet {
//            UserDefaults.standard.set(self.trophyLevel, forKey: "trophyLevel")
//        }
//    }
    
    @Published var showLogin = false
    @Published var showProfile = false
}
