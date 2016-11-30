//
//  DetailWordVC.swift
//  EngVocabulary
//
//  Created by admin on 11/29/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import AVFoundation

class DetailWordVC: UIViewController, AVAudioPlayerDelegate {
    
    var items: word!
    var backView: UIView!
    var back: UIImageView!
    var isFront = true
    
    var viewBgr: UIView!
    var wordText: UITextView!
    var typeText: UITextView!
    var pronunText: UITextView!
    var sentenText: UITextView!
    var meanText: UITextView!
    
    var audio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // T.O.D.O
        
        audio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: items.sound!, ofType: "mp3")!))
        audio.delegate = self
        audio.prepareToPlay()
        
        
        // implement layout
        // word text
        wordText = UITextView(frame: CGRect(x: 8, y: 9, width: 328, height: 130))
        //       (229 , 221, 138)
        createText(wordText, items.text!, UIColor.init(red: 229/255, green: 221/255, blue: 138/255, alpha: 1), UIFont.init(name: "MarkerFelt-Wide", size: 40)!)
        
        // word type text
        typeText = UITextView(frame: CGRect(x: 8, y: 147, width: 100, height: 51))
        //       (93 , 229, 137)
        createText(typeText, items.type!, UIColor.init(red: 93/255, green: 229/255, blue: 137/255, alpha: 1), UIFont.init(name: "Menlo-Regular", size: 19)!)
        
        // word vocal text
        pronunText = UITextView(frame: CGRect(x: 116, y: 147, width: 220, height: 51))
        createText(pronunText, items.vocal!, UIColor.init(red: 62/255, green: 188/255, blue: 255/255, alpha: 1), UIFont.init(name: "Menlo-Regular", size: 19)!)
        
        // cau vi du
        sentenText = UITextView(frame: CGRect(x: 8, y: 226, width: 328, height: 114))
        //        (121 ,200, 216)
        createText(sentenText, items.sentence!, UIColor.init(red: 121/255, green: 200/255, blue: 216/255, alpha: 1), UIFont.init(name: "HelveticaNeue-Italic", size: 20)!)
        
        let rect1 = CGRect(x: 8, y: 9, width: 340, height: 280)
        
        back = UIImageView(frame: rect1)
        let wordImg = UIImage(named: items.image!)
        
        let newBackImg = ResizeImage(image: wordImg!, targetSize: CGSize(width: 340, height: 280))
        back = UIImageView(image: newBackImg)
        // y nghia tu
        meanText = UITextView(frame: CGRect(x: 8, y: 226, width: 328, height: 114))
        //        (177 , 219, 199)
        createText(meanText, items.meaning!, UIColor.init(red: 177/255, green: 219/255, blue: 199/255, alpha: 1), UIFont.init(name: "HelveticaNeue-Italic", size: 40)!)
        let rect2 = CGRect(x: 0, y: 0, width: 344, height: 299)
        backView = UIView(frame: rect2)
        
        backView.addSubview(back)
        backView.addSubview(meanText)
        
        
        let rect = CGRect(x: 16, y: 100, width: 344, height: 358)
        viewBgr = UIView(frame: rect)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        singleTap.numberOfTapsRequired = 1
        
        viewBgr.addGestureRecognizer(singleTap)
        viewBgr.isUserInteractionEnabled = true
        
        viewBgr.addSubview(wordText)
        viewBgr.addSubview(typeText)
        viewBgr.addSubview(pronunText)
        viewBgr.addSubview(sentenText)
        view.addSubview(viewBgr)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 8, y: 9, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func createText(_ textField: UITextView,_ text: String,_ color: UIColor,_ font: UIFont) {
        textField.text = text
        textField.font = font
        textField.backgroundColor = color
        textField.textAlignment = .center
        textField.isEditable = false
    }
    
    func tapped() {
        if (isFront) {
            UIView.transition(from: wordText, to: backView, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
        } else {
            UIView.transition(from: backView, to: wordText, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
        }
        isFront = !isFront
    }
    
    @IBAction func action_play(_ sender: UIButton) {
        audio.play()
    }
}
