//
//  AboutViewController.swift
//  MusicMan
//
//  Created by Arnav Shukla on 16/07/21.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var pfp: UIImageView!
    @IBOutlet var aboutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      view.backgroundColor = .systemBackground
        pfp.layer.cornerRadius = 30
        pfp.layer.shadowOpacity = 0.4
        pfp.layer.shadowColor = UIColor.gray.cgColor
        pfp.layer.shadowRadius = 20
        pfp.layer.shadowOffset = .zero
        
        aboutLabel.text = "MusicMan is an app created to pratice collection view and tab View, you all can clone this project as an example on how to use both. If you have any further questions you all can contact me."
        
    }
    

 
}
