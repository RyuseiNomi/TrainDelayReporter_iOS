//
//  DelayListInteractor.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import Combine

class DelayListInteractor {
    
    public var appState:AppState
    
    init(appState: AppState) {
        // ViewコンポーネントよりEnvieonmentObjectから読み込んだAppStateインスタンスを取得
        self.appState = appState
    }
    
    /// APIより全ての路線の遅延情報を取得する
    /// アプリ内でこのメソッドを介してAPIと通信をするのはビルド時とリロード時のみである
    public func fetchAllDelayListFromAPI() {
        self.appState.setFetchStatus(false)
        self.appState.delayList.fetchedTrains = []
        let url = URL(string: "https://8wbb81dkpd.execute-api.ap-northeast-1.amazonaws.com/beta/delayList?region=all")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let clientError = error {
                self.appState.delayList.domainError = "クライアント側でエラーが発生: \(clientError.localizedDescription) \n"
                self.appState.setFetchStatus(true)
                return
            }
            guard let delayListData = data, let response = response as? HTTPURLResponse else {
                self.appState.delayList.domainError = "データもしくはレスポンスがありません"
                self.appState.setFetchStatus(true)
                return
            }
            if response.statusCode != 200 {
                self.appState.delayList.domainError = "現在データを取得できません: \(response.statusCode)\n"
                self.appState.setFetchStatus(true)
                return
            }
            // Convert Data Object to JSON Object
            let jsonObject = try? JSONSerialization.jsonObject(with: delayListData, options: []) as? [String:Any]
            let delayListArray = jsonObject?["delay_list"] as? [[String: Any]]
            // Exec status change in main thred to avoid an error
            DispatchQueue.main.async {
                for trainRoute in delayListArray! {
                    self.appState.delayList.fetchedTrains.append(
                        TrainRoute(
                            Name: trainRoute["Name"] as! String,
                            Company: trainRoute["Company"] as! String,
                            Region: trainRoute["Region"] as! String,
                            Status: trainRoute["Status"] as! String,
                            Source: trainRoute["Source"] as! String
                        )
                    )
                }
                self.appState.setFetchStatus(true)
            }
        }
        task.resume()
    }
    
    public func filter(grain: String, condition: String) {
        if grain == "company" {
            self.filterByCompany(company: condition)
            return
        }
        if grain == "routeName" {
            self.filterByRouteName(name: condition)
            return
        }
    }
    
    private func filterByCompany(company: String) {
        self.appState.setFetchStatus(false)
        self.appState.delayList.filteredTrains = []
        for trains in self.appState.delayList.fetchedTrains {
            if trains.Company == company {
                self.appState.delayList.filteredTrains.append(
                    TrainRoute(
                        Name: trains.Name as! String,
                        Company: trains.Company as! String,
                        Region: trains.Region as! String,
                        Status: trains.Status as! String,
                        Source: trains.Source as! String
                    )
                )
            }
        }
        self.appState.setFetchStatus(true)
    }
    
    private func filterByRouteName(name: String) {
        self.appState.setFetchStatus(false)
        self.appState.delayList.filteredTrains = []
        for trains in self.appState.delayList.fetchedTrains {
            if trains.Name == name {
                self.appState.delayList.filteredTrains.append(
                    TrainRoute(
                        Name: trains.Name as! String,
                        Company: trains.Company as! String,
                        Region: trains.Region as! String,
                        Status: trains.Status as! String,
                        Source: trains.Source as! String
                    )
                )
            }
        }
        self.appState.setFetchStatus(true)
    }
}
