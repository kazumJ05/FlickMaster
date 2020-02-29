//
//  questionMode1ViewController.swift
//  sharingApp
//
//  Created by 大原一倫 on 2019/12/08.
//  Copyright © 2019 oharakazumasa. All rights reserved.
//

import UIKit

class questionMode1ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var questionNumber: UILabel!
    @IBOutlet var question: UILabel!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var cheakLabel: UILabel!
    
    var questionList : [Dictionary<String,String>]  = []
    var shuffledQuestionArray : [Dictionary<String,String>] = []
    var timer = Timer()
    var timeCount: Double = 0
    var nowQuestion: Int = 0
    var fetchQuestion: Int = 0
    
    let questionContentArray = ["q","w","e","r","t","y", "u","i", "o","p"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inputTextField.delegate = self
        
        while fetchQuestion < questionContentArray.count{
            let inputQuestion = ["word": questionContentArray[fetchQuestion]]
            questionList.append(inputQuestion)
            fetchQuestion = fetchQuestion  + 1
        }
        
        inputTextField.keyboardType = UIKeyboardType.alphabet
        fetchQuestion = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.time), userInfo: nil, repeats: true)
        shuffle()
        question.text = shuffledQuestionArray[nowQuestion]["word"]
        questionNumber.text = String(nowQuestion + 1)
    }
    
    @objc func shuffle(){
        while questionList.count > 0 {
            let index = Int(arc4random()) % questionList.count
            shuffledQuestionArray.append(questionList[index])
            questionList.remove(at: index)
        }
    }
    
    @objc func time(){
        timeCount = timeCount + 0.01
        timeLabel.text = String(format: "%.2f",timeCount)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! result1ViewController
        destination.finishtime = timeCount
    }
    
    func textFieldShouldReturn(_ inputTextField: UITextField) -> Bool {
        
        if inputTextField.text == shuffledQuestionArray[nowQuestion]["word"] && inputTextField.text?.count == shuffledQuestionArray[nowQuestion]["word"]?.count{
            if nowQuestion == 9{
                timer.invalidate()
                performSegue(withIdentifier: "toResultView1", sender: timeCount)
                timeCount = 0
                nowQuestion = 0
            }else{
                nowQuestion = nowQuestion + 1
                question.text = shuffledQuestionArray[nowQuestion]["word"]
                cheakLabel.text = "正解です！"
                inputTextField.text = ""
                questionNumber.text = String(nowQuestion + 1)
            }
        }else{
            inputTextField.text = ""
            cheakLabel.text = "間違っています"
        }
        
        return true
    }
    
    
}
