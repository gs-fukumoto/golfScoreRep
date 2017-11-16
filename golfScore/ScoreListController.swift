//
//  ScoreListController.swift
//  golfScore
//
//  Created by gs_fukumoto on 2017/11/06.
//  Copyright © 2017年 gs_fukumoto. All rights reserved.
//

import UIKit
import SwiftyJSON

class ScoreListController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var compeId : String!
    
    // APIのURLを定義
    var mainUrl = "http://35.167.79.161/webapi/select/score/"
    var articles: [[String: String?]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        getArticles()
    }
    
    
    func getArticles() {
        // URLを指定してオブジェクトを作成
        compeId = String(describing: appDelegate.compeId)
        let stringUrl = mainUrl + String(compeId)
        let url = URL(string: stringUrl)
        let request = URLRequest(url: url!)
        
        // コンフィグを指定してHTTPセッションを生成
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        
        // HTTP通信を実行する
        // ※dataにJSONデータが入る
        let task:URLSessionDataTask = session.dataTask(with: request, completionHandler: {data, responce, error in
            // エラーがあったら出力
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                // データ取得後の処理
                // JSONデータを食わせる
                let retJson = JSON(data: data!)
                //print(retJson)
                
                retJson[].forEach{(_, data) in
                    let article: [String: String?] = [
                        "comp": data["comp_id"].string,
                        "mem": data["mem_id"].string,
                        "hole": data["hole_id"].string,
                        "total": data["total"].string,
                        "putts": data["putts"].string
                    ]
                    self.articles.append(article)
                }
                
                self.tableView.reloadData()
                //print(self.articles)
            }
        })
        // HTTP通信を実行
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = table.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
        // セルの型を作る
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myCell")
        
        //セルを取得する。
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for:indexPath) as UITableViewCell
        
        // セルに表示するテキストを作る
        let article = articles[indexPath.row]
        //cell.textLabel?.text = article["total"]!
        //cell.detailTextLabel?.text = article["putts"]!
        
        // Tagが1の部品にアクセス
        let label1 = cell.viewWithTag(1) as! UILabel
        let label2 = cell.viewWithTag(2) as! UILabel
        let label3 = cell.viewWithTag(3) as! UILabel
        let label4 = cell.viewWithTag(4) as! UILabel
        let label5 = cell.viewWithTag(5) as! UILabel
        
        label1.text = (article["comp"]!)
        label2.text = (article["mem"]!)
        label3.text = (article["hole"]!)
        label4.text = (article["total"]!)
        label5.text = (article["putts"]!)
        // セルをリターンする
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //セルを取得する。
        let article = articles[indexPath.row]
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.compeId = article["comp"]!!
        appDelegate.memId = article["mem"]!!
        appDelegate.holeId = article["hole"]!!
        appDelegate.total = article["total"]!!
        appDelegate.putts = article["putts"]!!
        tableView.deselectRow(at: indexPath, animated: true)
        //ここに遷移処理を書く
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "ScoreDetail")
        present(nextView, animated: true, completion: nil)
        
    }
    
}
