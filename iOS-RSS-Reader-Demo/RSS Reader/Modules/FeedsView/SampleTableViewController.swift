//
//  SampleTableViewController.swift
//  RSS Reader
//
//  Created by Hoai Ho on 8/7/18.
//  Copyright © 2018 Hoai Ho. All rights reserved.
//

import UIKit

class SampleTableViewController: UITableViewController {

    private var rssItems : [RSSModel]?
    private var rssItem : RSSModel?
    
    var feed : Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 155.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        fetchData()
    }
    
    private func fetchData(){
        let feedParser = Parser()
        feedParser.parseFeed(url: "https://developer.apple.com/news/rss/news.rss") {
            (rssItems) in self.rssItems = rssItems
            
            OperationQueue.main.addOperation {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let rssItems = rssItems else {
            return 0
        }
        return rssItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppleFeedCell", for: indexPath) as! SampleTableViewCell
        
        if let item2 = rssItems?[indexPath.item]{
            cell.item2 = item2
            cell.selectionStyle = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        rssItem = rssItems?[indexPath.row]
        
        self.performSegue(withIdentifier: "sampleViewSegue", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sampleViewSegue" {
            if let des = segue.destination as? WebViewController {
                des.initWithUrl(stringUrl: self.rssItem!)
            }
        }
    }
 

}
