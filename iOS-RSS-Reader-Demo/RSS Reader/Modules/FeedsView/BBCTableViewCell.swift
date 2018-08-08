//
//  BBCTableViewCell.swift
//  RSS Reader
//
//  Created by Hoai Ho on 8/7/18.
//  Copyright © 2018 Hoai Ho. All rights reserved.
//

import UIKit

class BBCTableViewCell: UITableViewCell {

    @IBOutlet weak var BBCTitle: UILabel!
    @IBOutlet weak var BBCDate: UILabel!
    @IBOutlet weak var BBCDescription: UILabel! {
        didSet{
            BBCDescription.numberOfLines = 3
        }
    }
    
    var item3: RSSModel! {
        didSet{
            BBCTitle.text = item3.title
            BBCDescription.text = item3.description
            BBCDate.text = item3.pubDate
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
