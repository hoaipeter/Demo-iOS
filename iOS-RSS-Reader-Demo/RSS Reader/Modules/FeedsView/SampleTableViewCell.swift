//
//  SampleTableViewCell.swift
//  RSS Reader
//
//  Created by Hoai Ho on 8/7/18.
//  Copyright © 2018 Hoai Ho. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var sampleTitle: UILabel!
    @IBOutlet weak var sampleDate: UILabel!
    @IBOutlet weak var sampleDescription: UILabel! {
        didSet{
            sampleDescription.numberOfLines = 3
        }
    }
    
    var item2: RSSModel! {
        didSet{
            sampleTitle.text = item2.title
            sampleDescription.text = item2.description
            sampleDate.text = item2.pubDate
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
