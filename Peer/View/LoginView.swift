//
//  LoginView.swift
//  Peer
//
//  Created by Hosung Lim on 3/21/24.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.primaryBackground)
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Text("로그인")
                            .font(.pretendardBold28)
                            .padding()
                        
                        TextField(
                            "이메일을 입력해주세요.",
                            text: $email
                        )
                        .padding(10)
                        .textFieldStyle(CustomTextFieldStyle())
                        
                        SecureField(
                            "비밀번호를 입력해주세요.",
                            text: $password
                        )
                        .padding(10)
                        .textFieldStyle(CustomTextFieldStyle())
                        
                        HStack {
                            Spacer()
                            Button(action: {}, label: {
                                Text("비밀번호 찾기")
                            })
                            .padding(.horizontal, 10)
                        }
                        
                        PurpleButton(
                            disable: email.isEmpty || password.isEmpty,
                            text: "로그인",
                            action: {}
                        )
                        .padding()
                    }
                    .frame(width: geometry.size.width - 100)
                    .padding()
                    .background(Color.secondaryBackground)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )
                    
                    VStack {
                        Divider()
                            .frame(height: 3)
                            .overlay(Color.gray.opacity(0.4))
                            .padding(20)
                        
                        FourtyTwoAuthButton(width: geometry.size.width - 100)
                        GoogleAuthButton(width: geometry.size.width - 100)
                    }
                }
            }
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.tertiaryBackground)
                .cornerRadius(8)
                .frame(height: 46)
            
            configuration
                .font(.pretendardMedium18)
                .padding()
        }
    }
}

struct GoogleAuthButton: View {
    var width: CGFloat
    var body: some View {
        Button(
            action: {
                // TODO : - 구글 Oauth 붙이기
            },
            label: {
                HStack {
                    Image("googleLogo")
                    
                    Text("구글 계정으로 로그인")
                        .font(.pretendardBold18)
                }
            }
        )
        .frame(width: width, height: 50)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 15)
        )
    }
}

struct FourtyTwoAuthButton: View {
    var width: CGFloat
    var body: some View {
        Button(
            action: {
                // TODO : - 42 Oauth 붙이기
            },
            label: {
                HStack {
                    Image("42Logo")
                    
                    Text("42 계정으로 로그인")
                        .font(.pretendardBold18)
                }
            }
        )
        .frame(width: width, height: 50)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 15)
        )
    }
}

#Preview {
    LoginView()
}
