//
//  Utils.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/6/14.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation


class Utils {
    static func removeNoneDigitCharacters(_ text: String?) -> String?{
        return text?.replacingOccurrences(of: "[^0-9]", with:"", options: .regularExpression)
    }
}
