//
//  CompanyList.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/02.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

struct Company: Identifiable {
    var id = UUID()
    var CompanyName: String
    var ColorCode: Int
    var DelayCount: Int
}

struct CompanyCell: View {
    
    var company: Company
    var body: some View {
        GeometryReader { geometry in
            NavigationLink(destination: DelayListView(companyName: self.company.CompanyName)) {
                HStack {
                    Text(self.company.CompanyName)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    //.font(.system(size: 48))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //.frame(height: geometry.size.height * 2, alignment: .leading)
                .background(Color(red: 154/255, green: 205/255, blue: 50/255))
                .cornerRadius(10)
            }.navigationBarTitle("鉄道会社選択")
        }
    }
}

struct CompanyList: View {
    
    @State private var isComplete:Bool = false
    @State private var companyList:[Company] = []
    
    var body: some View {
        VStack {
            if self.isComplete == false {
                Text("地域情報を取得中")
            }
            QGrid(self.companyList,
                  columns: 1,
                  vSpacing: 20,
                  hSpacing: 20,
                  vPadding: 20,
                  hPadding: 0
            ) { company in
                CompanyCell(company: company)
            }
        }.onAppear(perform: { self.setCompanyList() })
    }
    
    public func setCompanyList() {
        self.companyList = []
        self.companyList.append(Company(CompanyName: "JR東日本", ColorCode: 0x02C03C, DelayCount: 0))
        self.companyList.append(Company(CompanyName: "小田急電鉄", ColorCode: 0x37863F, DelayCount: 0))
        self.companyList.append(Company(CompanyName: "京王電鉄", ColorCode: 0x0072BA, DelayCount: 0))
        self.companyList.append(Company(CompanyName: "東京メトロ", ColorCode: 0xFF7E1C, DelayCount: 0))
        DispatchQueue.main.async {
            self.isComplete = true
        }
    }
}
