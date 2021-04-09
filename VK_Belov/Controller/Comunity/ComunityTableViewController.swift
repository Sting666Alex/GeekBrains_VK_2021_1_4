//
//  ComunityTableViewController.swift
//  VK_Belov
//
//  Created by Алексей Белов on 26.02.2021.
//

import UIKit

class ComunityTableViewController: UITableViewController {

    var myComunity: [String] = []
//        "Ferst",
//        "Second"
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindSequeFromAllComunity(_ segue: UIStoryboardSegue){
        guard
            let controller = segue.source as? AllComunityTableViewController,
            let indexPath = controller.tableView.indexPathForSelectedRow
        else{ return }
        
        let comunity = controller.allComunity[indexPath.row]
        
        if !myComunity.contains(comunity){
            myComunity.append(comunity)
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    
    // для передачи информации в новый экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? AllComunityTableViewController {
            //let indexPath = tableView.indexPathForSelectedRow{
        controller.myComunity = myComunity//[indexPath.row]
            //}
        }
     }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myComunity.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComunityCell", for: indexPath)
        cell.textLabel?.text = myComunity[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myComunity.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
