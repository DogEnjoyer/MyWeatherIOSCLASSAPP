//
//  MyFortuneView.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 12/10/21.
//

import Foundation
import UIKit


class myFortuneView: UIViewController {
    @IBOutlet weak var CheckPreviousFortunesButton: UIButton!
    
    @IBOutlet weak var CrystalBallImage: UIImageView!
    @IBOutlet weak var TextViewForFortune: UITextView!
    @IBOutlet weak var myGetFortuneButton: UIButton!
    override func viewDidLoad() {
                super.viewDidLoad()
        myGetFortuneButton.backgroundColor = .clear
        title = "Fortunes"
        UIView.animate(withDuration: 0, animations:{
            self.TextViewForFortune.alpha = 0

        })

        myGetFortuneButton.addTarget( self,
                                      action:#selector(getRandomNumber), for: .touchUpInside)
    }
    
    @objc private func getRandomNumber(){
        var random = FortuneMaker()
        var p = MyFortuneMaker()
        p.delegate = random
        let handlerblock:(Bool) -> Void = {
            if $0{
                DispatchQueue.main.async{
                    self.TextViewForFortune.text = p.fortune
                    UIView.animate(withDuration: 2, animations:{
                        self.CrystalBallImage.alpha = 0

                    })
                    
                    UIView.animate(withDuration: 3, animations:{
                        self.myGetFortuneButton.alpha = 0
                        self.TextViewForFortune.alpha = 1
                        self.view.backgroundColor = .purple
                        self.CheckPreviousFortunesButton.alpha = 0
                        self.TextViewForFortune.backgroundColor = .purple
                    },completion: { success in
                        UIView.animate(withDuration: 3, animations:{
                            self.myGetFortuneButton.alpha = 1
                            self.TextViewForFortune.alpha = 0
                            self.CrystalBallImage.alpha = 1
                            self.view.backgroundColor = .white
                            self.TextViewForFortune.backgroundColor = .white
                            self.CheckPreviousFortunesButton.alpha = 1
                        })

                        
                    })
                }

            }
        }
        p.generatefortune(completion: handlerblock)
        
        
    }
}
