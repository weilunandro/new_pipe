//
//  YoutubeTrendingExtractor.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/25.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation
import SwiftyJSON

class YoutubeTrendingExtractor{
    
    private static let NAME_PATH : [JSONSubscriptType] = ["header", "feedTabbedHeaderRenderer", "title"]
    private static let CONTENTS_PATH: [JSONSubscriptType] = ["contents", "twoColumnBrowseResultsRenderer",
                                                             "tabs", 0 , "tabRenderer", "content", "sectionListRenderer", "contents"]
    private static let ITEMS_PATH: [JSONSubscriptType] = ["itemSectionRenderer", "contents", 0,
                                                          "shelfRenderer", "content", "expandedShelfContentsRenderer", "items"]
    
    private let initialJson: JSON
  
    
    init(withJsonData jsonData: JSON) {
        self.initialJson = jsonData
    }
    
    func getName() throws -> String  {
        if let name = initialJson[YoutubeTrendingExtractor.NAME_PATH].string {
            return name
        }else {
            throw ParsingException(errorMessage: "Unable parse name from \(initialJson) with \(YoutubeTrendingExtractor.NAME_PATH)")
        }
       
    }
    
    func getItems() throws -> String {
        if let itemSectionRenders = initialJson[YoutubeTrendingExtractor.CONTENTS_PATH].array {
            for itemSectionRenders in itemSectionRenders {
                if let items = itemSectionRenders[YoutubeTrendingExtractor.ITEMS_PATH].array {
                    print(items)
                }
            }
        }
        
        return "hello world";
    }
}
