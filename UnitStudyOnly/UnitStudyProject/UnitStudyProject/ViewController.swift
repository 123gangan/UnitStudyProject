//
//  ViewController.swift
//  UnitStudyProject
//
//  Created by 阪井　洋樹 on 2020/10/07.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func gotoRoopPlayMovieVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RoopPlayMovie", bundle: nil)
        let nextViewController = storyboard.instantiateInitialViewController() as! RoopPlayMovieViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    

}

