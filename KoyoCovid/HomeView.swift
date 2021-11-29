//
//  HomeView.swift
//  KoyoCovid
//
//  Created by Viet-Anh Nguyen on 11/24/21.
//

import SwiftUI

struct HomeView: View {
    @State public var isDeclaration = false
    
    var body: some View {
        NavigationView {
            HomeLayout()
                .navigationTitle("OOAD Covid-19")
                .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeLayout: View {
    var body: some View {
        VStack {
            CardView()
            ActionView()
        }
    }
}

struct CardView: View {
    
    @State private var showingDeclarationHistory = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Thẻ xanh")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all)

        }
        .padding(.bottom, -20.0)
        ZStack {
            CardBackgroundView()
            HStack {
                VStack(alignment: .leading) {
                    Text("Nguyễn Việt Anh")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(3)
                        .padding(.bottom, 1.5)
                    Text("Nghĩa Đô, Cầu Giấy, Hà Nội".uppercased())
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Divider()
                        .foregroundColor(.white)
                    HStack{
                        
                        Image("qrcode")
                            .cornerRadius(10)
                        VStack(alignment: .leading, spacing: 10){
                            Text("Tình trạng: Tốt")
                                .font(.title3)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                
                            HStack{
                                Image(systemName: "checkmark.shield")
                                
                                Text("Đã tiêm đủ 2 mũi".uppercased())
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                            }
                            .foregroundColor(.white)
                            HStack{
                                Image(systemName: "checkmark.shield")
                                
                                Text("Đã khai báo y tế trong tuần trước ".uppercased())
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    
                            }
                            .foregroundColor(.white)
                            
                        }
                        .foregroundColor(.white)
                    }
                    Divider()
                    Button(action: {showingDeclarationHistory.toggle()}) {
                        HStack {
                            Image(systemName: "clock")
                                .font(.system(size: 17, weight: .bold))
                            Text("Xem lịch sử khai báo")
                                .font(.headline)
                                .padding(.top, 2.0)
                        }
                        .foregroundColor(.blue)
                        .frame(
                              minWidth: 0,
                              maxWidth: .infinity,
                              minHeight: 0,
                              maxHeight: .infinity
                            )
                    }
                    .buttonStyle(
                        HomeButtonStyle()
                    )
                    .sheet(isPresented: $showingDeclarationHistory) {
                                DeclarationHistoryView()
                            }
                }
                .layoutPriority(100)
 
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .frame(width: nil, height: 320.0)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct CardBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ActionView: View {
    @State private var showingDeclarationForm = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Hành động")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all)

        }
        .padding(.bottom, 0)
        VStack{
            HStack{
                Button(action: {showingDeclarationForm.toggle()}) {
                    Action1()
                }
                .sheet(isPresented: $showingDeclarationForm) {
                            DeclarationView()
                        }
                Button(action: {print("ButtonPressed")}) {
                    Action2()
                }
            }
            HStack{
                Button(action: {print("ButtonPressed")}) {
                    Action3()
                }
                
                Button(action: {print("ButtonPressed")}) {
                    Action4()
                }
            }
        }
        .padding(.horizontal)
    }
}



struct Action1: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 219/255, green: 76/255, blue: 45/255), Color(.sRGB, red: 189/255, green: 65/255, blue: 38/255)]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "cross")
                    .padding(.bottom, 3.0)
                    .font(.system(size: 25, weight: .bold))
                    .imageScale(.large)
                
                Text("Khai báo y tế")
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
        }
        .cornerRadius(10)
        .frame(width: nil, height: 120)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        
        
    }
}

struct Action2: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 46/255, green: 147/255, blue: 224/255), Color(.sRGB, red: 27/255, green: 118/255, blue: 188/255)]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "bus.doubledecker.fill")
                    .padding(.bottom, 3.0)
                    .font(.system(size: 25, weight: .bold))
                    .imageScale(.large)
                
                Text("Khai báo di chuyển")
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
        }
        .cornerRadius(10)
        .frame(width: nil, height: 120)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        
        
    }
}

struct Action4: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 36/255, green: 206/255, blue: 119/255), Color(.sRGB, red: 33/255, green: 165/255, blue: 98/255)]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "map")
                    .padding(.bottom, 3.0)
                    .font(.system(size: 25, weight: .bold))
                    .imageScale(.large)
                
                Text("Bản đồ dịch tễ")
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
        }
        .cornerRadius(10)
        .frame(width: nil, height: 120)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        
        
    }
}

struct Action3: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 216/255, green: 135/255, blue: 41/255), Color(.sRGB, red: 190/255, green: 119/255, blue: 37/255)]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "bell.badge")
                    .padding(.bottom, 3.0)
                    .font(.system(size: 25, weight: .bold))
                    .imageScale(.large)
                
                Text("Thông báo mới")
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
        }
        .cornerRadius(10)
        .frame(width: nil, height: 120)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        
        
    }
}


struct HomeButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    HomeButtonStyleView(configuration: configuration)
  }
}

private extension HomeButtonStyle {
  struct HomeButtonStyleView: View {
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
          .fill(isEnabled ? Color.white : Color.gray)
        )
        // make the button a bit more translucent when pressed
        .opacity(configuration.isPressed ? 0.8 : 1.0)
        // make the button a bit smaller when pressed
        .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
        .cornerRadius(15.0)
    }
  }
}
