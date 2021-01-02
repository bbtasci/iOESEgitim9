//
//  TableViewWorkerList.swift
//  myCompanyScreen
//
//  Created by Barış Berkin Taşçı on 27.12.2020.
//

import UIKit


class TableViewWorkerList: UITableViewCell {

    // MARK: - OUTLETS
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellView: TableViewWorkerList!

    // MARK: - LIFE CYCLE METHODS
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareLayer(object: cellLabel as Any)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareLayer(object: Any) {
        if let object = object as? UIView {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        }
    }
    
    // MARK: - METHODS
    
    func setCell (newWorker: EmployeeP) {
        cellLabel.text = newWorker.name + "\t \t \t \t " + String (newWorker.age) + "\t \t \t \t \t     " + String(newWorker.getCost())
    }

}
