//
//  AllComunityViewController.swift
//  VK_Belov
//
//  Created by Алексей Белов on 27.02.2021.
//

import UIKit

class AllComunityTableViewController: UITableViewController {

    var allComunity: [String] = [
        "Family",
        "Job",
        "Frends",
        "Car"
    ]
    
    var myComunity: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allComunity = allComunity.filter { !myComunity.contains($0) }
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allComunity.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllComunityCell", for: indexPath)
        if !myComunity.contains(allComunity[indexPath.row]) {
            cell.textLabel?.text = allComunity[indexPath.row]
        }
        return cell
    }

}
