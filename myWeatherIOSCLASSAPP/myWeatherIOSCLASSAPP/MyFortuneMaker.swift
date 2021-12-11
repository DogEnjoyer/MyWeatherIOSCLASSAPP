//
//  MyFortuneMaker.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 12/10/21.
//

import Foundation
import UIKit
protocol FortuneDelegate{
    func FortuneWasMade(_ RandomNumber:RandomNumberClass)

}

class MyFortuneMaker{
    var fortune:String
    var delegate:FortuneDelegate?
    
    init()
    {
        fortune = ""
    }
    func generatefortune(completion: @escaping (Bool) -> Void)
    {
        var randomnumber = RandomNumberClass()
        let handlerblock:(Bool) -> Void = {
            if $0{
                if(randomnumber.number ?? 0 < 10){
                    self.fortune = "Very Bad Luck"
                }
                else if(randomnumber.number ?? 0 >= 10 && randomnumber.number ?? 0 < 40){
                    self.fortune = "Bad Luck"
                }
                else if(randomnumber.number ?? 0 >= 40 && randomnumber.number ?? 0 < 60){
                    self.fortune = "Average Luck"
                }
                else if(randomnumber.number ?? 0 >= 60 && randomnumber.number ?? 0 < 80){
                    self.fortune = "Good Luck"
                }
                else if(randomnumber.number ?? 0 >= 80 && randomnumber.number ?? 0 < 99){
                    self.fortune = "Very Good Luck"
                }
                else{
                    self.fortune = "Extremely Good Luck!"
                }
                self.delegate?.FortuneWasMade(randomnumber)
                completion(true)
            }
            
        }
        randomnumber.generatenum(completion: handlerblock)
    }
}

class FortuneMaker: FortuneDelegate
{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func FortuneWasMade(_ RandomNumber: RandomNumberClass) {
        createItem(name: RandomNumber.number ?? 0)
    }
    
    func createItem(name: Int){
            let newItem = FortuneStorage(context: context)
            newItem.storedNum = Int32(name)
            
            do{
                try context.save()
                print("number was saved")

            }
            catch{

            }
        }
    
}
