//
//  PlayersViewController.swift
//  Scoreboard-Navigation
//
//  Created by Alexander Rojas Benavides on 8/31/21.
//

import UIKit

class PlayersViewController: UITableViewController {
    public var completionHandler: ((String?) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPlayerTapped(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let addPlayerViewController = mainStoryBoard.instantiateViewController(withIdentifier: "AddPlayerViewController") as? AddPlayerViewController else {
            print("perro")
            return
        }
        addPlayerViewController.completionHandler = { text in
            print("\(text!)")
        }
        navigationController?.pushViewController(addPlayerViewController, animated: true)
    }
}
