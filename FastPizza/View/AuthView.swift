//
//  ContentView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var SingIn_Up = true
    
    @State private var login     = ""
    @State private var password  = ""
    @State private var password2 = ""
    
    @State private var message   = ""
    @State private var alert     = false
    
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
                    TextField("Login", text: $login)
                        .font(.title2)
                        .padding(.all,14)
                        .padding(.horizontal, 30)
                        .background(Color.white)
                        .cornerRadius(30)
                    
                    SecureField("Password", text: $password)
                        .font(.title2)
                        .padding(.all,14)
                        .padding(.horizontal, 30)
                        .background(Color.white)
                        .cornerRadius(30)
                    
                    if !SingIn_Up {
                        SecureField("Password", text: $password2)
                            .font(.title2)
                            .padding(.all,14)
                            .padding(.horizontal, 30)
                            .background(Color.white)
                            .cornerRadius(30)
                    }
                    Button {
                        if SingIn_Up {
                            print("SignIn") // Auth SignIn
                            self.password = ""
                            self.isTabViewShow.toggle()
                        } else {
                            print("SignUp") //Auth SignUo
                            self.alert.toggle()
                            
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
                        self.login = ""
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
                Alert(title: Text("Congratulated"),
                      message: Text("Let's Sign In"),
                      dismissButton: .default(Text("Go in")) {
                    self.login = ""
                    self.password = ""
                    self.password2 = ""
                    self.SingIn_Up.toggle() }) }
        
            .fullScreenCover(isPresented: $isTabViewShow) {
                MainTabBar()
            }
    }
}
//                         🔱
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
