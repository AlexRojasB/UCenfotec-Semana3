//
//  GamesViewModel.swift
//  Scoreboard-Navigation
//
//  Created by Alexander Rojas Benavides on 9/1/21.
//

import UIKit

class GamesViewController: UITableViewController {
    public var completionHandler: ((String?) -> Void)?
    
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
        completionHandler?(games[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "row", for: indexPath)
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
}
