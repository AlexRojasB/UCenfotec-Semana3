//
//  AddPlayerController.swift
//  Scoreboard-Navigation
//
//  Created by Alexander Rojas Benavides on 8/31/21.
//

import UIKit

class AddPlayerViewController: UITableViewController {
    public var completionHandler: ((String?) -> Void)?
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func savePlayerTapped(_ sender: UIBarButtonItem) {
        completionHandler?("pato")
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelPlayerTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let gamesViewController = mainStoryBoard.instantiateViewController(withIdentifier: "GamesViewController") as? GamesViewController else {
            print("perro")
            return
        }
        gamesViewController.completionHandler = { text in
            self.detailLabel.text = text
        }
        navigationController?.pushViewController(gamesViewController, animated: true)
    }
}
