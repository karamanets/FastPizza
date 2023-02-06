//
//  ContentView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var SingIn_Up = true
    
    @State private var email     = ""
    @State private var password  = ""
    @State private var password2 = ""
    
    @State private var alertMessage  = ""
    @State private var alertMessage2 = ""
    @State private var alert         = false
    
    @State private var isTabViewShow = false

    var body: some View {
        
        VStack {
            Spacer(minLength: 60)
            
            VStack {
                Text(SingIn_Up ? "Sing In" : "Sing Up")
                    .foregroundColor(.black)
                    .font(.system(size: 27) .bold())
                    .padding()
                    .padding(.horizontal, 42)
                    .background(Color("Color1"))
                    .cornerRadius(30)
                    .scaleEffect(SingIn_Up ? 1.0 : 1.2 )
            }
            
            VStack (spacing: 25) {
                TextField("Login", text: $email)
                    .textContentType(.emailAddress)
                    .foregroundColor(.black)
                    .font(.title2)
                    .padding(.all,14)
                    .padding(.horizontal, 30)
                    .background(Color.white)
                    .cornerRadius(30)
                    .tint(.orange)
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .foregroundColor(.black)
                    .font(.title2)
                    .padding(.all,14)
                    .padding(.horizontal, 30)
                    .background(Color.white)
                    .cornerRadius(30)
                    .tint(.orange)
                
                if !SingIn_Up {
                    SecureField("Password", text: $password2)
                        .textContentType(.password)
                        .foregroundColor(.black)
                        .font(.title2)
                        .padding(.all,14)
                        .padding(.horizontal, 30)
                        .background(Color.white)
                        .cornerRadius(30)
                        .tint(.orange)
                }
                Button {
                    if SingIn_Up {
                        AuthService.shared.SignIn(email: self.email, password: self.password) { result in
                            switch result {
                            case .success(_):
                                self.isTabViewShow.toggle()
                            case .failure(let error) :
                                self.alertMessage = error.localizedDescription
                                self.alertMessage2 = "Try again"
                                self.alert.toggle()
                            }
                        }
                    } else {
                        guard password == password2 else {
                            self.alertMessage = "Passwords are not equal 🦉"
                            self.alertMessage2 = "Try again"
                            self.alert.toggle()
                            return
                        }
                        AuthService.shared.SignUp(email: self.email, password: self.password) { result in
                            switch result {
                            case .success(let user):
                                self.alertMessage = "Congratulated You're account was created with email \(user.email ?? "Error" )"
                                self.alertMessage2 = "Go to SignIn"
                                self.email = ""
                                self.password = ""
                                self.password2 = ""
                                self.SingIn_Up.toggle()
                                self.alert.toggle()
                            case .failure(let error):
                                self.alertMessage = "\(error.localizedDescription)"
                                self.alertMessage2 = "Try again"
                                self.alert.toggle()
                            }
                        }
                    }
                } label: {
                    Text(SingIn_Up ? "Sign In" : "Sign Up")
                        .foregroundColor(.black)
                        .font(.system(size: 22))
                        .padding(.all, 14)
                        .padding(.horizontal, 30)
                        .background(Color.orange)
                        .cornerRadius(20)
                        .opacity(0.8)
                        .shadow(color: .black, radius: 3, x: 2, y: 3)
                }
                Button {
                    self.SingIn_Up.toggle()
                    self.email = ""
                    self.password = ""
                    self.password2 = ""
                    
                } label: {
                    Text(SingIn_Up ? "Registration" : "Back")
                        .foregroundColor(.black)
                        .opacity(0.9)
                }
            }
            .padding(.all, 20)
            .padding(.vertical, 20)
            .background(Color("Color2"))
            .cornerRadius(30)
            .padding(.all, 20)
            .scaleEffect(SingIn_Up ? 1.0 : 1.02 )
            Spacer(minLength: 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("Pizza")
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: SingIn_Up ? 0 : 4 ) )
        
        .animation(Animation.interpolatingSpring(stiffness: 120, damping: 9), value: SingIn_Up)
        
        .alert(isPresented: $alert) {
            Alert(title: Text("Message"),
                  message: Text(alertMessage),
                  dismissButton: .default(Text(alertMessage2)) {
                self.email = ""
                self.password = ""
                self.password2 = ""
            }) }
        
        .fullScreenCover(isPresented: $isTabViewShow) {
            if AuthService.shared.currentUser?.uid == "MKaQ3xwU67bSK6aQc1ilrxSoz4s1" {
                AdminOrdersView()
            } else {
                if AuthService.shared.currentUser != nil {
                    let user = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                    MainTabBarView(viewModel: user )
                }
            }
        }
    }
}
//                         🔱
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
