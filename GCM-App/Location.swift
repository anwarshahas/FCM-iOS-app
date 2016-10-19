//
//  Location.swift
//  GCM-App
//
//  Created by Shahas on 19/10/16.
//  Copyright © 2016 Bull. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class Location:NSObject {
    
    var uid: String!
    var userHash: String!

    
    final  class var SharedInstance : Location {
        
        struct Static {
            static var instance : Location?
            
        }
        
        if !(Static.instance != nil) {
            Static.instance = Location()
        }
        
        return Static.instance!
    }
    
    class func registerUser(fcmToken: String) {
//        let headers: HTTPHeaders = [
//            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
//            "Accept": "application/json"
//        ]
        let url = URLEnum.REGISTER_USER.url
        let params = ["gcm": fcmToken, "device":"iOS"]
        Alamofire.request(url, method: .post, parameters: params).responseJSON { response in
            let dictionary = response.result.value as! Dictionary<String, AnyObject>
            Location.SharedInstance.uid = dictionary["_id"] as! String!
            Location.SharedInstance.userHash = dictionary["hash"] as! String!
        }
    }
    
    class func updateLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        if(Location.SharedInstance.uid != nil) {
            let headers: HTTPHeaders = [
                "uid": Location.SharedInstance.uid,
                "hash": Location.SharedInstance.userHash
            ]
            let url = URLEnum.UPDATE_LOCATION.url
            let params = ["location":[latitude, longitude]]
            Alamofire.request(url, method: .post, parameters: params, headers: headers).responseJSON { response in
                print(response.result.value)
            }

        }
    }
    
}
