//
//  SampleViewController.swift
//  Final-MVP
//
//  Created by Vinayak Nagaraj on 09/04/23.
//

import UIKit

class SampleViewController: UIViewController {

    @IBAction func onBtnClicked(){
        let vc = (storyboard?.instantiateViewController(withIdentifier: "ViewController"))!
        navigationController?.pushViewController(vc,animated: true)
    }

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

}
