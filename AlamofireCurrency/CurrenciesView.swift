//
//  CurrenciesView.swift
//  AlamofireCurrency
//
//  Created by Admin on 27.08.2022.
//

import Foundation
import UIKit

class CurrencieView: UIView {
    static func create(text: String)-> CurrencieView {
        let view = CurrencieView()
        view.label.text = text
        return view
    }
    
    var label = UILabel()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
   private func setup() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
        label.topAnchor.constraint(equalTo: topAnchor),
        label.bottomAnchor.constraint(equalTo: bottomAnchor),
        label.rightAnchor.constraint(equalTo: rightAnchor),
        label.leftAnchor.constraint(equalTo: leftAnchor)
       ])
       
       label.textColor = .black
       label.textAlignment = .center
    }
}
