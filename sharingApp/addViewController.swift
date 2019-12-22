//
//  addViewController.swift
//  sharingApp
//
//  Created by 大原一倫 on 2019/12/08.
//  Copyright © 2019 oharakazumasa. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    
    let savedata = UserDefaults.standard
    var dictioary : [Dictionary<String,String>] = []
    
    
    @IBOutlet var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if savedata.array(forKey: "ADDWORD") != nil{
            dictioary = savedata.array(forKey: "ADDWORD") as! [Dictionary<String,String>]
        }
        
    }
    
    @IBAction func selectadd(){
        
        if textField.text != nil{
            let dictionaryAdd = ["word": textField.text!]
                   dictioary.append(dictionaryAdd)
                   savedata.set(dictioary, forKey: "ADDWORD")
                   
                   let aleat = UIAlertController(title: "保存完了",message: "保存が完了しました",preferredStyle: .alert)
                   aleat.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
                   self.present(aleat, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "エラー", message: "単語を入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
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
