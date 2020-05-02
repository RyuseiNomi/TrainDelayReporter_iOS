//
//  RouteList.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/02.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

struct Route: Identifiable {
    var id = UUID()
    var Name: String
    var ColorCode: Int
    var DelayCount: Int
}

struct RouteCell: View {
    
    var route: Route
    var body: some View {
        GeometryReader { geometry in
            NavigationLink(destination: DelayListView()) {
                HStack {
                    Text(self.route.Name)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    //.font(.system(size: 48))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //.frame(height: geometry.size.height * 2, alignment: .leading)
                .background(Color(red: 154/255, green: 205/255, blue: 50/255))
                .cornerRadius(10)
            }.navigationBarTitle("路線選択")
        }
    }
}

struct RouteList: View {
    
    @State private var isComplete:Bool = false
    @State private var routeList:[Route] = []
    
    var body: some View {
        VStack {
            if self.isComplete == false {
                Text("地域情報を取得中")
            }
            QGrid(self.routeList,
                  columns: 1,
                  vSpacing: 20,
                  hSpacing: 20,
                  vPadding: 20,
                  hPadding: 0
            ) { route in
                RouteCell(route: route)
            }
        }.onAppear(perform: { self.setRouteList() })
    }
    
    public func setRouteList() {
        self.routeList = []
        self.routeList.append(Route(Name: "JR東日本", ColorCode: 0x02C03C, DelayCount: 0))
        self.routeList.append(Route(Name: "小田急電鉄", ColorCode: 0x37863F, DelayCount: 0))
        self.routeList.append(Route(Name: "京王電鉄", ColorCode: 0x0072BA, DelayCount: 0))
        self.routeList.append(Route(Name: "東京メトロ", ColorCode: 0xFF7E1C, DelayCount: 0))
        DispatchQueue.main.async {
            self.isComplete = true
        }
    }
}
