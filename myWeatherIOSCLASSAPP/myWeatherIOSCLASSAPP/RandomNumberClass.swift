//
//  RandomNumberClass.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 12/9/21.
//

import Foundation
class RandomNumberClass{
    var number:Int?
    var url:String
    init(){
        number = 0
        url = "p"
    }
    func generatenum(completion: @escaping (Bool) -> Void){
        url = "http://www.randomnumberapi.com/api/v1.0/random"
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data,error == nil else{
                print("Something went wrong")
                return
            }
            let dataString = String(data: data, encoding: String.Encoding.utf8)
            var pan = dataString!
            pan = pan.replacingOccurrences(of: "[", with: "")
            pan = pan.replacingOccurrences(of: "]", with: "")
            self.number = Int(pan)
            completion(true)
        })
        task.resume();
    }
    }


