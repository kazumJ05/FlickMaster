//
//  result1ViewController.swift
//  sharingApp
//
//  Created by 大原一倫 on 2019/12/08.
//  Copyright © 2019 oharakazumasa. All rights reserved.
//

import UIKit

class result1ViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    var finishtime: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        resultLabel.text = String(format: "%.2f", finishtime)
    }
    
    @IBAction func selectAddRanking(){
        
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
