//
//  SettingView.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/03.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import UIKit
import QGrid

struct RowContent: Identifiable {
    var id = UUID()
    var IconName:String = ""
    var MenuName:String = ""
    var TargetView:String = ""
}

struct SettingRow: View {
    
    private(set) var rowContent: RowContent
    
    var body: some View {
        ZStack() {
            HStack() {
                Image(self.rowContent.IconName)
                Text(self.rowContent.MenuName)
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 24))
                Spacer()
            }
            .padding()
            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
        }
        .cornerRadius(10)
        .shadow(color: .gray, radius: 1, x: 0, y: 5)
    }
}

struct SettingView: View {
    
    @State public var isComplete:Bool = false
    @State private var rowContents:[RowContent] = []
    private let icon8Url = URL(string: "https://icons8.com")!
    var body: some View {
        NavigationView {
            VStack {
                if self.isComplete == false {
                    Text("設定メニューを読み込み中")
                }
                QGrid(self.rowContents,
                      columns: 1,
                      vSpacing: 30,
                      hSpacing: 20,
                      vPadding: 20,
                      hPadding: 20
                ) { row in
                    SettingRow(rowContent: row)
                }
                Text("All of Icons by ")
                Button(action : { UIApplication.shared.open(self.icon8Url) }) {
                    Text("Icon8")
                }
            }
            .onAppear(perform: { self.setMenuList() })
            .navigationBarTitle("設定", displayMode: .inline)
            .background(Color(red: 255/255, green: 250/255, blue: 240/255))
        }
    }
    
    private func setMenuList() {
        self.isComplete = false
        self.rowContents = []
        self.rowContents.append(RowContent(IconName: "Star", MenuName: "お気に入りの路線", TargetView: ""))
        self.rowContents.append(RowContent(IconName: "Moon", MenuName: "ナイトモードの設定", TargetView: ""))
        self.rowContents.append(RowContent(IconName: "Bell", MenuName: "通知設定", TargetView: ""))
        self.rowContents.append(RowContent(IconName: "Phone", MenuName: "このアプリについて", TargetView: ""))
        DispatchQueue.main.async {
            self.isComplete = true
        }
    }
}
