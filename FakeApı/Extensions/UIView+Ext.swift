//
//  UIView+Ext.swift
//  FakeApı
//
//  Created by Ali Görkem Aksöz on 5.01.2023.
//

import UIKit

extension UIView {
    func pinToEdgesOf(view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
