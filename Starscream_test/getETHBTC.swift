//
//  DictionaryToText.swift
//  Starscream_test
//
//  Created by masato on 19/11/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import Foundation

class getETHBTC {


    func jsonToString(dict:Dictionary<String, Any>) -> String
    {
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
            let jsonStr = String(bytes: jsonData, encoding: .utf8)!
            //            print(jsonStr)

            return jsonStr

        } catch let error {
            return (error as! String)
        }
    }




    func getBTCETH_1m ()->String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":60,
                "IncludeLastCount":100
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 20,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson

    }


    func getBTCETH_5m ()->String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":300,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 168,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson

    }




    func getBTCETH_15m () -> String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":900,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 20,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson
    }


    func getBTCETH_30m () -> String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":1800,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 54,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson
    }

    

    func getBTCETH_60 () -> String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":3600,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 60,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson
    }


    func getBTCETH_1h () -> String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":3600,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)

        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 8,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson
    }


    func getBTCETH_6h () -> String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":21600,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)

        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 28,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson
    }


    func getBTCETH_12h () -> String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":21600,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 28,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson
    }



    func getBTCETH_1d () -> String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":86400,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 70,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson
    }



    func getBTCETH_1w () -> String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":86400,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 42,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson
    }


    func getBTCETH_1month () -> String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": 1,
                "Interval":86400,
                "IncludeLastCount":5000
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 140,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson
    }



}
