//
//  ACell.swift
//  EngVocabulary
//
//  Created by admin on 11/29/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ACell: UICollectionViewCell {
    var topicName: UILabel!
    var imageView: UIImageView!
    var topicContent: UILabel!
    var contentLabelHeight: CGFloat = 30
    var cellWidth: CGFloat = 100
    var nameLabelHeight: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var intrinsicContentSize : CGSize {
        return CGSize(width: cellWidth, height: cellWidth + nameLabelHeight);
    }
    
    func addSubviews() {
        if (imageView == nil) {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cellWidth, height: cellWidth))
            imageView.layer.borderColor = tintColor.cgColor
            imageView.contentMode = .scaleAspectFit
            contentView.addSubview(imageView)
        }
        
        if (topicName == nil) {
            topicName = UILabel(frame: CGRect(x: 0, y: cellWidth, width: cellWidth, height: nameLabelHeight))
            topicName.textAlignment = .center
            topicName.textColor = UIColor.init(red: 48/255, green: 158/255, blue: 99/255, alpha: 1)
            topicName.highlightedTextColor = tintColor
            topicName.font = UIFont.systemFont(ofSize: 15)
            topicName.numberOfLines = 2
            contentView.addSubview(topicName)
        }
        if (topicContent == nil) {
            topicContent = UILabel(frame: CGRect(x: 0, y: cellWidth + nameLabelHeight, width: cellWidth, height: contentLabelHeight))
            topicContent.textAlignment = .center
            topicContent.textColor = UIColor(red: 255/255, green: 116/255, blue: 35/255, alpha: 1)
            topicContent.font = UIFont.boldSystemFont(ofSize: 12)
            topicContent.numberOfLines = 2
            contentView.addSubview(topicContent)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.layer.borderWidth = isSelected ? 5 : 0
        }
    }
}
