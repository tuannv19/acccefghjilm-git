//
//  ServiceHelper.swift
//  demoApp
//
//  Created by tuannv on 12/28/17.
//  Copyright © 2017 tuannv. All rights reserved.
//

import UIKit
import AFNetworking

class ServiceHelper: AFHTTPSessionManager {
    private static let baseURLString = ""
    private static  let timeOut : TimeInterval = 60
    
    typealias ResultBlock =  ( _ parsedObject: NSDictionary, _ error: NSError) -> Void
    
    
    static func share()-> ServiceHelper{
        let serviceHelper : ServiceHelper = ServiceHelper.init(baseURL: URL.init(string: baseURLString) )
        let requestSerializer = AFJSONRequestSerializer()
        requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        requestSerializer.timeoutInterval = timeOut
        serviceHelper.requestSerializer = requestSerializer
        serviceHelper.securityPolicy.allowInvalidCertificates = true
        
        return serviceHelper;
    }
    func postRequest(api:String, parameters: NSDictionary, complete:ResultBlock)  {
        self.post(api, parameters: parameters, progress: nil, success: { (task, response) in
            
        }) { (task, error) in
            
        }
        
    }
    func getRequest(api:String, parameters: NSDictionary, complete:ResultBlock)  {
        self.get(api, parameters: parameters, progress: nil, success: { (task, response) in
            
        }) { (task, error) in
        
        }
        
    }
}
