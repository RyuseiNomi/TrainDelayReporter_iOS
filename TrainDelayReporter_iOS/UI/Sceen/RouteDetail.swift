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
        VStack(alignment: .leading) {
            RouteNames(
                companyName: self.companyName,
                routeName: self.routeName,
                status: self.status
            )
            DelayStatusCell(status: self.status)
            AddToFavoriteButton()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
    }
}

struct RouteNames: View {
    
    private(set) var companyName:String = ""
    private(set) var routeName:String = ""
    private(set) var status:String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.companyName)
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 24))
            Text(self.routeName)
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 36))
            //.frame(width: geometry.size.width/2, height: geometry.size.height*0.1)
        }.padding()
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
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .center)
        .background(Color(red: 255/255, green: 255/255, blue: 255/255)) //white
        .cornerRadius(2)
        .shadow(color: .gray, radius: 1, x: 0, y: 3)
        
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

struct AddToFavoriteButton: View {
    
    //TODO Read status from user cache
    @State private(set) var isFavorite:Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                self.isFavorite.toggle()
            }) {
                if self.isFavorite == true {
                    FavoriteButton_On()
                } else if self.isFavorite == false {
                    FavoriteButton_Off()
                }
            }
        }
        .cornerRadius(10)
        .shadow(color: .gray, radius: 1, x: 0, y: 5)
        .padding()
    }
}

struct FavoriteButton_Off: View {
    
    var body: some View {
        HStack(alignment: .center) {
            Image("StarFavorite_Off")
                .renderingMode(.original)
            Text("お気に入りに登録")
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 18))
            Spacer()
        }
        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
    }
}

struct FavoriteButton_On: View {
    
    var body: some View {
        HStack(alignment: .center) {
            Image("StarFavorite_On")
                .foregroundColor(.white)
            Text("お気に入りに登録済み")
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 18))
            Spacer()
        }
        .background(Color(red: 255/255, green: 202/255, blue: 40/255))
    }
}
