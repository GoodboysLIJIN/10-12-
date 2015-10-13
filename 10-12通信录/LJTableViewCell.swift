//
//  LJTableViewCell.swift
//  10-12通信录
//
//  Created by 李进 on 15/10/12.
//  Copyright © 2015年 李进. All rights reserved.
//

import UIKit

class LJTableViewCell: UITableViewCell {
    
  
    @IBOutlet weak var detalabel: UILabel!
    
    @IBOutlet weak var namelabel: UILabel!
    
    var personA: person?{
        didSet{
            namelabel.text = personA?.name
            
            detalabel.text = "\(personA?.age ?? 0)"
        }
    }

}
