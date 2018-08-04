//
//  FeedsTableViewController.swift
//  RSS Reader
//
//  Created by Hoai Ho on 29/07/2018.
//  Copyright © 2018 Hoai Ho. All rights reserved.
//

import UIKit

class FeedsTableViewController : UITableViewController {
    
    var feed : Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Feeds"
        
        Repo.feeds.append(Feed(name: "Apple Dev", link: "https://developer.apple.com/news/rss/news.rss"))
        Repo.feeds.append(Feed(name: "Techcrunch", link: "http://feeds.feedburner.com/TechCrunch/"))

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Repo.feeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath)
        
        cell.textLabel?.text = Repo.feeds[indexPath.row].name
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.feed = Repo.feeds[indexPath.row]
        
        self.performSegue(withIdentifier: "storySegue", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            Repo.feeds.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "storySegue" {
            if let destination = segue.destination as? StoryTableViewController {
                destination.feed = self.feed
            }
        }
    }
    
}
