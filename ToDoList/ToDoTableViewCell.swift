//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Mona Shamsolebad on 2019-09-15.
//  Copyright © 2019 Mona Shamsolebad. All rights reserved.
//

import UIKit
protocol ToDoCellDelegate : class {
    func checkmarkTapped(sender : ToDoTableViewCell)
}

class ToDoTableViewCell: UITableViewCell {
    weak var delegate : ToDoCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet var isCompleteButton: UIButton!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
