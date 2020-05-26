//
//  ConcentrationThemeChoiseViewController.swift
//  Concentration
//
//  Created by Артём Харичев on 13.03.2020.
//  Copyright © 2020 Артём Харичев. All rights reserved.
//

import UIKit

class ConcentrationThemeChoiseViewController: UIViewController, UISplitViewControllerDelegate {

    let themes = [
        "Sports"   : "⚽️🏀🏈⚾️🏓⛸🥌🎱🏑⛷🥊🏐",
        "Animals"  : "🦜🦄🐙🐇🐩🦆🐅🐊🐋🐪🦓🐒",
        "Faces"    : "🐭🥰😻💩😡😀🦊👮🏻‍♂️💂🏻🤦🏻‍♂️🤠🥴",
        "Halloween": "👻🎃🦅👹🕸🕷💀🐺🐞🧟‍♂️🏴‍☠️🧛🏻‍♂️",
    
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc  = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }

    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
        
        if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
            cvc.theme = theme
            }
        }else if let cvc = lastSeguedConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else
        {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
        
        
    }
    
    private var splitViewDetailConcentrationViewController : ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    
    private var lastSeguedConcentrationViewController : ConcentrationViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    lastSeguedConcentrationViewController = cvc
                }
            }
            
            
        }
        
    }
    

}
