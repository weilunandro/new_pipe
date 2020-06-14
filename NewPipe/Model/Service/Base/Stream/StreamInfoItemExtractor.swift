//
//  StreamInfoExtractor.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/26.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

protocol StreamInfoItemExtractor: InfoItemExtractor{
    
    func getStreamType() throws -> StreamType
    
    func isAd() throws -> Bool
    
    func getDuration() throws -> UInt64
    
    func getViewCount() throws -> UInt64
    
    func getUploaderName() throws -> String
    
    func getUplaoderUrl() throws -> String
    
    func getTexualUploadDate() throws -> String
    
    func getUploadDate() throws -> String 
}
