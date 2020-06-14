//
//  Collector.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/26.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

protocol Collector {
    associatedtype I
    associatedtype E
    
    func commit(extractor: E)
    
    func extract(extract: E) throws -> I
    
    func getItems() -> [I]
    
    func getErrors() -> [Error]
    
    func reset()
}
