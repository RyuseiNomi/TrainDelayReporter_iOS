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
        ZStack() {
            NavigationLink(destination: DelayListView(grain: "company", condition: self.company.CompanyName)) {
                HStack {
                    Text(self.company.CompanyName)
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 28))
                    .padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 255/255, green: 255/255, blue: 255/255))
            }
        }
        .cornerRadius(10)
        .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
    }
}

struct CompanyList: View {
    
    public var region:String = ""
    @State private var isComplete:Bool = false
    @State private var companyList:[Company] = []
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack {
            if self.isComplete == false {
                Text("鉄道会社一覧を取得中")
            }
            if self.appState.delayList.domainError != "" {
                Text("列車の運行情報が取得できませんでした。\n 通信環境を確かめて再度お試しください。")
            }
            QGrid(self.companyList,
                  columns: 1,
                  vSpacing: 25,
                  hSpacing: 20,
                  vPadding: 20,
                  hPadding: 20
            ) { company in
                CompanyCell(company: company)
            }
        }
        .navigationBarTitle("鉄道会社選択", displayMode: .inline)
        .onAppear(perform: { self.setCompanyList(region: self.region) })
        .background(Color(red: 248/255, green: 248/255, blue: 255/255)) //ghostwhite
    }
    
    public func setCompanyList(region: String) {
        self.isComplete = false
        for trains in self.appState.delayList.fetchedTrains {
            if trains.Region != region {
                continue
            }
            if self.companyList.contains(where: {$0.CompanyName == trains.Company}) {
                continue
            }
            self.companyList.append(Company(CompanyName: trains.Company, ColorCode: 0x02C03C, DelayCount: 0))
        }
        DispatchQueue.main.async {
            self.isComplete = true
        }
    }
}
