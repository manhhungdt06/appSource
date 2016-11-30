//
//  DetailVC.swift
//  EngVocabulary
//
//  Created by admin on 11/29/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class DetailCellVC: UITableViewController {
    
    var langItem: LangItem!
    var item: word!
    
    var dictData: NSDictionary!
    var dictDetail: NSDictionary!
    
    var arrayKeys: NSArray!
    
//    var fileName: String = ""
    var path: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        switch item.name! {
//            case "TOEFL":
//                fileName = "toefl"
//        default:
//            print("none")
//        }
        path = Bundle.main.path(forResource: "items", ofType: "plist")!
        
        dictData = NSDictionary(contentsOfFile: path)!
        
        arrayKeys = dictData.allKeys as NSArray!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let key: String = arrayKeys[indexPath.row] as! String

//        detail = NSDictionary(dictionary: dictData[key]! as! Dictionary)
//        print("detail = \(detail["image"]!)")
        cell.textLabel?.text = key
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DetailWordVC") {
            
            let detaiWordlVC = segue.destination as! DetailWordVC
            
            let selectedRowIndex: IndexPath = self.tableView.indexPathForSelectedRow!
            
            let key: String = arrayKeys[selectedRowIndex.row] as! String
            dictDetail = NSDictionary(dictionary: dictData[key]! as! Dictionary)
            
            item = word(text: key, sentence: dictDetail["sentence"]! as! String, meaning: dictDetail["meaning"]! as! String, type: dictDetail["type"]! as! String, vocal: dictDetail["vocalization"]! as! String, sound: dictDetail["sound"]! as! String, image: dictDetail["image"]! as! String, synonym: dictDetail["synonym"]! as! String)

            detaiWordlVC.items = item
        }
    }
}
