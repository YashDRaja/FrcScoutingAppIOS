//
//  ViewController.swift
//  FRCScouting
//
//  Created by Stefan Georgiev on 2020-02-18.
//  Copyright © 2020 Stefan Georgiev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TeamNumberTextField: UITextField!
    @IBOutlet weak var BallScoredLabel: UILabel!
    @IBOutlet weak var PlusBallsBtn: UIButton!
    @IBOutlet weak var MinusBallBtn: UIButton!
    @IBOutlet weak var ClimbYesBtn: UIButton!
    @IBOutlet weak var ClimbNoBtn: UIButton!
    @IBOutlet weak var BalancedYesBtn: UIButton!
    @IBOutlet weak var BalancedNoBtn: UIButton!
    @IBOutlet weak var ColourWheelYesBtn: UIButton!
    @IBOutlet weak var ColourWheelNoBtn: UIButton!
    @IBOutlet weak var AutoPointsTextField: UITextField!
    @IBOutlet weak var commentsTextField: UITextField!
    @IBOutlet weak var DoneBtn: UIButton!
    var Climb: Bool? = nil;
    var Balanced: Bool? = nil;
    var ColourWheel: Bool? = nil;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func PlusBallsBtnPressed(_ sender: UIButton) {
        let counterString: String = BallScoredLabel.text!;
        var counterInt: Int = Int(counterString)!;
        counterInt+=1;
        BallScoredLabel.text = String(counterInt);
    }
    
    @IBAction func MinusBallsBtnPressed(_ sender: UIButton) {
        let counterString: String = BallScoredLabel.text!;
        var counterInt: Int = Int(counterString)!;
        if counterInt>0{
            counterInt-=1;
        }
        BallScoredLabel.text = String(counterInt);
    }
    
    @IBAction func ClimbYesBtnPressed(_ sender: UIButton) {
        ClimbYesBtn.isEnabled = false;
        ClimbNoBtn.isEnabled = true;
        Climb = true;
    }
    
    @IBAction func ClimbNoBtnPressed(_ sender: UIButton) {
        ClimbNoBtn.isEnabled = false;
        ClimbYesBtn.isEnabled = true;
        Climb = false;
    }
    
    @IBAction func BalancedYesBtnPressed(_ sender: UIButton) {
        BalancedYesBtn.isEnabled = false;
        BalancedNoBtn.isEnabled = true;
        Balanced = true;
    }
    @IBAction func BalancedNoBtnPressed(_ sender: UIButton) {
        BalancedYesBtn.isEnabled = true;
        BalancedNoBtn.isEnabled = false;
        Balanced = false;
    }
    @IBAction func ColourWheelYesBtnPressed(_ sender: UIButton) {
        ColourWheelYesBtn.isEnabled = false;
        ColourWheelNoBtn.isEnabled = true;
        ColourWheel = true;
    }
    @IBAction func ColourWheelNoBtnPressed(_ sender: UIButton) {
        ColourWheelYesBtn.isEnabled = true;
        ColourWheelNoBtn.isEnabled = false;
        ColourWheel = false;
    }
    
    @IBAction func DoneBtnPressed(_ sender: UIButton) {
        var team: Team = Team(teamName: TeamNumberTextField.text!, climb: Climb!, balanced: Balanced!, colourWheel: ColourWheel!, autoPoints: AutoPointsTextField.text!, comments: commentsTextField.text!);
        TeamNumberTextField.text = "";
        BalancedNoBtn.isEnabled = true;
        BalancedYesBtn.isEnabled = true;
        ColourWheelNoBtn.isEnabled = true;
        ColourWheelYesBtn.isEnabled = true;
        ClimbYesBtn.isEnabled = true;
        ClimbNoBtn.isEnabled = true;
        AutoPointsTextField.text = "";
        commentsTextField.text = "";
        BallScoredLabel.text = "";
    }
}

