//
//  ViewController.swift
//  TableView
//
//  Created by André Levi Oliveira Silva on 06/05/22.
//

import UIKit

final class ViewController: UIViewController {
    
    var animals = [Animal(image: "😆", name: "cabrito"),
                   Animal(image: "😇", name: "holerite"),
                   Animal(image: "😆", name: "nelson"),
                   Animal(image: "💀", name: "mandelo"),
                   Animal(image: "👩🏻‍🎤", name: "oculos"),
                   Animal(image: "🥹", name: "strogf"),
                   Animal(image: "🧑🏼‍🚒", name: "bombeiro")]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight  = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        
        self.tableView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "AnimalTableViewCell")
        
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as? AnimalTableViewCell {
            cell.animal = self.animals[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
}
