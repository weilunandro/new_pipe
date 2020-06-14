//
//  StreamInfoItem.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/26.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

enum StreamType : String, CustomStringConvertible{
    var description: String {return self.rawValue}
    
    case none = "none"
    case video = "video"
    case audio = "audio"
    case live = "live"
}

class StreamInfoItem : InfoItem {
    
    let streamType: StreamType
    
    var uploaderName: String?
    
    var textualUplaodDate: String?
    
    var uplaodDate: String?
    
    var viewCount: Int64?
    
    var duraiotn: Int64?
    
    init( _ url: String, _ name: String, _ streamType: StreamType) {
        self.streamType = streamType
        super.init(ItemInfoType.STREAM, url, name)
    }
        
    
}
