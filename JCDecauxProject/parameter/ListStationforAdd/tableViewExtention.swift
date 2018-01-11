//
//  tableViewExtention.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation
import UIKit

extension ListStationForFav: UITableViewDataSource, UITableViewDelegate{
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filterStations = GlobalArrayStationList.globalArrayStationList.filter({( station : Station) -> Bool in
            return (station.title?.lowercased().contains(searchText.lowercased()))!
        })
        
        tableView.reloadData()
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  isFiltering(){
            return filterStations.count
        }
        else {
            return GlobalArrayStationList.globalArrayStationList.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stationCell") as! StationForFavCell
        var station = GlobalArrayStationList.globalArrayStationList[indexPath.row]
        if  isFiltering(){
               station = filterStations[indexPath.row]
            }
        
            cell.stationName.text = station.title
            cell.stationAdress.text = station.subtitle
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("You selected cell number: \(indexPath.row)!")
        if  isFiltering(){
            let station = filterStations[indexPath.row]
            showAlert(station: station)
        }
        else {
            let station = GlobalArrayStationList.globalArrayStationList[indexPath.row]
            showAlert(station: station)
        }
        tableView.reloadData()
    }
    
    func showAlert(station: Station) {
        let alertController = UIAlertController(title: "Voulez vous rajouter la station \(String(describing: station.title))  en favoris", message:
            "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Annuler", style: UIAlertActionStyle.default,handler: nil))
        alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default,handler: { action in
            self.saveStation(stationAddFav: station)
            
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    }




extension ListStationForFav: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension ListStationForFav: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    
    
    
    
}
