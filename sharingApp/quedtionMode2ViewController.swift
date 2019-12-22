//
//  quedtionMode2ViewController.swift
//  sharingApp
//
//  Created by 大原一倫 on 2019/12/08.
//  Copyright © 2019 oharakazumasa. All rights reserved.
//

import UIKit

class quedtionMode2ViewController: UIViewController, UITextFieldDelegate {
    
    var dictionary : [Dictionary<String,String>] = []
    var shuffledQuestionArray : [Dictionary<String,String>] = []
    var timer = Timer()
    var timeCount: Double = 0
    var nowQuestion: Int = 0
    var fetchQuestion: Int = 0
    var Maxindex: Int = 0
    
    let savedata = UserDefaults.standard
    
    @IBOutlet var questionNumber: UILabel!
    @IBOutlet var questionMaxCount: UILabel!
    @IBOutlet var question: UILabel!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var cheakLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        inputTextField.keyboardType = UIKeyboardType.alphabet
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
           
           if savedata.array(forKey: "ADDWORD") != nil{
               dictionary = savedata.array(forKey: "ADDWORD") as! [Dictionary<String,String>]
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.time), userInfo: nil, repeats: true)
        Maxindex = dictionary.count
        questionMaxCount.text = String(Maxindex)
        shuffle()
        question.text = shuffledQuestionArray[nowQuestion]["word"]
        questionNumber.text = String(nowQuestion + 1)
        
    }
    
    @objc func shuffle(){
        while dictionary.count > 0 {
            let index = Int(arc4random()) % dictionary.count
            shuffledQuestionArray.append(dictionary[index])
            dictionary.remove(at: index)
        }
    }
    
    @objc func time(){
        timeCount = timeCount + 0.01
        timeLabel.text = String(format: "%.2f",timeCount)
    }
    
    func textFieldShouldReturn(_ inputTextField: UITextField) -> Bool {
           
           if inputTextField.text == shuffledQuestionArray[nowQuestion]["word"]{
               if nowQuestion + 1 == Maxindex{
                   timer.invalidate()
                   performSegue(withIdentifier: "toResultView2", sender: timeCount)
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! result2ViewController
        destination.finishtime = timeCount
    }

}
