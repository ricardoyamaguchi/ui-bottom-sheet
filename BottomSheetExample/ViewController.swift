//
//  ViewController.swift
//  BottomSheetExample
//
//  Created by Ricardo Yamaguchi on 25/09/21.
//

import UIKit
import BottomSheet

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTap(_ sender: Any) {
        let viewController = BottomSheetViewController()
        navigationController?.present(viewController, animated: true)
    }


}

