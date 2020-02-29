//
//  ViewController.swift
//  sharingApp
//
//  Created by 大原一倫 on 2019/11/10.
//  Copyright © 2019 oharakazumasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let savedata = UserDefaults.standard
    
    var dictioary : [Dictionary<String,String>] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if savedata.array(forKey: "ADDWORD") != nil{
            dictioary = savedata.array(forKey: "ADDWORD") as! [Dictionary<String,String>]
        }
    }
    
    @IBAction func selectQuestionView2(){
        
        if dictioary == []{
            
            let alert = UIAlertController(title: "エラー", message: "単語を追加してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            performSegue(withIdentifier: "toQuestionView2", sender: nil)
        }
        
    }
    
    
    @IBAction func back(sender: UIStoryboardSegue){
        
    }


}

