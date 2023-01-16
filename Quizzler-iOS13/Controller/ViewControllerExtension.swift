//
//  ViewControllerExtension.swift
//  Quizzler-iOS13
//
//  Created by Peiyun on 2023/1/15.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{

    func alert(correctAnswer :String){
        let alert = UIAlertController(title: "You got \(correctAnswer)! ", message: nil, preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "Next", style: .default) { _ in
            //按下按鈕到達下一題
            //self.quizBrain.nextQuestion()
        }
    
        alert.addAction(nextAction)
        present(alert, animated: true, completion: nil)
    }

}
