//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    //三個選項
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    //生成物件
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        //設定如果正確，按鈕顯示紅色; 錯誤，按鈕顯示綠色
        if userGotItRight == true{
            sender.backgroundColor = .red
        }else{
            sender.backgroundColor = .green
        }
        
        //按下按鈕到達下一題
        quizBrain.nextQuestion()
   
        //過0.2秒後削除顏色
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    

    
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        //設定按鈕文字
        optionA.setTitle(quizBrain.getAnswerText(number: 0), for: .normal)
        optionB.setTitle(quizBrain.getAnswerText(number: 1), for: .normal)
        optionC.setTitle(quizBrain.getAnswerText(number: 2), for: .normal)
        //清除按鈕顏色
        optionA.backgroundColor = .clear
        optionB.backgroundColor = .clear
        optionC.backgroundColor = .clear
    }
    



}

