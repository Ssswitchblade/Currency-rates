//
//  NewPairViewController.swift
//  AlamofireCurrency
//
//  Created by Admin on 22.08.2022.
//

import UIKit

class NewPairViewController: UIViewController {

    var base: String = ""
    var currency: String = ""
    let currencies: [String] = AllCurrencies.currencies
    var completion: (() -> Void)?
    var pair: PairModel?
    let model = Model()
    
    let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(btnDidTapped), for: .touchUpInside)
        btn.setTitle("OK", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Enter a currency pair"
        lbl.textAlignment = .center
        return lbl
    }()
    
    let leaveBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrow.turn.up.left"), for: .normal)
        btn.tintColor = .systemBlue
        return btn
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        picker.delegate = self
        setupUI()
    }
    
    @objc private func btnDidTapped() {
        model.httpRequest(base: base, symbols: currency, completionBlock: { [weak self] output in
            
            let vc = ViewController()
            self?.pair = output
            self?.model.saveData(base: output.base, rate: output.rates.first!.value, date: output.date, currencie: output.rates.first!.key)
            vc.getData()
            self?.dismiss(animated: true)
            self?.completion?()
            
        })
        
    }
    
    @objc private func leaveBtnTpd() {
        dismiss(animated: true)
    }
    
    private func setupUI() {
        let safeArea = self.view.safeAreaLayoutGuide
        view.addSubview(picker)
        view.addSubview(button)
        view.addSubview(label)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(leaveBtnTpd))
        
        NSLayoutConstraint.activate([
            picker.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20),
            picker.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 251),
            picker.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -375),
            picker.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 401),
            button.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 153),
            button.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -153),
            button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -330),

            label.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 223),
            label.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 80),
            label.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -80),
            label.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -445)
        ])
    }

}

extension NewPairViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let model = currencies[row]
        
        return CurrencieView.create(text: model)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        base = currencies[pickerView.selectedRow(inComponent: 1)]
        currency = currencies[pickerView.selectedRow(inComponent: 0)]
        
    }
}
