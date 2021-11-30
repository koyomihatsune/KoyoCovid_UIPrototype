//
//  DeclarationHistoryRow.swift
//  KoyoCovid
//
//  Created by Viet-Anh Nguyen on 11/30/21.
//

import SwiftUI

struct DeclarationHistoryRow: View {
    @State var date: String
    @State var address: String
    
    var body: some View {
        HStack {
            Image(systemName: "cross")
                .padding([.leading, .bottom, .trailing], 9.0)
                .font(.system(size: 25, weight: .bold))
                .imageScale(.large)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading, spacing: 1){
                Text("Khai báo cho bản thân").bold()
                Text(date)
                Text(address)
            }
            Spacer()
        }
        .padding(.vertical, 5.0)
    }
}

struct DeclarationHistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DeclarationHistoryRow(date:"8/11/2021", address:"Hà Nội")
            DeclarationHistoryRow(date:"8/11/2021", address:"Hà Nội")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
