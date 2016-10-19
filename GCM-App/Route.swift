//
//  Route.swift
//  GCM-App
//
//  Created by Shahas on 19/10/16.
//  Copyright © 2016 Bull. All rights reserved.
//

import Foundation

enum URLEnum:String {
    case BASE_URL = "http://test.poletalks.com/"
    case REGISTER_USER = "events/users/add"
    case UPDATE_LOCATION = "events/users/update"
    
    var url: String {
        switch self {
        case .BASE_URL:
            return URLEnum.BASE_URL.rawValue
            
        default:
            return "\(URLEnum.BASE_URL.rawValue)\(self.rawValue)"
        }
    }
    
}
