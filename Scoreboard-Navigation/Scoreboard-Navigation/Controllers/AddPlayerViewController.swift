//
//  AddPlayerController.swift
//  Scoreboard-Navigation
//
//  Created by Alexander Rojas Benavides on 8/31/21.
//

import UIKit

class AddPlayerViewController: UITableViewController {
    public var completionHandler: ((String?) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func savePlayerTapped(_ sender: UIBarButtonItem) {
        completionHandler?("pato")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPlayerTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
