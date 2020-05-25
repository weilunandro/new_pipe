//
//  YoutubeHttpResource.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/23.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

import Moya
import RxSwift
import SwiftyJSON

class YoutubeHttpResouce {

    func fetchStreamInfoItems() -> Single<[StreamInfoItem]> {
        let provider = MoyaProvider<YoutubeTargetType>()
        // TODO: Hard code the local for now
        return provider.rx.request(YoutubeTargetType.trending(local: "CN"))
            .map({(response) -> [StreamInfoItem] in
                do {
                    let json = try JSON(data: response.data)
                    return YoutubeHttpResouce.parseStreamInfoFrom(json: json)
                }catch  {
                    print("Error \(error)")
                }
                return []
            })
    }
    
    static func parseStreamInfoFrom(json: JSON) -> [StreamInfoItem]{
        do {
            let youtubeTrendingExtractor = YoutubeTrendingExtractor(withJsonData: json[1]["response"])
            try youtubeTrendingExtractor.getItems()
        }catch {
            print("Error happend \(error)")
        }
        return []
    }
}
