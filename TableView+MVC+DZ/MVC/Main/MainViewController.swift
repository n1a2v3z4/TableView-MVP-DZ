//
//  MainViewController.swift
//  TableView+MVC+DZ
//
//  Created Cергей Иванович on 23.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: View -
protocol MainViewProtocol: AnyObject {
    func showNextScreen()
    func text() -> String
    
}


class MainViewController: UIViewController, MainViewProtocol {
    
    
    
    private let passwd = "4444"
    
    @IBOutlet weak private var textFildOutlet: UITextField!
    
	var presenter: MainPresenterProtocol = MainPresenter()

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
        textFildOutlet.placeholder = "Введите пароль"
    }

   
    
    @IBAction func nextViewAction(_ sender: Any) {
       
        if textFildOutlet.text == passwd {
        presenter.buttonPressedNext()
        } else {
        presenter.buttonPressedError()
        }
   
}
}


extension MainViewController {
    
    func showNextScreen() {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: Bundle.main)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
            return
        }
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
   
    
    func text() -> String {
    let text = textFildOutlet.text ?? ""
    return text
    }
}
