//
//  DictionaryToText.swift
//  Starscream_test
//
//  Created by masato on 19/11/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import Foundation

class APIRequest {


    func jsonToString(x:Dictionary<String, Any>) -> String
    {
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: x, options: [])
            let jsonStr = String(bytes: jsonData, encoding: .utf8)!
            //            print(jsonStr)

            return jsonStr

        } catch let error {
            return (error as! String)
        }
    }




    func getBTCETH_1 ()->String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 2,
                "Interval":60,
                "IncludeLastCount":100
        ]

        let insideDictToString = jsonToString(x: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 20,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(x: jsonDict)

        return stringJson

    }

}
