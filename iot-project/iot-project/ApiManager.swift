//
//  ApiManager.swift
//  iot-project
//
//  Created by Shinnosuke Komiya on 2015/09/17.
//  Copyright (c) 2015年 Shinnosuke Komiya. All rights reserved.
//

import Foundation

enum Method {
    case POST
    case GET
    case DELETE
}

class ApiManager {
    private let baseUrl = ""
    private var url: String
    private var params: [String:String]?
    private var method = Method.GET
    var success: ((operation:AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void)?
    var failure: ((operation: AFHTTPRequestOperation!, error: NSError!) -> Void)?
    private let manager: AFHTTPRequestOperationManager
    
    init(entryPoint: String) {
        url = baseUrl + entryPoint
        manager = AFHTTPRequestOperationManager()
        let serializer: AFJSONRequestSerializer = AFJSONRequestSerializer()
        manager.requestSerializer = serializer
    }
    
    func request() {
        switch method {
        case .GET:
            manager.GET(url, paramaters: params, success: success, failure: failure)
        case .POST:
            manager.POST(url, parameters: params, success: success, failure: failure)
        case .DELETE:
            manager.DELETE(url, parameters: params, success: success, failure: failure)
        }
    }
    
    class func loginManager(userId: String, nickName: String) -> ApiManager {
        let manager = ApiManager(entryPoint: "")
        manager.method = .POST
        manager.params = ["": userId, "": nickName]
        return manager
    }
    
}