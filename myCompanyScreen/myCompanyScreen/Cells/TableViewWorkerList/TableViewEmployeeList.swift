//
//  TableViewWorkerList.swift
//  myCompanyScreen
//
//  Created by Barış Berkin Taşçı on 27.12.2020.
//

import UIKit


class TableViewEmployeeList: UITableViewCell {

    // MARK: - OUTLETS
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellView: TableViewEmployeeList!

    // MARK: - LIFE CYCLE METHODS
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
        
    }

    fileprivate func prepareUI() {
        prepareLayer(object: cellLabel as Any)
        prepareLayer(object: cellView as Any)
    }
    
    fileprivate func prepareLayer(object: Any) {
        if let object = object as? UIView {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        } else if let object = object as? UILabel {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - METHODS
    
    func setCell (newWorker: EmployeeP) {
        cellLabel.text = newWorker.name + "\t \t \t \t \t" + String (newWorker.age) + " \t \t \t \t" + "$\(String(newWorker.getCost()))"
    }
}
