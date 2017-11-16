//
//  ViewController.swift
//  golfScore
//
//  Created by gs_fukumoto on 2017/10/31.
//  Copyright © 2017年 gs_fukumoto. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBAction func backToTop(segue: UIStoryboardSegue) {}
    
    @IBAction func CompeRegistButton(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "CompeRegistList")
        present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func CompeButton(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "CompeList")
        present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func CompeHistory(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "CompeHistoryList")
        present(nextView, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
