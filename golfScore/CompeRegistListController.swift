//
//  CompeRegistListController.swift
//  golfScore
//
//  Created by gs_fukumoto on 2017/11/15.
//  Copyright © 2017年 gs_fukumoto. All rights reserved.
//

import UIKit
import SwiftyJSON

class CompeRegistListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // APIのURLを定義
    var mainUrl = "http://35.167.79.161/webapi/select/compe/"
    var compId = "1"
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
        let stringUrl = mainUrl + compId
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
                print(retJson)
                
                retJson[].forEach{(_, data) in
                    let article: [String: String?] = [
                        "comp_id": data["comp_id"].string,
                        "comp_name": data["comp_name"].string
                    ]
                    self.articles.append(article)
                }
                
                self.tableView.reloadData()
                print(self.articles)
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
        
        //セルを取得する。
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for:indexPath) as UITableViewCell
        
        // セルに表示するテキストを作る
        let article = articles[indexPath.row]
        
        // Tagが1の部品にアクセス
        let label1 = cell.viewWithTag(1) as! UILabel
        let label2 = cell.viewWithTag(2) as! UILabel
        
        label1.text = (article["comp_id"]!)
        label2.text = (article["comp_name"]!)
        // セルをリターンする
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //セルを取得する。
        let article = articles[indexPath.row]
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.regCompeName = String(describing: article["comp_id"]!)
        appDelegate.regCompeCourse = String(describing: article["comp_id"]!)
        appDelegate.regMem1Grp = String(describing: article["comp_id"]!)
        appDelegate.regMem1Name = String(describing: article["comp_id"]!)
        appDelegate.regMem2Grp = String(describing: article["comp_id"]!)
        appDelegate.regMem2Name = String(describing: article["comp_id"]!)
        appDelegate.regMem3Grp = String(describing: article["comp_id"]!)
        appDelegate.regMem3Name = String(describing: article["comp_id"]!)
        appDelegate.regMem4Grp = String(describing: article["comp_id"]!)
        appDelegate.regMem4Name = String(describing: article["comp_id"]!)
        tableView.deselectRow(at: indexPath, animated: true)
        //ここに遷移処理を書く
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "CompeRegistDetail")
        present(nextView, animated: true, completion: nil)
        
    }


}
