//
//  PlayersViewController.swift
//  Scoreboard-Navigation
//
//  Created by Alexander Rojas Benavides on 8/31/21.
//

import UIKit

class PlayersViewController: UITableViewController {
    public var completionHandler: ((Player?) -> Void)?
    var players = [
        Player(name: "Federico Mignon", game: "Comer carnes"),
        Player(name: "Calle 13", game: "Cantando como el DaddyY", stars: 4)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "PlayerTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PlayerTableViewCell")
    }
    
    @IBAction func addPlayerTapped(_ sender: Any) {
        if players.count < 10 {
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let addPlayerViewController = mainStoryBoard.instantiateViewController(withIdentifier: "AddPlayerViewController") as? AddPlayerViewController else {
                print("Something went wrong!")
                return
            }
            addPlayerViewController.completionHandler = { player in
                self.players.append(player!)
                self.players.sort { (player1, player2) in
                    player1.stars >= player2.stars
                }
                self.tableView.reloadData()
            }
            navigationController?.pushViewController(addPlayerViewController, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let addPlayerViewController = mainStoryBoard.instantiateViewController(withIdentifier: "AddPlayerViewController") as? AddPlayerViewController else {
            print("Something went wrong!")
            return
        }
        addPlayerViewController.player = self.players[indexPath.row]
        addPlayerViewController.completionHandler = { player in
            self.players[indexPath.row] = player!
            self.players.sort { (player1, player2) in
                player1.stars >= player2.stars
            }
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(addPlayerViewController, animated: true)
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count < 10 ? players.count : 10
    }
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
    cell.nameLabel.text = players[indexPath.row].name
    cell.gameLabel.text = players[indexPath.row].game
    cell.starsImage.image = UIImage(named: "\(players[indexPath.row].stars)Stars")
        return cell
    }
    
}
