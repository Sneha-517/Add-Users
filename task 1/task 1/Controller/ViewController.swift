//
//  ViewController.swift
//  task 1
//
//  Created by DASARLA SNEHA on 29/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func navigator(_ sender: UITextField) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let resultVC = segue.destination as! ResultViewController
        }
    }

}

