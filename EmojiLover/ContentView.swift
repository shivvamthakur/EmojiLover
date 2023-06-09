//
//  ContentView.swift
//  EmojiLover
//
//  Created by Shivam Thakur on 07/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
        var body: some View {
//            enum Emoji: String, CaseIterable{case 👀,🥳,😇,😷
//            }

        NavigationView{
            ZStack{
                Color.purple.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("username", text:$username )
                        .padding()
                        .frame(width:300,height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("password", text:$password )
                        .padding()
                        .frame(width:300,height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Login"){
                        authenticateUser(username: username, password: password)
                    }.foregroundColor(.white)
                        .frame(width: 200,height: 40)
                        .background(Color.purple)
                        .cornerRadius(10)
                    Button("Sign Up"){
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 200,height: 40)
                    .background(Color.purple)
                    .cornerRadius(10)
                }
                
                NavigationLink(destination:
                                Text("You are logged in @\(username)"), isActive: $showingLoginScreen){
                    
//                    NavigationView(){
//                        VStack{
//                            @State var selection Emoji = .👀
//                            Text(selection.rawValue)
//                        }
//                    }
                }
            }
            .navigationBarHidden(true)
        }
        
    }
    
    func authenticateUser(username :String, password :String ){
        if username.lowercased() == "kasturbarox@gmail.com"{
            wrongUsername=0
            if password == "abc"{
                wrongPassword = 0
                showingLoginScreen = true
            }
            else{
                wrongPassword = 2
            }
        }
        else{
            wrongUsername = 2;
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
