//
//  FrendsComunityTableViewController.swift
//  VK_Belov
//
//  Created by Алексей Белов on 23.02.2021.
//

import UIKit

class FrendsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var firstLetter: FirstLetterOfTheName!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Регистрация своей таблички
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: CustomTableViewCell.reuseId)
        
        loadFrends()
    }
    
    // для передачи информации в новый экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? FotoCollectionViewController,
            let indexPath = tableView.indexPathForSelectedRow{
            
            let activFrend = getFriend(for: indexPath)
            controller.selectFrends.removeAll()
            controller.selectFrends.append(activFrend)
            }
     }
    
    // MARK: - Data source
    
    var myFrends: [ItemFrends] = []
    var myFrendsRealm: [ItemFrendsRealm] = []
    var filterMyFrends: [ItemFrends] = []
    var sections: [String] = []
    var myFrendsSection: [String: [ItemFrends]] = [:]
    //var frendsElement = [ItemFrends]()
    
    private func loadFrends(){
        
        myFrends = loadFrendsRealData()

        if myFrends.isEmpty {
            WebService().frendsRequest() {[weak self] frendsElementRequest in
                self?.myFrends = frendsElementRequest
                self?.setupDataSource()
                self?.tableView.reloadData()
            }
        }else{
            setupDataSource()
            WebService().frendsRequest() {[weak self] frendsElementRequest in
                self?.myFrends = frendsElementRequest
            }
        }
    }
    
    private func filterFriends(text: String?){
        guard let text = text, !text.isEmpty else{
            filterMyFrends = myFrends
            return
        }
        filterMyFrends = myFrends.filter{
            $0.name.lowercased().contains(text.lowercased())
        }
    }
    
    private func setupDataSource(){
        // 1 filter myFrends
        filterFriends(text: searchBar.text)
        
        // 2 create section firs latters
        let firstLetters = filterMyFrends.map { String( $0.name.uppercased().prefix(1) ) }
        sections = Array(Set(firstLetters)).sorted()
        
        // 3 create myFrendsSection
        myFrendsSection.removeAll()
        for section in sections {
            myFrendsSection[section] = filterMyFrends.filter{
                $0.name.uppercased().prefix(1) == section
            }
        }
    }
    
    private func getFriend( for indexPath: IndexPath) -> ItemFrends {
        let sectionLetter = sections[indexPath.section]
        return myFrendsSection[sectionLetter]![indexPath.row]
    }
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionLetter = sections[section]
        return (myFrendsSection[sectionLetter] ?? []).count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lable = UILabel()
        lable.textColor = .gray
        lable.text = sections[section]
        lable.font = .systemFont(ofSize: 24, weight: .bold)
        return lable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseId, for: indexPath) as! CustomTableViewCell
        let activFrend = getFriend(for: indexPath)
           
        cell.configure(name: activFrend.name + " " + activFrend.surname, user: activFrend)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "unwindSegie", sender: nil)
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print(searchText)
        
        setupDataSource()
        tableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        //print(#function)
        searchBar.resignFirstResponder()
    }
    
    
}
