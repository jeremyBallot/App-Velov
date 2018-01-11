//
//  tableExtentionControlleur.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation
import UIKit

extension ListStationViewController: UITableViewDataSource, UITableViewDelegate{
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
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! StationCell).watchFrame()
        
    }
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! StationCell).ignoreFrame()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  isFiltering(){
            return filterStations.count
        }
        else {
            return GlobalArrayStationList.globalArrayStationList.count
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == selectedIndex{
            selectedIndex = -1
        }else{
            selectedIndex = indexPath.row
            
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex
        {
            
            return StationCell.expandedHeight
        }else{
            return StationCell.defaultHeight
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stationCell") as! StationCell
        if  isFiltering(){
            let station = filterStations[indexPath.row]
            if indexPath.row == selectedIndex{
                self.api.stationCkeck(valueStation:  station.number! , completionHandler: {dict in DispatchQueue.main.async {
                    if dict != nil {
                    if let number = dict!["available_bikes"] as? Int {
                        cell.numberBikeLabel.text = "\(number)"
                        cell.imageBorne.isHidden = false
                        cell.imageVelov.isHidden = false
                    }
                    else{
                        cell.numberBikeLabel.text = "error_loading".translate
                    }
                    if let number = dict!["available_bike_stands"] as? Int {
                        
                        cell.terminalBikeLable.text = "\(number)"
                    }
                    else{
                        cell.terminalBikeLable.text = "error_loading".translate
                    }
                    }
                    else {
                        cell.numberBikeLabel.text = "Impossible_to_connect".translate
                        cell.imageBorne.isHidden = true
                        cell.imageVelov.isHidden = true
                    }
                    
                    }
                })}
            if cell.numberBikeLabel.text == "" {
                cell.numberBikeLabel.text = "Impossible_to_connect".translate
                cell.imageBorne.isHidden = true
                cell.imageVelov.isHidden = true}
            
            cell.nameStation.text = station.title
            cell.adressStation.text = station.subtitle
            return cell
        }
        else {
            
            let station = GlobalArrayStationList.globalArrayStationList[indexPath.row]
            if indexPath.row == selectedIndex{
                 self.api.stationCkeck(valueStation:  station.number! , completionHandler: {dict in DispatchQueue.main.async {
                    if dict != nil {
                    if let number = dict!["available_bikes"] as? Int {
                        
                        cell.numberBikeLabel.text = "\(number)"
                        cell.imageBorne.isHidden = false
                        cell.imageVelov.isHidden = false
                    }
                    else{
                        cell.numberBikeLabel.text = "error_loading".translate
                    }
                    if let number = dict!["available_bike_stands"] as? Int {
                        
                        cell.terminalBikeLable.text = "\(number)"
                    }
                    else{
                        cell.numberBikeLabel.text = "error_loading".translate
                    }
                    }
                    else {
                        cell.numberBikeLabel.text = "Impossible_to_connect".translate
                        cell.imageBorne.isHidden = true
                        cell.imageVelov.isHidden = true
                    }
                    }
                })}
            
            
            cell.nameStation.text = station.title
            if station.subtitle == "" {
                cell.adressStation.text = "unknown_address".translate
            }
            else {
            cell.adressStation.text = station.subtitle
            }
            return cell
        }
    }
    
    
    
}

extension ListStationViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension ListStationViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
