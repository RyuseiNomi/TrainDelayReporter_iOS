//
//  DelayListInteractor.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct DelayListInteractor {
    
    public func fetchDelayList() -> Array<TrainRoute> {
        var trains = [TrainRoute]()
        //TODO: Get delay list from API
        let url = URL(string: "https://8wbb81dkpd.execute-api.ap-northeast-1.amazonaws.com/beta/delayList?region=all")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let clientError = error {
                print("クライアント側でエラーが発生: \(clientError.localizedDescription) \n")
                return
            }
            guard let delayListData = data, let response = response as? HTTPURLResponse else {
                print("データもしくはレスポンスがありません")
                return
            }
            if response.statusCode != 200 {
                print("現在データを取得できません: \(response.statusCode)\n")
                return
            }
            // Convert Data Object to JSON Object
            let jsonObject = try? JSONSerialization.jsonObject(with: delayListData, options: []) as? [String:Any]
            let delayListArray = jsonObject?["delay_list"] as? [[String: Any]]
            for trainRoute in delayListArray! {
                trains.append(TrainRoute(companyName: trainRoute["company"] as! String, routeName: trainRoute["name"] as! String))
            }
        }
        task.resume()
        return trains
    }
}
