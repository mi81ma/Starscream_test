//
//  ViewController.swift
//  Starscream_test
//
//  Created by masato on 19/11/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import UIKit
import Starscream
import SwiftyJSON


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var recieveMessage: String!
    var dropPrefixSuffix: String!

//// Real Site
    let socket = WebSocket(url: URL(string: "wss://api.bauhinia.me/WSGateway/")!)

//     STAGING SITE
//let socket = WebSocket(url: URL(string: "wss://api_pure_staging.alphapoint.com/WSGateway/")!)

    var mySegLabel: Int = 0

    var rowArray: Int = 0



    // UIPickerView.
    private var myUIPicker: UIPickerView!

    // PickerViewに表示する値の配列.
    private let myValues: NSArray = ["BCH/BTC", "ETH/BTC","LTC/BTC", "DASH/BTC", "ETC/BTC", "REP/BTC", "GNT/BTC", "XMR/BTC", "CVC/BTC", "BCH/ETH", "ETC/ETH", "REP/ETH", "GNT/ETH", "LTC/XMR", "DASH/XMR"]


    // SegmentControllerに表示する値の配列
    private let myArray: NSArray = [
//        "1 minute",
//        "5 minute",
//        "15 minute",
//        "30 minute",
        "1 hour",
        "6 hour",
        "12 hour",
        "1 day",
        "1 week",
        "1 month"
    ]


// ****************************************************
// viewDidLoad()
// ****************************************************
    override func viewDidLoad() {
        super.viewDidLoad()

        // Viewの背景色を白にする.
        self.view.backgroundColor = UIColor.white


        // ******************** Segment Controller *************************
        // SegmentedControlを作成する.


        let mySegemntController: UISegmentedControl = UISegmentedControl(items: myArray as [AnyObject])
        mySegemntController.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 80)


        // イベントを追加する.
        mySegemntController.addTarget(self, action: #selector(ViewController.segconChanged(segcon:)), for: UIControl.Event.valueChanged)

        // Viewに追加する.
        self.view.addSubview(mySegemntController)


         // ******************** UIPickerViewを *************************

        // UIPickerViewを生成.
        myUIPicker = UIPickerView()

        // サイズを指定する.
        myUIPicker.frame = CGRect(x: 0, y: view.frame.height / 2, width: self.view.bounds.width, height: 300)

        // Delegateを設定する.
        myUIPicker.delegate = self

        // DataSourceを設定する.
        myUIPicker.dataSource = self

        // Viewに追加する.
        self.view.addSubview(myUIPicker)


        // Starscream set
        socket.delegate = self as WebSocketDelegate

    }


    // ****************************************************
    // viewDidLoad()  END
    // ****************************************************



    // Segment Controllerが選択されたら、呼ばれるメソッド

    @objc internal func segconChanged(segcon: UISegmentedControl){

        mySegLabel = segcon.selectedSegmentIndex


        if self.socket.isConnected {
            print("Socket is connected")


            //            let a = getETHBTC.init()
            //            self.socket.write(string: a.getBTCETH_1d())

            let a = getCVCBTC(intervalLabel: "\(myArray[mySegLabel])", instrunemtName: "\(myValues[rowArray])")
            self.socket.write(string: a.getBTCETH_1m())
        }

    }


//*********************************************
//        Picker View Setting
//*********************************************

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }


     // pickerに表示する行数を返すデータソースメソッド(必須)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }


    //pickerに表示する値を返すデリゲートメソッド.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myValues[row] as? String
    }

    // *****************************************************************************
     // pickerが選択された際に呼ばれるデリゲートメソッド.

    // *****************************************************************************
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(myValues[row])")

        if self.socket.isConnected {
            print("Socket is connected")


//            let a = getETHBTC.init()
//            self.socket.write(string: a.getBTCETH_1d())


            rowArray = row

            let a = getCVCBTC(intervalLabel: "\(myArray[mySegLabel])", instrunemtName: "\(myValues[rowArray])")
            self.socket.write(string: a.getBTCETH_1m())
        }
    }

    //*********************************************
    //        Picker View Setting End
    //*********************************************


    //*********************************************
    //        Starscream
    //*********************************************

    deinit {
        socket.disconnect(forceTimeout: 0)
        socket.delegate = nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        socket.connect()
    }


    override func viewWillDisappear(_ animated: Bool) {
        self.socket.disconnect()
    }


}



extension ViewController: WebSocketDelegate {
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("got some data: \(data.count)")
        print("data: \(data)")

    }



        // MARK: Websocket Delegate Methods

        func websocketDidConnect(socket: WebSocketClient) {
            print("websocket is connected")
            // TODO: do socket.send()
        }



        func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
            if let e = error as? WSError {
                print("websocket is disconnected: \(e.message)")
            } else if let e = error {
                print("websocket is disconnected: \(e.localizedDescription)")
            } else {
                print("websocket is disconnected")
            }
        }



        func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {


            let json = text

            if let data = json.data(using: .utf8) {
                if let json = try? JSON(data: data) {
                    for item in json["people"].arrayValue {
                        print(item["o"].stringValue)
                    }
                }
            }

// **********************************************
//            change JSON to Doubel Array
// **********************************************
            print("got some text: \(String(describing: text))")  // print got text


            // Change Type to DataType in order to use ".jsonObject" Method
//            let textData = text.data(using: .utf8)!



            // Cutting Start Index
            let loc_o_first = text.index(text.index(of: "o")!, offsetBy: 5)
//            print(loc_o_first)



            let subString_o_with_suffix = text.suffix(from: loc_o_first)
//            print(subString_o_with_suffix)


            // Cutting End Index
            let loc_o_last = subString_o_with_suffix.index(subString_o_with_suffix.endIndex, offsetBy: -3)
//            print(loc_o_last)

            let sub_o_String = subString_o_with_suffix.prefix(upTo: loc_o_last)
//            print(sub_o_String)

            var sub_o = sub_o_String

            var count: Int = 0
            var arrDouble = [[Double]]()


            var lastParenticeIndex = sub_o.index(sub_o.index(of: "]")!, offsetBy: -1)

            sub_o = sub_o + "zz" // 文字列の末尾にzを追加

//            print("sub_o before while文 : \(sub_o)")


            while  true {


                lastParenticeIndex = sub_o.index(sub_o.index(of: "]")!, offsetBy: -1)
                var subTex : String = String(sub_o.prefix(upTo: lastParenticeIndex))

                subTex = String(subTex.dropFirst())  // "["を取り除く

                var subArr = subTex.components(separatedBy: ",")  // ","で分けてArrayを作る

                var subArrDouble : [Double] = subArr.map {Double($0)!}  // 部分Arrayの要素をDoubleに変換する

//                print("subArrDouble:\(subArrDouble)")
//                print(type(of: subArrDouble))


                arrDouble.append(subArrDouble)
//                print("arrDouble: \(arrDouble), count:\(count)")


                var suffix = String(sub_o.suffix(from: sub_o.index(sub_o.index(of: "]")!, offsetBy: 1)))
                if suffix == "zz" {
                    break
                } else {
                    sub_o = suffix.dropFirst()
//                    print("if文のsub_o:  \(sub_o)")
                }
                count += 1
            }

print(arrDouble)

//
//            // **********************************************
//            //           END change JSON to Doubel Array
//            // **********************************************



    }

    //*********************************************
    //        Starscream End
    //*********************************************

}




// ******************************************
struct AnyDecodable : Decodable {
    let value : Any

    init<T>(_ value :T?) {
        self.value = value ?? ()
    }

    init(from decoder :Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let string = try? container.decode(String.self) {
            self.init(string)
        } else if let int = try? container.decode(Int.self) {
            self.init(int)
        } else {
            self.init(())
        }
    }

}
