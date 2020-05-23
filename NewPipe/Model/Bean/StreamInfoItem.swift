//
//  StreamInfoItem.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/23.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

struct StreamInfoItem {
        
    var uploaderName: String
    
    var texutalUploadDate : String
    
    var viewCount: Int64 = -1
    
    var duration: UInt64 = 0
    
    var uploaderUrl: String
}
