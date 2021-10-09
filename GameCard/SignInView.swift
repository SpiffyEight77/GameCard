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

struct SignInView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var currentNonce:String?
    @State private var showingAlert = false
    
    @State private var resId = ""
    @EnvironmentObject var user: UserStore
    
    let signInConfig = GIDConfiguration.init(clientID: "18202803046-7c6313k00mer0tkdgpj4po8mlqgof9nu.apps.googleusercontent.com")
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
                    guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
                    
                    let loginManager = LoginManager()
                    loginManager.logIn(permissions: ["public_profile","email"], from: presentingViewController) { result, error in
                        if let error = error {
                            print("Encountered Erorr: \(error)")
                        } else if let result = result, result.isCancelled {
                            print("Cancelled")
                        } else {
                            print(result?.authenticationToken?.tokenString)
                            print("Logged In")
                            UserDefaults.standard.set(true, forKey: "isLogged")
                            self.user.isLogged = true
                            self.user.showProfile = true
                            self.user.showLogin = false
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
            
            HStack(spacing: 10) {
                Button(action: {
                    
                    guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
                    
                    GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: presentingViewController) { user, error in
                        guard error == nil else { return }
                        print(user!.authentication.idToken)
                        // If sign in succeeded, display the app's main content View.
                        UserDefaults.standard.set(true, forKey: "isLogged")
                        self.user.isLogged = true
                        self.user.showProfile = true
                        self.user.showLogin = false
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
            
            SignInWithAppleButton(
                
                onRequest: { request in
                    request.requestedScopes = [.fullName,.email]
                },
                onCompletion: { result in
                    switch result {
                    case .success(let authenticationResults):
                        switch authenticationResults.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            
                            guard let token = appleIDCredential.identityToken else { return }
                            let tokenStr = String(data: token, encoding: .utf8) ?? ""
                            
                            let userId = appleIDCredential.user
                            let email = appleIDCredential.email ?? ""
                            let fullName = appleIDCredential.fullName
                            let familyName = appleIDCredential.fullName?.familyName ?? ""
                            let givenName = appleIDCredential.fullName?.givenName ?? ""
                            let username = familyName + givenName
                            
                            print(fullName ?? "", email, userId, tokenStr)
                            
                            let url = "https://dev-user.peropero.net/api/v1/o/apple/appleGetToken?" + "name=" + username + "&user_id=" + userId + "&token=" + tokenStr + "&email=" + email + "&app_id=com.spiffyeight77.signindemo"
                            
                            let codeUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
                            
                            // URLSession
                            let session = URLSession.shared
                            let dataTask = session.dataTask(with: codeUrl) { (data, response, error) in
                                guard let data = data,
                                      let string = String(data: data, encoding: .utf8) else {
                                    return
                                }
                                print(string)
                                UserDefaults.standard.set(true, forKey: "isLogged")
                                self.user.isLogged = true
                                self.user.showProfile = true
                                self.user.showLogin = false
                            }
                            dataTask.resume()
                            
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
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Sgin in successfully"),
                      message: Text(resId),
                      dismissButton: .default(Text("OK")))
            }
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
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
