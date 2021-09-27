//
//  SecondViewController.swift
//  TableView+MVC+DZ
//
//  Created Cергей Иванович on 23.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import Foundation
import UIKit

// MARK: View -
protocol SecondViewProtocol: AnyObject {
    
    func massImageCount() -> Int
    
    func addLable()
    
    func hideLable()
    
    func addTableView()
    
    func addImageInTableView(image: UIImage)
    
    func elementInMassivImage (for indexPah: IndexPath) -> UIImage
    
    func removeImage (for indexPah: IndexPath)
}


class SecondViewController: UIViewController, SecondViewProtocol {
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var lableOutlet: UILabel!
    
    var massImage:[UIImage] = []
    
    var presenter: SecondPresenterProtocol = SecondPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.viewDidLoad()
        presenter.firstDisplay()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.register(UINib(nibName: "MainTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MainTableViewCell")
    }
    
    
    @IBAction func addImageAction(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
}

extension SecondViewController {
    
    func massImageCount() -> Int {     //количество элементов в массиве
        let count = massImage.count
        return count
    }
    
    func addLable() {              //создали лэйбл
        tableViewOutlet.isHidden = true
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: Int(view.frame.width) - 40, height: Int(view.frame.width)/6))
        label.center = view.center
        label.textAlignment = NSTextAlignment.center
        label.text = "Нет фотографий"
        label.font = UIFont.systemFont(ofSize: 30.0)
        view.addSubview(label)
        self.lableOutlet = label
    }
    
    func hideLable() {                     //скрыли лэйбл
        lableOutlet.isHidden = true
        
    }
    
    func addTableView() {                 //показали таблицу
        tableViewOutlet.isHidden = false
    }
    
    func addImageInTableView(image: UIImage) {                //добавили картинку в ячейку
        massImage.append(image)
        tableViewOutlet.insertRows(at: [IndexPath(row: massImageCount() - 1, section: 0)], with: .automatic)
        
    }
    
    func elementInMassivImage(for indexPah: IndexPath) -> UIImage {  //возвращает элемент из массива
        return massImage[indexPah.row]
    }
    
    func removeImage(for indexPah: IndexPath) {                   //удалили картинку delete
        massImage.remove(at: indexPah.row)
        tableViewOutlet.deleteRows(at: [indexPah], with: .automatic)
    }
    
    
}


extension SecondViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        
        addImageInTableView(image: image)
        
        presenter.firstDisplay()          //убрали лэйбл и добавили таблицу
        
    }
}



extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(
            actions: [
                UIContextualAction(
                    style: .destructive,
                    title: "Delete",
                    handler: { _, _, _ in
                        self.removeImage(for: indexPath)
                    }
                )
            ]
        )
        return configuration
    }
}



extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  presenter.numberOfElementsInTMassiv()   //количество рядов равно количеству элементов массива
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.update(with: elementInMassivImage(for: indexPath))
        return cell
    }
}













