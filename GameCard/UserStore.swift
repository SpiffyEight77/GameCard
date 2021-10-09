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
    @Published var showLogin = false
    @Published var showProfile = false
}
