//
//  StoryTableViewCell.swift
//  RSS Reader
//
//  Created by Hoai Ho on 29/07/2018.
//  Copyright © 2018 Hoai Ho. All rights reserved.
//

import UIKit


class StoryTableViewCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet{
            descriptionLabel.numberOfLines = 3
        }
    }
    
    var item: RSSModel! {
        didSet{
            titleLabel.text = item.title
            descriptionLabel.text = item.description
            dateLabel.text = item.pubDate
        }
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
