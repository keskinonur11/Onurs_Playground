//
//  LiveRenderingViewController.swift
//  Playground
//
//  Created by Onur Keskin on 7.02.2020.
//  Copyright © 2020 Onur Keskin. All rights reserved.
//

import UIKit

class LiveRenderingViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func closeButtonTUI(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
