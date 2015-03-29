//
//  ResultViewController.swift
//  Roshambo
//
//  Created by OLIVER HAGER on 3/29/15.
//  Copyright (c) 2015 OLIVER HAGER. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var imageName : String!
    var labelText : String!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = labelText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgain(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

