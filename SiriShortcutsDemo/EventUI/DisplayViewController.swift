//
//  DisplayViewController.swift
//  EventUI
//
//  Created by 邹亮明 on 2018/12/13.
//  Copyright © 2018 zlm. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "hello"
        view.addSubview(label)
        view.backgroundColor = .red
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

}
