//
//  ContentView.swift
//  KoyoCovid
//
//  Created by Viet-Anh Nguyen on 11/24/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State public var isLogin = false
    @State public var OTPdidSent = false
    
    var body: some View {
                if (isLogin == false){
                    LoginView(isLogin: $isLogin, OTPdidSent:$OTPdidSent)
                } else {
                    HomeView()
            
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

extension String {
    subscript (characterIndex: Int) -> Character {
        return self[index(startIndex, offsetBy: characterIndex)]
    }
}
