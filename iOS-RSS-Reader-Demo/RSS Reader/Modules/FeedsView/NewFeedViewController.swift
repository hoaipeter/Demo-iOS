//
//  NewFeedViewController.swift
//  RSS Reader
//
//  Created by Hoai Ho on 29/07/2018.
//  Copyright © 2018 Hoai Ho. All rights reserved.
//

import UIKit

class NewFeedViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self
        self.urlTextField.delegate = self
        
        btnAdd.layer.cornerRadius = 5.0
        self.title = "Add New Feed"
    }
    
    
    @IBAction func addNewFeed(_ sender: Any) {
        Repo.feeds.append(Feed(name: nameTextField.text!, link: urlTextField.text!))
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancleNewFeed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
