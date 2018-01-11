//
//  var filterStations = [Station]()     let searchController = UISearchController(searchResultsController: nil)     var selectedIndex : NSInteger! = -1 StationCell.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import UIKit

class StationCell: UITableViewCell {

    @IBOutlet weak var imageBorne: UIImageView!
    @IBOutlet weak var imageVelov: UIImageView!
    @IBOutlet weak var nameStation: UILabel!
    @IBOutlet weak var adressStation: UILabel!
    
    @IBOutlet weak var viewDetail: UIView!
    @IBOutlet weak var numberBikeLabel: UILabel!
    
    @IBOutlet weak var terminalBikeLable: UILabel!
    class var expandedHeight : CGFloat { get {  return 130}}
    class var defaultHeight : CGFloat { get { return 70}}
    
    func detailHeight() {
        viewDetail.isHidden = (frame.size.height < StationCell.expandedHeight)
    }
    
    func watchFrame(){
        addObserver(self, forKeyPath: "frame", options: .new, context: nil)
        
        detailHeight()
    }
    
    func ignoreFrame() {
        removeObserver(self, forKeyPath: "frame")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "frame" {
            detailHeight()}
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }


}
