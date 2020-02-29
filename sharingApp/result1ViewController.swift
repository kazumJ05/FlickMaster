//
//  result1ViewController.swift
//  sharingApp
//
//  Created by 大原一倫 on 2019/12/08.
//  Copyright © 2019 oharakazumasa. All rights reserved.
//

import UIKit
import Firebase

class result1ViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    var finishtime: Double = 0
    var database: Firestore!
//    var ref: DatabaseReference!
    var postArray: [Post] = []
    var arrayCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        database = Firestore.firestore()
//        ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultLabel.text = String(format: "%.2f", finishtime)
        database.collection("posts").getDocuments { (snapshot, error) in
            if error == nil, let snapshot = snapshot {
                self.postArray = []
                for document in snapshot.documents {
                    let docuName = document.documentID
                    let data = document.data()
                    let score = document.data()
                    let post = Post(data: data, score: score, dataName: docuName)
                    self.postArray.append(post)
                    self.postArray = self.postArray.sorted(by: {(a,b) -> Bool in
                        return Unicode.CanonicalCombiningClass(rawValue: Unicode.CanonicalCombiningClass.RawValue(Double(a.content1)!)) < Unicode.CanonicalCombiningClass(rawValue: Unicode.CanonicalCombiningClass.RawValue(Double(b.content1)!))
                    })
                    self.arrayCount = self.postArray.count
                }
            }
        }
    }
    
    @IBAction func selectAddRanking(_ sender: AnyObject){
        
        if postArray.count >= 10{
            
            let recordTime: Double = atof(postArray[arrayCount - 1].content1)
            
            if finishtime <= recordTime{
            
            if nameTextField.text == ""{
                let aleat = UIAlertController(title: "送信完了",message: "送信が完了しました",preferredStyle: .alert)
                aleat.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
                self.present(aleat, animated: true, completion: nil)
                database.collection("posts").document(postArray[arrayCount - 1].contentName).delete()
                let data = String("匿名")
                let saveDocument = Firestore.firestore().collection("posts").document()
                saveDocument.setData(["name": data, "score": String(format: "%.2f", finishtime)]) { error in
                    if error == nil{
                        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                    }
                }
                
             }else{
                let aleat = UIAlertController(title: "送信完了",message: "送信が完了しました",preferredStyle: .alert)
                aleat.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
                self.present(aleat, animated: true, completion: nil)
                let data = nameTextField.text!
                let saveDocument = Firestore.firestore().collection("posts").document()
                saveDocument.setData(["name": data, "score": String(format: "%.2f", finishtime)]) { error in
                    if error == nil{
                        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                    }
                }
            }
          }else{
             let aleat = UIAlertController(title: "ランキング圏外でした",message: "またチャレンジしてください",preferredStyle: .alert)
             aleat.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
             self.present(aleat, animated: true, completion: nil)
          }
        }else{
            if nameTextField.text == ""{
                let aleat = UIAlertController(title: "送信完了",message: "送信が完了しました",preferredStyle: .alert)
                aleat.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
                self.present(aleat, animated: true, completion: nil)
                let data = String("匿名")
                let saveDocument = Firestore.firestore().collection("posts").document()
                saveDocument.setData(["name": data, "score": String(format: "%.2f", finishtime)]) { error in
                    if error == nil{
                        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                    }
                }
                
            }else{
                let aleat = UIAlertController(title: "送信完了",message: "送信が完了しました",preferredStyle: .alert)
                aleat.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
                self.present(aleat, animated: true, completion: nil)
                let data = nameTextField.text!
                let saveDocument = Firestore.firestore().collection("posts").document()
                saveDocument.setData(["name": data, "score": String(format: "%.2f", finishtime)]) { error in
                    if error == nil{
                        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func selectReturnHome(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
