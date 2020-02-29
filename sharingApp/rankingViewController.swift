//
//  rankingViewController.swift
//  sharingApp
//
//  Created by 大原一倫 on 2019/12/08.
//  Copyright © 2019 oharakazumasa. All rights reserved.
//

import UIKit
import Firebase

class rankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet var tableView: UITableView!
    
    var postArray: [Post] = []
    var sortedPostArray: [Post] = []
    var database: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RankingTableViewCell", bundle: nil),
        forCellReuseIdentifier: "rCell")
        database = Firestore.firestore()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
                    return  atof(a.content1) < atof(b.content1)
                                      })
                   }
                self.tableView.reloadData()
               }
           }
    }
    
    @IBAction func selectreload(){
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
                            return  atof(a.content1) < atof(b.content1)
                                              })
                          }
                       self.tableView.reloadData()
                      }
                  }
    }
    
    @IBAction func selectBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rCell") as! RankingTableViewCell
        cell.nameLabel.text = postArray[indexPath.row].content
        cell.timeLabel.text = String(postArray[indexPath.row].content1)
        return cell
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
