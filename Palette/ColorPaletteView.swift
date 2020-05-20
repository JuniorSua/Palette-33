//
//  ColorPaletteView.swift
//  Palette33
//
//  Created by Junior Suarez-Leyva on 5/19/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class ColorPaletteView: UIView {

    var colors: [UIColor] {
        didSet {
            buildColorBricks()
        }
    }
    
    init(colors: [UIColor] = [], frame: CGRect = .zero) {
        self.colors = colors
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpViews()
    }
    
    func setUpViews() {
        self.addSubview(colorStackView)
        colorStackView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0)
        self.layer.cornerRadius = (self.frame.height / 2)
        self.layer.masksToBounds = true
    }
    
    func buildColorBricks() {
        resetColorBricks()
        for color in colors {
            let colorBrick = generateColorBricks(for: color)
            self.addSubview(colorBrick)
            self.colorStackView.addArrangedSubview(colorBrick)
            
        }
        self.layoutIfNeeded()
    }
    
    func generateColorBricks(for color: UIColor) -> UIView {
        let colorBrick = UIView()
        colorBrick.backgroundColor = color
        return colorBrick
    }
    
    func resetColorBricks() {
        for subview in colorStackView.arrangedSubviews {
            self.colorStackView.removeArrangedSubview(subview)
        }
    }
    
    //MARK: - Views
    let colorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
}
