//
//  SelectViewController.swift
//  Roshambo
//
//  Created by OLIVER HAGER on 3/29/15.
//  Copyright (c) 2015 OLIVER HAGER. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!

    let PAPER = 1
    let ROCK = 2
    let SCISSOR = 3
    let UNDEFINED = 0
    
    let TIE = ["itsATie", "It's a Tie!"]
    let PAPER_COVERS_ROCK_WIN = ["PaperCoversRock", "Paper covers Rock. You Win!"]
    let SCISSOR_CUTS_PAPER_WIN = ["ScissorCutPaper", "Scissor cuts Paper. You Win!"]
    let ROCK_CRUSHES_SCISSOR_WIN = ["RockCrushesScissors", "Rock crushes Scissor. You Win!"]
    let PAPER_COVERS_ROCK_LOOSE = ["PaperCoversRock", "Paper covers Rock. You Loose!"]
    let SCISSOR_CUTS_PAPER_LOOSE = ["ScissorCutPaper", "Scissor cuts Paper. You Loose!"]
    let ROCK_CRUSHES_SCISSOR_LOOSE = ["RockCrushesScissors", "Rock crushes Scissor. You Loose!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomSelectionValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    func getOpponentsSelection() -> Int {
        var selection = randomSelectionValue()
        return selection
    }
    
    @IBAction func selectRock() {
        var controller: ResultViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as ResultViewController
        initializeController(rockButton, controller: controller)
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func selectPaper() {
        performSegueWithIdentifier("viewResult", sender: paperButton)
    }

    func calculateResult(selectionMe: Int, selectionOpponent: Int) -> [String] {
        if(selectionOpponent == ROCK && selectionMe == PAPER) {
            return PAPER_COVERS_ROCK_WIN
        }
        else if(selectionMe == SCISSOR && selectionOpponent == PAPER) {
            return SCISSOR_CUTS_PAPER_WIN
        }
        else if(selectionOpponent == SCISSOR && selectionMe == ROCK) {
            return ROCK_CRUSHES_SCISSOR_WIN
        }
        if(selectionMe == ROCK && selectionOpponent == PAPER) {
            return PAPER_COVERS_ROCK_LOOSE
        }
        else if(selectionOpponent == SCISSOR && selectionMe == PAPER) {
            return SCISSOR_CUTS_PAPER_LOOSE
        }
        else if(selectionMe == SCISSOR && selectionOpponent == ROCK) {
            return ROCK_CRUSHES_SCISSOR_LOOSE
        }
        else {
            return TIE
        }
    }
    
    func initializeController(sender: UIButton, controller: ResultViewController) {
        let selectionOpponent = getOpponentsSelection()
        var selectionMe = 0
        var button = sender as UIButton
        switch(button) {
        case paperButton :
            selectionMe = PAPER
        case rockButton :
            selectionMe = ROCK
        case scissorButton :
            selectionMe = SCISSOR
        default :
            selectionMe = UNDEFINED
        }
        let result = calculateResult(selectionMe, selectionOpponent: selectionOpponent)
        controller.imageName = result[0]
        controller.labelText = result[1]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var controller = segue.destinationViewController as ResultViewController
        var button = sender as UIButton
        initializeController(button, controller: controller)
    }

}

