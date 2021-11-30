//
//  DeclarationHistoryView.swift
//  KoyoCovid
//
//  Created by Viet-Anh Nguyen on 11/29/21.
//

import SwiftUI

struct DeclarationHistoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selection: String? = nil
    
    var body: some View {
        
        NavigationView {
            VStack{
                NavigationLink(destination: DeclarationResult(), tag: "DeclarationItem", selection: $selection) { EmptyView() }
                Button(action: {self.selection = "DeclarationItem"}){
                    DeclarationHistoryRow(date: "30/11/2021", address: "Đại học Quốc Gia Hà Nội")
                }
                DeclarationHistoryRow(date: "30/11/2021", address: "Đại học Quốc Gia Hà Nội")
                DeclarationHistoryRow(date: "30/11/2021", address: "Đường Hoàng Sâm")
                DeclarationHistoryRow(date: "29/11/2021", address: "Công Viên Nghĩa Đô")
                DeclarationHistoryRow(date: "29/11/2021", address: "Công Viên Nghĩa Đô")
                DeclarationHistoryRow(date: "28/11/2021", address: "Trần Duy Hưng")
                DeclarationHistoryRow(date: "27/11/2021", address: "Mai Dịch")
                Spacer()
            }
            .navigationTitle("Lịch sử khai báo")
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


struct DeclarationResult: View {
//        @Binding var selection: String?
        @State private var doneyet: String? = nil
        @State var date: String = "30/11/2021"
        @State var name: String = "Nguyễn Việt Anh"
        @State var id: String = "026200000001"
        @State var isPrivate: Bool = true
        @State var notificationsEnabled: Bool = false
        @State var address: String = "Đại Học Quốc Gia Hà Nội"
        @State private var province = 0
        @State private var district = 2
        @State private var ward = 1
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
                        Section(header: Text("Ngày khai báo")) {
                            TextField("Ngày khai báo", text: $date)
                        }
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
                        
                    }
            .navigationTitle("Khai báo cho bản thân")
            .navigationBarTitleDisplayMode(.large)
            }
        
    
    }
    
struct DeclarationHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        DeclarationHistoryView()
    }
}
