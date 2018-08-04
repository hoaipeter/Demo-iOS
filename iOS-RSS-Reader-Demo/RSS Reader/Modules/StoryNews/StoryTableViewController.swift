//
//  StoryTableViewController.swift
//  RSS Reader
//
//  Created by Hoai Ho on 29/07/2018.
//  Copyright © 2018 Hoai Ho. All rights reserved.
//

import UIKit

class StoryTableViewController : UITableViewController {
    
    private var rssItems : [RSSModel]?
    private var rssItem : RSSModel?
    
    var feed : Feed?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 155.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = feed?.name
        fetchData()
    }
    
    private func fetchData(){
        
        let feedParser = Parser()
        feedParser.parseFeed(url: (feed?.link)!) { (rssItems) in
            self.rssItems = rssItems
            
            OperationQueue.main.addOperation {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
            }
            
        }
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rssItems = rssItems else {
            return 0
        }
        
        return rssItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryTableViewCell
        
        if let item = rssItems?[indexPath.item]{
            cell.item = item
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        rssItem = rssItems?[indexPath.row]
        
        self.performSegue(withIdentifier: "webViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webViewSegue" {
            if let destination = segue.destination as? WebViewController {
                destination.rssItem = self.rssItem
            }
        }
    }
}












