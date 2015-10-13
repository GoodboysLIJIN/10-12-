//
//  ViewController.swift
//  10-12通信录
//
//  Created by 李进 on 15/10/12.
//  Copyright © 2015年 李进. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var personB: person?
    
    var didsavedata: (()->())?
    
    @IBOutlet weak var nametitle: UITextField!
    
    @IBOutlet weak var agetitle: UITextField!

    @IBAction func savedata() {
        
        personB?.name = nametitle.text
        
        personB?.age = Int(agetitle.text!) ?? 0
        
        didsavedata?()
        
        navigationController?.popToRootViewControllerAnimated(true)
        
        
    }
    
    @IBAction func textaction(sender: AnyObject) {
        
        navigationItem.rightBarButtonItem?.enabled = nametitle.hasText() && agetitle.hasText()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nametitle.text = personB?.name
        
        agetitle.text = "\(personB?.age ?? 0)"
        
        textaction(personB ?? 0)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

