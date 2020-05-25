//
//  ExtractionException.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/25.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation

protocol ExtractionException : Error {
   
}

struct  ParsingException: Error {
    let errorMessage: String
}
