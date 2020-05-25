//
//  StreamInfoItem.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/24.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

class StreamInfoItem: ItemInfo{
        
    var uploaderName: String? = nil
    
    var texutalUploadDate : String? = nil
    
    var viewCount: Int64?  = nil
    
    var duration: UInt64? = nil
    
    var uploaderUrl: String? = nil
    
    init(_ url: String, _ name: String ) {
        super.init( ItemInfoType.STREAM, url, name)
    }

    
    override var description: String {
        return "(StreamInfoItem (super: \(super.description)) uploaderName: \(String(describing: uploaderName))" +
            " texutalUploadDate: \(String(describing: texutalUploadDate)) " +
            " viewCount: \(String(describing: viewCount))" +
            " duration: \(String(describing: duration))" +
        " uploaderUrl: \(String(describing: uploaderUrl))"
    }
}
