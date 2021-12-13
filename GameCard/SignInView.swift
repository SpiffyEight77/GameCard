//
//  SignInView.swift
//  GameCard
//
//  Created by wayne on 2021/9/28.
//

import SwiftUI
import GoogleSignIn
import FBSDKLoginKit
import AuthenticationServices

struct AccessTokenResponse: Codable {
    var data: Data
}

extension AccessTokenResponse {
    struct Data: Codable {
        var token: String
    }
}

struct UserInfoResponse: Codable {
    var data: Data
}

extension UserInfoResponse {
    struct Data: Codable {
        var email: String
    }
}

struct SignInView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var currentNonce:String?
    @State private var showingAlert = false
    @State private var isLogging = false
    
    @State private var resId = ""
    @EnvironmentObject var user: UserStore
    
    let signInConfig = GIDConfiguration.init(clientID: "247227499445-jing4i3rhjpb1jvibfoukcc4ljknko2a.apps.googleusercontent.com")
    var body: some View {
        VStack (spacing: 30) {
            HStack(spacing: 12) {
                Text("Sign In")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            //            .padding(.top, 30)
            
            HStack(spacing: 10) {
                Button(action: {
                    self.isLogging.toggle()
                    guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
                    
                    let loginManager = LoginManager()
                    loginManager.logIn(permissions: ["public_profile","email"], from: presentingViewController) { result, error in
                        if let error = error {
                            print("Encountered Erorr: \(error)")
                        } else if let result = result, result.isCancelled {
                            self.isLogging.toggle()
                            print("Cancelled")
                        } else {
                            
                            print("Logged In")
                            print(Profile.current?.userID ?? "")
                            print(Profile.current?.email ?? "")
                            print(AuthenticationToken.current?.tokenString ?? "")
                            print(AccessToken.current?.tokenString ?? "")
                            let semaphore = DispatchSemaphore(value: 0)
                            
                            let url = "https://user-overseas.peropero.net/api/v1/o/facebook/facebookGetToken?" + "&token=" + result!.token!.tokenString + "&user_id=" + result!.token!.userID + "&game_id=musedash" + "&app_id=171760141721705"
                            
                            print(url)
                            
                            let codeUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
                            
                            let session = URLSession.shared
                            let dataTask = session.dataTask(with: codeUrl) { (data, response, error) in
                                guard let data = data,
                                      let string = String(data: data, encoding: .utf8) else {
                                          return
                                      }
                                do {
                                    let res = try JSONDecoder().decode(AccessTokenResponse.self, from: data)
                                    UserDefaults.standard.set(res.data.token, forKey: "accessToken")
                                } catch let error {
                                    print(error)
                                }
                                print(string)
                                
                                semaphore.signal()
                                
                            }
                            
                            dataTask.resume()
                            
                            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
                            
                            let userInfoUrl = "https://user-overseas.peropero.net/api/v1/me/info/"
                            
                            let codeUserInfoUrl = URL(string: userInfoUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
                            var request = URLRequest(url: codeUserInfoUrl)
                            
                            request.setValue(UserDefaults.standard.string(forKey: "accessToken"), forHTTPHeaderField: "Authorization")
                            
                            let UserInfodataTask = session.dataTask(with: request) { (data, response, error) in
                                guard let data = data,
                                      let string = String(data: data, encoding: .utf8) else {
                                          return
                                      }
                                do {
                                    let res = try JSONDecoder().decode(UserInfoResponse.self, from: data)
                                    print(res.data.email)
                                    
                                    let username  = res.data.email.components(separatedBy: "@")
                                    print(username)
                                    UserDefaults.standard.set(username[0], forKey: "userName")
                                    
                                } catch let error {
                                    print(error)
                                }
                                
                                print(string)
                                
                                UserDefaults.standard.set(true, forKey: "isLogged")
                                self.user.isLogged = true
                                self.user.showProfile = true
                                self.user.showLogin = false
                            }
                            
                            UserInfodataTask.resume()
                            
                        }
                    }
                }) {
                    Image("Facebook-white")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                    Text("Sign in with Facebook")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color("background2"))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .disabled(isLogging)
            
            HStack(spacing: 10) {
                Button(action: {
                    self.isLogging.toggle()
                    guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
                    
                    GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: presentingViewController) { user, error in
                        guard error == nil else {
                            self.isLogging.toggle()
                            return
                        }
                        print(user!.authentication.idToken)
                        // If sign in succeeded, display the app's main content View.
                        self.user.showLogin = false
                        let semaphore = DispatchSemaphore(value: 0)
                        
                        let url = "https://user-overseas.peropero.net/api/v1/o/google/googleGetToken?" + "code=" + user!.authentication.idToken! + "&game_id=musedash" + "&app_id=18202803046-7c6313k00mer0tkdgpj4po8mlqgof9nu.apps.googleusercontent.com"
                        
                        let codeUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
                        
                        let session = URLSession.shared
                        let dataTask = session.dataTask(with: codeUrl) { (data, response, error) in
                            guard let data = data,
                                  let string = String(data: data, encoding: .utf8) else {
                                      return
                                  }
                            do {
                                let res = try JSONDecoder().decode(AccessTokenResponse.self, from: data)
                                UserDefaults.standard.set(res.data.token, forKey: "accessToken")
                            } catch let error {
                                print(error)
                            }
                            print(string)
                            
                            semaphore.signal()
                            
                        }
                        
                        dataTask.resume()
                        
                        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
                        
                        let userInfoUrl = "https://user-overseas.peropero.net/api/v1/me/info/"
                        
                        let codeUserInfoUrl = URL(string: userInfoUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
                        var request = URLRequest(url: codeUserInfoUrl)
                        
                        request.setValue(UserDefaults.standard.string(forKey: "accessToken"), forHTTPHeaderField: "Authorization")
                        
                        let UserInfodataTask = session.dataTask(with: request) { (data, response, error) in
                            guard let data = data,
                                  let string = String(data: data, encoding: .utf8) else {
                                      return
                                  }
                            do {
                                let res = try JSONDecoder().decode(UserInfoResponse.self, from: data)
                                print(res.data.email)
                                
                                let username  = res.data.email.components(separatedBy: "@")
                                print(username)
                                UserDefaults.standard.set(username[0], forKey: "userName")
                                
                            } catch let error {
                                print(error)
                            }
                            
                            print(string)
                            
                            UserDefaults.standard.set(true, forKey: "isLogged")
                            self.user.isLogged = true
                            self.user.showProfile = true
                            //                            self.user.showLogin = false
                        }
                        
                        UserInfodataTask.resume()
                        
                    }
                }) {
                    Image("Google")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                    Text("Sign in with Google")
                        .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                    
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color("background3"))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .disabled(isLogging)
            
            SignInWithAppleButton(
                
                onRequest: { request in
                    request.requestedScopes = [.fullName,.email]
                },
                onCompletion: { result in
                    switch result {
                    case .success(let authenticationResults):
                        switch authenticationResults.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            
                            guard let authorizationCode = appleIDCredential.authorizationCode else { return }
                            let authorizationCodeStr = String(decoding: authorizationCode, as: UTF8.self)
                            print(authorizationCodeStr)
                            
                            guard let token = appleIDCredential.identityToken else { return }
                            let tokenStr = String(data: token, encoding: .utf8) ?? ""
                            
                            let userId = appleIDCredential.user
                            let email = appleIDCredential.email ?? ""
                            let fullName = appleIDCredential.fullName
                            let familyName = appleIDCredential.fullName?.familyName ?? ""
                            let givenName = appleIDCredential.fullName?.givenName ?? ""
                            let username = familyName + givenName
                            
                            print(fullName ?? "", email, userId, tokenStr)
                            
                            let semaphore = DispatchSemaphore(value: 0)
                            
                            let url = "https://user.peropero.net/api/v1/o/apple/appleGetToken?" + "name=" + username + "&user_id=" + userId + "&token=" + tokenStr + "&email=" + email + "&app_id=com.spiffyeight77.GameCard"
                            
                            let codeUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
                            
                            let session = URLSession.shared
                            let dataTask = session.dataTask(with: codeUrl) { (data, response, error) in
                                guard let data = data,
                                      let string = String(data: data, encoding: .utf8) else {
                                          return
                                      }
                                do {
                                    let res = try JSONDecoder().decode(AccessTokenResponse.self, from: data)
                                    UserDefaults.standard.set(res.data.token, forKey: "accessToken")
                                    self.user.showLogin = false
                                } catch let error {
                                    print(error)
                                }
                                print(string)
                                
                                semaphore.signal()
                                
                            }
                            
                            dataTask.resume()
                            
                            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
                            
                            let userInfoUrl = "https://user.peropero.net/api/v1/me/info/"
                            
                            let codeUserInfoUrl = URL(string: userInfoUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
                            var request = URLRequest(url: codeUserInfoUrl)
                            
                            request.setValue(UserDefaults.standard.string(forKey: "accessToken"), forHTTPHeaderField: "Authorization")
                            
                            let UserInfodataTask = session.dataTask(with: request) { (data, response, error) in
                                guard let data = data,
                                      let string = String(data: data, encoding: .utf8) else {
                                          return
                                      }
                                do {
                                    let res = try JSONDecoder().decode(UserInfoResponse.self, from: data)
                                    print(res.data.email)
                                    
                                    let username  = res.data.email.components(separatedBy: "@")
                                    print(username)
                                    UserDefaults.standard.set(username[0], forKey: "userName")
                                    
                                } catch let error {
                                    print(error)
                                }
                                
                                print(string)
                                
                                UserDefaults.standard.set(true, forKey: "isLogged")
                                self.user.isLogged = true
                                self.user.showProfile = true
                                
                            }
                            
                            UserInfodataTask.resume()
                            
                            self.showingAlert = true
                            self.resId = appleIDCredential.user
                            
                        case let passwordCredential as ASPasswordCredential:
                            let username = passwordCredential.user
                            let password = passwordCredential.password
                            print(username, password)
                        default:
                            break
                        }
                    case .failure(let error):
                        print("Authorization failed! :" + error.localizedDescription)
                    }
                }
            )
                .frame(maxWidth: .infinity)
                .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
//                .alert(isPresented: $showingAlert) {
//                    Alert(title: Text("Sgin in successfully"),
//                          message: Text(resId),
//                          dismissButton: .default(Text("OK")))
//                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .disabled(isLogging)
            
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(UserStore())
    }
}
