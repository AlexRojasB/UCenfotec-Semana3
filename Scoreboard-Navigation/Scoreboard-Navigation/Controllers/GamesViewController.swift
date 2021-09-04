//
//  GamesViewModel.swift
//  Scoreboard-Navigation
//
//  Created by Alexander Rojas Benavides on 9/1/21.
//

import UIKit

class GamesViewController: UITableViewController {
    var previousGame = String()
    
    let games = [
        "La carrera de lames",
        "Mira mi huevo",
        "Comer carnes",
        "Cantando como el DaddyY",
        "Oculta chats"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
         
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let game = self.games[indexPath.row]
        NotificationCenter.default.post(name: Notification.Name("getGame"), object: game)
        navigationController?.popViewController(animated: true)
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = tableView.dequeueReusableCell(withIdentifier: "row", for: indexPath)
    let game = games[indexPath.row]
    row.textLabel?.text = game
    if game == previousGame {
        row.accessoryType = .checkmark
    }
    
    return row
    }
}
