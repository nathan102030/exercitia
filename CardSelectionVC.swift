//
//  CardSelectionVC.swift
//  exercitia
//
//  Created by Nathan Demssie on 7/19/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    // what gives you acces to the card image view and thus allows you to make changes
    @IBOutlet var cardimageView:UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Card.Deck
    
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons{
            button.layer.cornerRadius = 8
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
  
    
    @objc func showRandomImage(){
        cardimageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
   
}
