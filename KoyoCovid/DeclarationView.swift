//
//  DeclarationView.swift
//  KoyoCovid
//
//  Created by Viet-Anh Nguyen on 11/28/21.
//

import SwiftUI

struct DeclarationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selection: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DeclarationForm(), tag: "Watashi", selection: $selection) { EmptyView() }
                Text("Bạn muốn khai báo y tế cho\nđối tượng nào?")
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                Button(action: {self.selection = "Watashi"}){
                    Watashi()
                }
                Kimi()
            }
            .padding(.horizontal)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Đóng") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            
        }
    }
}

struct Watashi: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 219/255, green: 76/255, blue: 45/255), Color(.sRGB, red: 189/255, green: 65/255, blue: 38/255)]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "person")
                    .padding(.bottom, 3.0)
                    .font(.system(size: 25, weight: .bold))
                    .imageScale(.large)
                
                Text("Khai báo cho bản thân")
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

struct Kimi: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 46/255, green: 147/255, blue: 224/255), Color(.sRGB, red: 27/255, green: 118/255, blue: 188/255)]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "person.2")
                    .padding(.bottom, 3.0)
                    .font(.system(size: 25, weight: .bold))
                    .imageScale(.large)
                
                Text("Khai báo cho người khác")
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

struct DeclarationForm: View {
//        @Binding var selection: String?
        @State private var doneyet: String? = nil
        @State var name: String = "Nguyễn Việt Anh"
        @State var id: String = "026200000001"
        @State var isPrivate: Bool = true
        @State var notificationsEnabled: Bool = false
        @State var address: String = "101, Nhà A25 đường 39A"
        @State private var province = 0
        @State private var district = 2
        @State private var ward = 3
        var provinceList = ["Hà Nội","Hồ Chí Minh","An Giang", "Bà Rịa - Vũng Tàu","Bình Dương","Bình Phước","Bình Thuận","Bình Định","Bạc Liêu","Bắc Giang","Bắc Kạn","Bắc Ninh","Bến Tre","Cao Bằng","Cà Mau","Cần Thơ","Gia Lai","Hoà Bình","Hà Giang","Hà Nam","Hà Tĩnh","Hưng Yên","Hải Dương","Hải Phòng","Hậu Giang","Khánh Hòa","Kiên Giang","Kon Tum","Lai Châu","Long An","Lào Cai","Lâm Đồng","Lạng Sơn","Nam Định","Nghệ An","Ninh Bình","Ninh Thuận","Phú Thọ","Phú Yên","Quảng Bình","Quảng Nam","Quảng Ngãi","Quảng Ninh","Quảng Trị","Sóc Trăng","Sơn La","Thanh Hóa","Thái Bình","Thái Nguyên","Thừa Thiên Huế","Tiền Giang","Trà Vinh","Tuyên Quang","Tây Ninh","Vĩnh Long","Vĩnh Phúc","Yên Bái","Điện Biên","Đà Nẵng","Đắk Lắk","Đắk Nông","Đồng Nai","Đồng Tháp"]
        var districtList = ["Quận Ba Đình", "Quận Bắc Từ Liêm", "Quận Cầu Giấy", "Quận Đống Đa", "Quận Hà Đông", "Quận Hai Bà Trưng", "Quận Hoàn Kiếm", "Quận Hoàng Mai", "Quận Long Biên", "Quận Nam Từ Liêm", "Quận Tây Hồ", "Quận Thanh Xuân", "Thị Xã Sơn Tây", "Huyện Ba Vì", "Huyện Đan Phượng", "Huyện Đông Anh", "Huyện Gia Lâm", "Huyện Hoài Đức", "Huyện Mê Linh", "Huyện Mỹ Đức", "Huyện Phú Xuyên", "Huyện Sóc Sơn", "Huyện Thạch Thất", "Huyện Thanh Oai", "Huyện Thường Tín", "Huyện Ứng Hoà"]
        var wardList = ["Phường Dịch Vọng", "Phường Dịch Vọng Hậu", "Phường Mai Dịch", "Phường Nghĩa Đô", "Phường Nghĩa Tân", "Phường Quan Hoa", "Phường Trung Hoà", "Phường Yên Hoà"]
        
        @State private var opt1 = 0
        @State private var opt2 = 0
        @State private var opt3 = 0
        @State private var opt4 = 0
        @State private var opt5 = 0
        var yesNo = ["Không", "Có"]
        
    var body: some View {
            NavigationLink(destination: SuccessfulView(), tag: "Done", selection: $doneyet) { EmptyView() }
            Form {
                        Section(header: Text("Thông tin cá nhân")) {
                            TextField("Họ Tên", text: $name)
                            TextField("Mã căn cước công dân", text: $id)
                        }
                        Section(header: Text("Địa chỉ hiện tại")) {
                            TextField("Số nhà & đường", text: $address)
                            Picker(selection: $ward, label: Text("Phường/xã")) {
                                ForEach(0 ..< wardList.count) {
                                    Text(self.wardList[$0])
                                }
                            }
                            Picker(selection: $district, label: Text("Quận/huyện")) {
                                ForEach(0 ..< districtList.count) {
                                    Text(self.districtList[$0])
                                }
                            }
                            Picker(selection: $province, label: Text("Tỉnh/thành phố")) {
                                ForEach(0 ..< provinceList.count) {
                                    Text(self.provinceList[$0])
                                }
                            }
                        }
            
                        Section(header: Text("Khai báo dịch tễ")) {
                            Text("Trong vòng 14 ngày qua, Anh/Chị có đến tỉnh/thành phố, quốc gia/vùng lãnh thổ nào (Có thể đi qua nhiều nơi)?").bold()
                            HStack {
                                Text("Trả lời        ")
                                Picker("Trả lời", selection: $opt1) {
                                    ForEach(0 ..< yesNo.count) {
                                        Text(self.yesNo[$0])
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                        }
            
                        Section {
                            Text("Trong vòng 14 ngày qua, Anh/Chị có thấy xuất hiện ít nhất 1 trong các dấu hiệu: sốt, ho, khó thở, viêm phổi, đau họng, mệt mỏi không?").bold()
                            HStack {
                                Text("Trả lời        ")
                                Picker("Trả lời", selection: $opt2) {
                                    ForEach(0 ..< yesNo.count) {
                                        Text(self.yesNo[$0])
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                        }
            
                        Section {
                            Text("Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với người bệnh hoặc nghi ngờ, mắc bệnh COVID-19?").bold()
                            HStack {
                                Text("Trả lời        ")
                                Picker("Trả lời", selection: $opt3) {
                                    ForEach(0 ..< yesNo.count) {
                                        Text(self.yesNo[$0])
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                        }
                        Section {
                            Text("Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với người từ nước có bệnh COVID-19?").bold()
                            HStack {
                                Text("Trả lời        ")
                                Picker("Trả lời", selection: $opt4) {
                                    ForEach(0 ..< yesNo.count) {
                                        Text(self.yesNo[$0])
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                        }
            
                        Section {
                            Text("Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với người có biểu hiện (Sốt, ho, khó thở , Viêm phổi)?").bold()
                            HStack {
                                Text("Trả lời        ")
                                Picker("Trả lời", selection: $opt5) {
                                    ForEach(0 ..< yesNo.count) {
                                        Text(self.yesNo[$0])
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                            
                        }
                        
                        Section {
                            Button(action: {
                                doneyet = "Done"
                            }) {
                                Text("Gửi Khai báo").bold()
                            }
                        }
                    }
            .navigationTitle("Khai báo y tế cá nhân")
            .navigationBarTitleDisplayMode(.large)
            }
        
    
    }

struct SuccessfulView: View {
    
    var body: some View {
            VStack {
                Text("Khai báo thành công")
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Text("Đóng")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 2.0)
                        .frame(width: 280, height: 60)
                        .cornerRadius(15.0)
                }
            }
            .padding(.horizontal)
            
        
    }
}



struct DeclarationView_Previews: PreviewProvider {
    static var previews: some View {
        DeclarationView()
    }
}
