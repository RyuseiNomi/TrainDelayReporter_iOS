//
//  RouteDetail.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/05.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct RouteDetail: View {
    
    private(set) var companyName:String = ""
    private(set) var routeName:String = ""
    private(set) var status:String = ""
    var body: some View {
        GeometryReader { geometry in
            VStack() {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(self.companyName)
                            .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                            .font(Font.custom("Helvetica-Light", size: 24))
                        Text(self.routeName)
                            .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                            .font(Font.custom("Helvetica-Light", size: 36))
                        //.frame(width: geometry.size.width/2, height: geometry.size.height*0.1)
                    }
                    Spacer()
                    Image("StarFavorite_Off")
                }
                .padding()
                DelayStatusCell(status: self.status)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
        }
    }
}

struct DelayStatusCell: View {
    
    private(set) var status:String = ""
    var body: some View {
            HStack(alignment: .center) {
                Text(self.status)
                    .foregroundColor(self.getStatusColor(status: self.status))
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                Text(self.getStatusText(status: self.status))
                    .foregroundColor(self.getStatusColor(status: self.status))
                    .font(Font.custom("Helvetica-Light", size: 24))
                    .fontWeight(.heavy)
                    .padding()
            }
            .padding()
            .background(Color(red: 255/255, green: 255/255, blue: 255/255)) //floralwhite
    }
    
    private func getStatusColor(status: String) -> Color {
        var color = Color(red: 50/255, green: 205/255, blue: 50/255) //limegreen
        if status == "△" {
            color = Color(red: 215/255, green: 61/255, blue: 0/255) //red
        }
        return color
    }
    
    private func getStatusText(status: String) -> String {
        var text = "平常運転"
        if status == "△" {
            text = "遅れあり"
        }
        return text
    }
}
