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
    func allertError()
    
}

class MainViewController: UIViewController, MainViewProtocol {
    
    @IBOutlet weak private var textFildOutlet: UITextField!
    
    var presenter: MainPresenterProtocol = MainPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.viewDidLoad()
        textFildOutlet.placeholder = "Введите пароль"
        textFildOutlet.isSecureTextEntry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func nextViewAction(_ sender: Any) {
        
        presenter.buttonPressedNext()
        
    }
    
}

extension MainViewController {
    
    func showNextScreen() {
        
        let storyboard = UIStoryboard(name: "Second", bundle: Bundle.main)
        
        guard let secondViewController = storyboard.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
            
            return
        }
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    
    func text() -> String {
        
        let text = textFildOutlet.text ?? ""
        
        return text
    }
    
    func allertError() {
        
        let alert = UIAlertController(title: "Вы неправильно ввели пароль", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
}
