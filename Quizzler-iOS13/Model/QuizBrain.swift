//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Peiyun on 2023/1/15.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain{
    
    var questionNumber = 0
    var answerNumber = 0
    var score = 0
    
    //問題文本
    let quiz = [
               Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
               Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
               Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
               Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
               Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
               Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
               Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
               Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
               Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
               Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    //設定問題
    func getQuestionText() -> String{
        return quiz[questionNumber].text
    }
    
    //設定答案選項
    func getAnswerText(number:Int) -> String{
            return quiz[questionNumber].answer[number]
    }
    
    //設定正確答案
    func getCorrectAnswer() -> String{
        return quiz[questionNumber].correctAnswer
    }
    
    
    //設定進度條
    func getProgress() -> Float{
        return Float(questionNumber) / Float(quiz.count)
    }
    
    //設定分數
    func getScore() -> Int{
        return score
    }
    
    //設定下一題
    //當self在後台創建時，他是用let關鍵字定義的，不可改變
    //如果我們要創建一個方法來修改struct中的屬性，我們必須把這個方法標記為變異：mutating使self可以像var一樣工作，自由更改任何struct中的屬性
    mutating func nextQuestion() {
        //因第一題時 questionNumber為0,故須加一
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        }
        else{
            questionNumber = 0
            score = 0
        }
    }
    

    //檢查答案
    mutating func checkAnswer(userAnswer:String) -> Bool{
        if userAnswer == quiz[questionNumber].correctAnswer{
            score += 1
            return true
        }else{
            return false
        }
    }
    
    
    
}
