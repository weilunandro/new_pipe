//
//  InfoItem.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/24.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

enum ItemInfoType: String, CustomStringConvertible{
    var description: String {
        return "(ItemInfoType[\(rawValue)])"
    }
    
    case STREAM = "stream"
    case PLAYLIST = "playlist"
    case CHANNEL = "channel"
    case COMMENT = "comment"
}

class ItemInfo: CustomStringConvertible{

    let itemInfoType: ItemInfoType
    let url: String
    let name: String
    var thumbnailUrl: String? = nil
    
    init(_ type: ItemInfoType, _ url:String, _ name: String) {
        self.itemInfoType = type
        self.url = url
        self.name = name
    }
    
    var description: String {
        return "(ItemInfo: type = \(itemInfoType)," +
        " url = \(url), name = \(name), thumbnailUrl = \(String(describing: thumbnailUrl)))"
    }

}
