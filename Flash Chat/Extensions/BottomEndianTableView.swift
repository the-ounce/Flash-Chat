//
//  BottomEndianTableView.swift
//  Flash Chat
//
//  Created by Mykyta Havrylenko on 15.07.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

// tableView messages alignment (bottom)
class BottomEndianTableView: UITableView {

    private var observer: Any?

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        observer = observe(\.contentSize) { _, _ in
            DispatchQueue.main.async { [weak self] in
                self?.scrollToEnd(animated: false)
            }
        }
    }

    func scrollToEnd(animated: Bool) {
        let scrollDistance = contentSize.height - frame.height
        setContentOffset(CGPoint(x: 0, y: scrollDistance), animated: animated)
    }

}
