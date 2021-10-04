//
//  SignInView.swift
//  GameCard
//
//  Created by wayne on 2021/9/28.
//

import SwiftUI
import GoogleSignIn

struct SignInView: View {
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
                Button(action: {}) {
                    Image("Facebook-white")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                    Text("Sign In with Facebook")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("background2"))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
            HStack(spacing: 10) {
                Button(action: {
                    
                    guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
                    
                    GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: presentingViewController) { user, error in
                      guard error == nil else { return }

                      // If sign in succeeded, display the app's main content View.
                    }
                }) {
                    Image("Google")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                    Text("Sign In with Google")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("background3"))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
            HStack(spacing: 10) {
                Button(action: {}) {
                    Image("Apple-white")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                    Text("Sign In with Apple")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("background"))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
            //            Spacer()
            
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
