//
//  YoutubeStreamExtractor.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/26.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation
import SwiftyJSON

class YoutubeStreamExtractor: StreamInfoItemExtractor {
    
    private var videoInfo: JSON
    private var cachedStreamType: StreamType?
    
    
    init(withJsonData videoInfo: JSON) {
        self.videoInfo = videoInfo
    }
    
    func getStreamType()  -> StreamType {
        if( cachedStreamType != nil) {
            return cachedStreamType!
        }
        let badges = videoInfo["badges"].array
        if let actualBadges = badges, actualBadges.count > 0 {
            for i in 0..<actualBadges.count {
                if let liveLabel = actualBadges[i]["metadataBadgeRenderer"]["label"].string, liveLabel == "LIVE NOW"{
                    cachedStreamType = StreamType.live
                    return StreamType.live
                }
            }
        }
        
        let stylePath: [JSONSubscriptType] = ["thumbnailOverlays", 0, "thumbnailOverlayTimeStatusRenderer", "style"]
        if let style = videoInfo[stylePath].string, style == "LIVE" {
            cachedStreamType = StreamType.live
            return StreamType.live
        }
        return StreamType.video
    }
    
    func isAd() throws -> Bool {
        do {
            let name = try getName()
            return  name == "[Private Video]" || name == "[Deleted Video]"
        } catch {
            return isPremiuim()
        }
        return false
    }
    
    func getDuration() throws -> UInt64 {
        if getStreamType() == StreamType.live || isPremiuim() {
            return 0
        }
        
        var duration = YoutubeParsingHelper.getText(fromObject: videoInfo["lengthText"])
        if duration == nil {
            if let thumbnailOverlays = videoInfo["thumbnailOverlays"].array, thumbnailOverlays.count > 0 {
                let path: [JSONSubscriptType] = ["thumbnailOverlayTimeStatusRenderer", "text"]
                for thumbnail in thumbnailOverlays {
                    duration = YoutubeParsingHelper.getText(fromObject: thumbnail[path])
         
                }
            }
        }
        
        if duration == nil, duration!.count == 0 {
            throw ParsingException(errorMessage: "\(String(describing: type(of: self))) can not get the duration")
        }
        return YoutubeParsingHelper.parseDurationWith(durationString: duration!) ?? 0
    }
    
    func getViewCount() throws -> Int64 {
        if videoInfo["topStandaloneBadge"].exists() || isPremiuim() {
            return -1
        }
        
        if !videoInfo["viewCountText"].exists() {
            return -1
        }
        
        let viewConuntText =   YoutubeParsingHelper.getText(fromObject: videoInfo["viewCountText"])
        if let _ = viewConuntText?.lowercased().contains("no views") {
            return 0
        }
        
        if let _ = viewConuntText?.lowercased().contains("recommended") {
            return -1
        }
       
        return Int64(Utils.removeNoneDigitCharacters(viewConuntText) ?? "0") ?? -1
    }
    
    func getUploaderName() throws -> String? {
        var name = YoutubeParsingHelper.getText(fromObject: videoInfo["longBylineText"])
        
        if(name == nil) {
            name = YoutubeParsingHelper.getText(fromObject: videoInfo["ownerText"])
            
            if ( name == nil ){
                name = YoutubeParsingHelper.getText(fromObject: videoInfo["shortBylineText"])
            }
            
            if (name == nil){
                throw ParsingException(errorMessage: "Can not parseing the uplaoder name ")
            }
        }
        
        return name
    }
    
    func getUplaoderUrl() throws -> String {
        var url = YoutubeParsingHelper.getText(fromObject: videoInfo["longBylineText"])
    }
    
    func getTexualUploadDate() throws -> String {
        <#code#>
    }
    
    func getUploadDate() throws -> String {
        <#code#>
    }
    
    func getName() throws -> String {
        do {
            let name = try YoutubeParsingHelper.getText(fromObject: videoInfo)
            if name !=  nil {
                return name!
            }else {
                throw ParsingException(errorMessage: "\(String(describing: type(of: self))) Can not get Name")
            }
        }catch {
            throw ParsingException(errorMessage: "\(String(describing: type(of: self))) Can not get Name")
        }
    }
    
    func getUrl() throws -> String {
        <#code#>
    }
    
    func getThumbnailUrl() throws -> String {
        <#code#>
    }
    
    func isPremiuim() -> Bool {
        let badges = videoInfo["badges"].array
        if let actualBadges = badges, actualBadges.count > 0 {
            let premiumPath: [JSONSubscriptType] = ["metadataBadgeRenderer", "label"]
            for i in 0..<actualBadges.count {
                let premium = actualBadges[i][premiumPath].string
                if let actualPremium = premium, actualPremium == "Premium" {
                    return true
                }
            }
           
        }
        return false
    }
    
}
