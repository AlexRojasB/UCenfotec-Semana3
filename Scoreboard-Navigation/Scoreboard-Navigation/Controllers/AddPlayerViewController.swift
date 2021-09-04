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
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
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
    
    @IBAction func clickStar(_ sender: UIButton) {
        self.player.stars = 1
        clearStars()
        switch sender {
        case star2:
            self.player.stars = 2
            star2.setImage(UIImage(systemName: "star.fill"), for: .normal)
        case star3:
            self.player.stars = 3
            star2.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star3.setImage(UIImage(systemName: "star.fill"), for: .normal)
        case star4:
            self.player.stars = 4
            star2.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star3.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star4.setImage(UIImage(systemName: "star.fill"), for: .normal)
        case star5:
            self.player.stars = 5
            star2.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star3.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star4.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star5.setImage(UIImage(systemName: "star.fill"), for: .normal)
        default:
            clearStars()
        }
    }
    
    func clearStars() {
        star2.setImage(UIImage(systemName: "star"), for: .normal)
        star3.setImage(UIImage(systemName: "star"), for: .normal)
        star4.setImage(UIImage(systemName: "star"), for: .normal)
        star5.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let section = indexPath.section
        if section == 1 {
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
}
