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
        Player(name: "Antonio Lames", game: "La carrera de lames", stars: 3),
        Player(name: "Federico Mignon", game: "Comer carnes"),
        Player(name: "Calle 13", game: "La cantada", stars: 4)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "PlayerTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PlayerTableViewCell")
    }
    
    @IBAction func addPlayerTapped(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let addPlayerViewController = mainStoryBoard.instantiateViewController(withIdentifier: "AddPlayerViewController") as? AddPlayerViewController else {
            print("Something went wrong!")
            return
        }
        addPlayerViewController.completionHandler = { player in
            self.players.append(player!)
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(addPlayerViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // completionHandler?(games[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return players.count
    }
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
    cell.nameLabel.text = players[indexPath.row].name
    cell.gameLabel.text = players[indexPath.row].game
    cell.starsImage.image = UIImage(named: "\(players[indexPath.row].stars)Stars")
      //  cell.textLabel?.text = games[indexPath.row]
        return cell
    }
    
}
