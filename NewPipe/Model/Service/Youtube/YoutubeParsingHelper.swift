//
//  YoutubeParsingHelper.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/27.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation
import SwiftyJSON

class YoutubeParsingHelper{
    
    static func getText(fromObject jsonObject: JSON?) -> String?{
        
        if let actulJsonObject = jsonObject {
            if let simpleText = actulJsonObject["simpleText"].string {
                return simpleText
            }
            
            var result = ""
            if let runs = actulJsonObject["runs"].array, runs.count > 0 {
                for run in runs {
                    if let text =  run["text"].string {
                        result += text
                    }
                }
            }
            return result
        }
        return nil
    }
    
    
    static func parseDurationWith(durationString duration: String ) -> UInt64? {
        var splitInput = duration.contains(":")  ? duration.split(separator: ":") : duration.split(separator: ".")
        
        var days = "0"
        var hours = "0"
        var minutes = "0"
        var seconds = "0"
        
        switch splitInput.count {
        case 4 :
            days = String(splitInput[0])
            hours = String(splitInput[1])
            minutes = String(splitInput[2])
            seconds = String(splitInput[3])
        case 3:
            hours = String(splitInput[0])
            minutes = String(splitInput[1])
            seconds = String(splitInput[2])
        case 2:
            minutes = String(splitInput[0])
            seconds = String(splitInput[1])
        case 1 :
            seconds = String(splitInput[0])
        default:
            return nil
        }
        
        return (((UInt32(days) * 24) + UInt32(hours)) * 60 + UInt32(minutes)) * 60 + UInt32(seconds)
    }
    
    static func getUrlFrom(navigationPoint: JSON?) throws -> String {
        if let actualNavigatePoint = navigationPoint {
            if let urlEndpoint = actualNavigatePoint["urlEndpoint"].dictionary {
                if let url = urlEndpoint["url"]?.string {
                    if url.hasPrefix("/redirect?") {
                        if let redirectUrl = url.substring(from: url.index(after: url.firstIndex(of: "?")!)) {
                           
                        }
                    }
                    
                }
            }
            else if let browseEndpoint = navigationPoint["browseEndpoint"].object {
                
            }
        }
        
        throw ExtractionException()
    }
}
