//
//  CredentialView.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/05.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct CredentialView: View {
    
    private let icon8Url = URL(string: "https://icons8.com")!
    private let tetsudoJsonUrl = URL(string: "https://rti-giken.jp/fhc/api/train_tetsudo/")!
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("アプリのバージョン")
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 24))
                .padding()
            Text("1.0")
                .foregroundColor(.black)
                .padding()
            Divider()
            Text("Credentials")
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 24))
                .padding()
            HStack() {
                Text("Icons by ")
                    .foregroundColor(.black)
                Button(action : { UIApplication.shared.open(self.icon8Url) }) {
                    Text("Icon8")
                }
            }
            .padding()
            HStack() {
                Text("Operation information by ")
                    .foregroundColor(.black)
                Button(action : { UIApplication.shared.open(self.tetsudoJsonUrl) }) {
                    Text("鉄道遅延情報のjson")
                }
            }
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
    }
}
