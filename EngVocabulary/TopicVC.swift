//
//  TopicVC.swift
//  EngVocabulary
//
//  Created by admin on 11/29/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class TopicVC: UIViewController {
    var items: [LangItem] = []
    var settingParams: SettingParam!
    var wordTime: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "topic", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
            for key in (myDict?.allKeys)! {
                if key as? String == settingParams.language! {
                    let dictDetail: NSDictionary = NSDictionary(dictionary: myDict?[key] as! Dictionary)
                    for detail in (dictDetail.allValues as? [[String: Any]])! {
                        self.items.append(LangItem(name: detail["name"] as! String, nameImg: detail["image"] as! String, content: detail["content"] as! String))
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TopicVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ACell", for: indexPath) as! ACell
        cell.addSubviews()
        cell.imageView.contentMode = .scaleAspectFit
        cell.imageView.image = UIImage(named: items[(indexPath as NSIndexPath).item].img!)
        cell.topicName.text = items[(indexPath as NSIndexPath).item].name
        cell.topicContent.text = items[(indexPath as NSIndexPath).item].content
        return cell
    }
}

extension TopicVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let studyWordView = self.storyboard?.instantiateViewController(withIdentifier: "DetailWordVC") as? DetailWordVC
        
        studyWordView?.category = items[(indexPath as NSIndexPath).item].name
        studyWordView?.settings = settingParams
        
        // get name of plist file: TOEIC/ TOEFL/ IELTS ...
        // level, flashcardColor, wordType, ? time restudy
        print("items: \(items[(indexPath as NSIndexPath).item].name)")
        self.navigationController?.pushViewController(studyWordView!, animated: true)
    }
}
