//
//  log_in_view.swift
//  HopSpot.
//
//  Created by Mina Mansour on 2024-07-11.
//

import SwiftUI


struct log_in_view: View {
    
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModels: log_in_view_model
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                Text("HopSpot.")
                    .font(.system(size: 45, weight: .black))
                    .tracking(1.35)
                    .foregroundColor(.black)
                    
            }
            
            VStack {
                //image
                Image("rabbit_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 90)
                    .padding(.vertical, 32)
                 
                
                //form fields
                
                
                VStack(spacing: 24){
                    InputView(text: $email, title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    
                    InputView(text: $password, 
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                
                .padding(.horizontal)
                .padding(.top, 30)
                
                //sign in button
                
                Button {
                    print("Log user in..")
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    
                }
                .background(Color.pink)
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.8)
                .cornerRadius(10)
                .padding(.top, 24)
                
                
                
                
                Spacer()
                
                
                //sign up button
                
                NavigationLink {
                    register_view()
                } label: {
                    
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign Up!")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        
                    }
                    
                    .font(.system(size: 14))
                    .foregroundColor(.pink)
                    
                }
                
                
                
                
            }
            
        }
        
    }
    
}
extension log_in_view: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
    
}

#Preview {
    log_in_view()
}
