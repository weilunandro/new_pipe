//
//  InfoItemsCollector.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/26.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

class InfoItemsCollector<I: InfoItem , E: InfoItemExtractor> : Collector{

    private var items = [I]()
    private var errors = [Error]()
    
    
    func extract(extract: E) throws -> I {
        throw ExtractMethodDoNotImplementError(errMsg: "\(String(describing: type(of: self))) do not implememnt extract method")
    }
    
    func commit(extractor: E) {
        do {
            try addItem(item: self.extract(extract: extractor))
        } catch {
            addError(error: error)
        }
    }
    
    func getItems() -> [I] {
        return items
    }
    
    func getErrors() -> [Error] {
        return errors
    }
    
    func addError(error: Error) {
        errors.append(error)
    }
    
    func addItem(item: I){
        items.append(item)
    }
    
    func reset() {
        items.removeAll()
        errors.removeAll()
    }
    
}
