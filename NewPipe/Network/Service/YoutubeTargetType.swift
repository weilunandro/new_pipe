//
//  YoutubeService.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/24.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation
import Moya
import RxSwift

enum YoutubeTargetType {
    case trending(local: String)
}

extension YoutubeTargetType: TargetType{

    var baseURL: URL { return URL(string: "https://youtube.com")! }
    
    var sampleData: Data {
        switch self {
        case .trending(_):
            return  "{\"test\": \"Just a sample\"}}".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case let .trending(local):
            return .requestParameters(parameters: ["pbj": "1", "gl" : local], encoding: URLEncoding.queryString)
        }
    }
        
    
    var path: String {
        switch self {
        case .trending:
            return "/feed/trending"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .trending:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json",
                "X-YouTube-Client-Name" : "1",
                "X-YouTube-Client-Version": "2.20200214.04.00"]
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
