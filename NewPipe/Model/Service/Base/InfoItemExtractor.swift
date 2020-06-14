//
//  InfoItemExtractor.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/26.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

protocol InfoItemExtractor {
    
    func getName() throws -> String
    
    func getUrl() throws -> String
    
    func getThumbnailUrl() throws -> String
}
