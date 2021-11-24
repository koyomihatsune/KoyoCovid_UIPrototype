//
//  LoginView.swift
//  KoyoCovid
//
//  Created by Viet-Anh Nguyen on 11/24/21.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLogin: Bool
    @Binding var OTPdidSent: Bool
    
    @State var phonenumber: String = ""
    @State var otpnumber: String = ""
    
    var body: some View {
        if (isLogin == false) {
            ZStack {
                BackgroundView()
                VStack{
                        NavigationLink(destination: OTPNumberTextField(otpnumber: $otpnumber, isLogin: $isLogin), isActive: $OTPdidSent) {
                            EmptyView()
                        }
                        
                        PhoneNumberTextField(phonenumber: $phonenumber, OTPdidSent: $OTPdidSent)
                    }
                .padding()
            }
        } else {
            Text("Logged in")
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct AppTitle: View {
    var body: some View {
        VStack{
            Text("OOAD COVID-19")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.vertical)
            Text("Sử dụng số điện thoại để lấy mã OTP\nvà đăng nhập")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40.0)
        }
    }
}

struct PhoneNumberTextField: View {
    @Binding var phonenumber: String
    @Binding var OTPdidSent: Bool
    
    @State private var phoneNumberNotValid = false

    var body: some View {
            VStack{
                AppTitle()
                TextField("Số điện thoại", text: $phonenumber)
                    .keyboardType(.numberPad)
                    .padding(.all, 14.194)
                    .background(Color(white: 100))
                    .cornerRadius(8.0)
                    .multilineTextAlignment(.center)
                if ((phonenumber.count) == 0 ){
                    Text("")
                } else if (((phonenumber.count) != 10) && ((phonenumber.count) != 11)) {
                    Text("Số điện thoại không hợp lệ")
                        .foregroundColor(Color.red)
                } else {
                    Text("")
                }
                Button(action: {OTPdidSent = true}) {
                        Text("Lấy mã OTP")
                          .font(.headline)
                          .foregroundColor(.white)
                          .padding(.top, 2.0)
                          .frame(width: 280, height: 60)
                          .cornerRadius(15.0)
                }
                .disabled(((phonenumber.count) != 10) && ((phonenumber.count) != 11))
                .buttonStyle(
                    MyButtonStyle()
                )
                
                Button(action: {OTPdidSent = true}) {
                      Text("Chưa có tài khoản? Đăng ký")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 2.0)
                        .frame(width: 280, height: 60)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }
            }
            .padding(.bottom, 40.0)
    }
}

struct OTPNumberTextField: View {
    
    @Binding var otpnumber: String
    @Binding var isLogin: Bool
    
    var body: some View {
            VStack{
                Text("Nhập mã OTP")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.vertical)
                Text("Nhập mã OTP đã gửi về số điện thoại của bạn")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40.0)
                TextField("Mã OTP", text: $otpnumber)
                    .keyboardType(.numberPad)
                    .padding(.all, 14.194)
                    .background(Color.white)
                    .cornerRadius(8.0)
                    .multilineTextAlignment(.center)
                if ((otpnumber.count) == 0 ){
                    Text(" ")
                } else if ((otpnumber.count) < 4 || (otpnumber.count) > 4) {
                    Text("Mã OTP không hợp lệ")
                        .foregroundColor(Color.red)
                } else {
                    Text(" ")
                }
                Button(action: {isLogin = true}) {
                    Text("Đăng nhập")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 2.0)
                        .frame(width: 280, height: 60)
                }
                .buttonStyle(
                    MyButtonStyle()
                )
            }
            .padding(.bottom, 40.0)
    }
}


struct MyButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    MyButtonStyleView(configuration: configuration)
  }
}

private extension MyButtonStyle {
  struct MyButtonStyleView: View {
    // tracks if the button is enabled or not
    @Environment(\.isEnabled) var isEnabled
    // tracks the pressed state
    let configuration: MyButtonStyle.Configuration

    var body: some View {
      return configuration.label
        // change the text color based on if it's disabled
        .foregroundColor(isEnabled ? Color.white : Color.white)
        .background(RoundedRectangle(cornerRadius: 5)
          // change the background color based on if it's disabled
          .fill(isEnabled ? Color.blue : Color.gray)
        )
        // make the button a bit more translucent when pressed
        .opacity(configuration.isPressed ? 0.8 : 1.0)
        // make the button a bit smaller when pressed
        .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
        .cornerRadius(15.0)
    }
  }
}
