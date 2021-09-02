//
//  AddPlayerController.swift
//  Scoreboard-Navigation
//
//  Created by Alexander Rojas Benavides on 8/31/21.
//

import UIKit

class AddPlayerViewController: UITableViewController {
    public var completionHandler: ((Player?) -> Void)?
    var player = Player()
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func savePlayerTapped(_ sender: UIBarButtonItem) {
        completionHandler?(self.player)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func NameEntered(_ sender: UITextField) {
        self.player.name = sender.text!
    }
    
    @IBAction func cancelPlayerTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let gamesViewController = mainStoryBoard.instantiateViewController(withIdentifier: "GamesViewController") as? GamesViewController else {
            print("Something went wrong!")
            return
        }
        gamesViewController.completionHandler = { game in
            self.player.game = game!
            self.detailLabel.text = game
        }
        navigationController?.pushViewController(gamesViewController, animated: true)
    }
}
