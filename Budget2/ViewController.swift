//
//  ViewController.swift
//  Budget2
//
//  Created by Suneru on 16.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newOppSumInput: UITextField!
    @IBAction func newOppRashodButton(_ sender: UIButton) {
        guard newOppSumInput.text?.isEmpty == false else { return }
        if let summ = Double(newOppSumInput.text ?? "0.00") {
            potrZaPeriod += summ
            getDataFromModelAndShowOnView()
        }
    }
    @IBAction func newOppPrihodButton(_ sender: UIButton) {
        guard newOppSumInput.text?.isEmpty == false else { return }
        if let summ = Double(newOppSumInput.text ?? "0.00") {
            potrZaPeriod -= summ
            getDataFromModelAndShowOnView()
        }
    }
    @IBOutlet weak var potrachZaPeriodLabel: UILabel!
    @IBOutlet weak var ostatokLabel: UILabel!
    @IBOutlet weak var vKopilkuLabel: UILabel!
    @IBAction func newPeriodButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Новый период", message: "Вы действительно хотите начать новый период?\nДанные текушего периода будут удалены!", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Хочу!", style: .destructive) { (action) in
            potrZaPeriod = 0.00
            self.getDataFromModelAndShowOnView()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var ostatokNaPeriodInput: UITextField!
    @IBAction func refreshButton(_ sender: UIButton) {
        guard ostatokNaPeriodInput.text?.isEmpty == false else { return }
        if let newOst = Double(ostatokNaPeriodInput.text ?? "7000.00") {
            ostatokNaPeriod = newOst
            potrZaPeriod += 0
        }
        getDataFromModelAndShowOnView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newOppSumInput.keyboardType = .numberPad
        ostatokNaPeriodInput.keyboardType = .numberPad
        self.hideKeyboardWhenTappedAround()
        getDataFromModelAndShowOnView()
    }
    
    func getDataFromModelAndShowOnView() {
        newOppSumInput.text = ""
        potrachZaPeriodLabel.text = "Потрачено за период: \(potrZaPeriod) руб."
        ostatokLabel.text = "Остаток: \(ostatok) руб."
        vKopilkuLabel.text = "В копилку: \(vKopilku) руб."
        ostatokNaPeriodInput.text = "\(ostatokNaPeriod)"
        saveData()
    }


}

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
