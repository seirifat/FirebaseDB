//
//  UIViewExtension.swift
//
//
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import UIKit

extension UIView {
    
    static func loadNib() -> UINib {
        return UINib(nibName: self.className(), bundle: nil)
    }

    static func className() -> String {
        return String(describing: self)
    }
    
    func createTag(with color: UIColor) {
        let shape = CAShapeLayer()
        self.layer.addSublayer(shape)
        shape.opacity = 1.0
        shape.lineWidth = 0
        shape.lineJoin = CAShapeLayerLineJoin.miter
        shape.strokeColor = nil
        shape.fillColor = color.cgColor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width - 15, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        path.close()
        shape.path = path.cgPath
    }
    
    func cardify(withCornerRadius radius:CGFloat = 3) {
        layer.masksToBounds = false
        clipsToBounds = false
        
        layer.cornerRadius = radius
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 2.5
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
    
//    func circlify(masked: Bool = false) {
//        let roundValue = frame.width / 2
//        layer.cornerRadius = roundValue
//        layer.shadowColor = UIColor.black.cgColor
//        var shadowOpacity: Float = 1.0
//        if masked {
//            shadowOpacity = 0.0
//        }
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowOffset = CGSize(width: 0, height: 3)
//        layer.shadowRadius = 5
//
//        layer.masksToBounds = masked
//        clipsToBounds = masked
//    }
    
    func circlify(masked: Bool = false, opacity:Float = 0.25, radius: Float = 2.5, heightOffset: Int = 0) {
        layer.masksToBounds = masked
        clipsToBounds = masked
        
        let roundValue = frame.width / 2
        layer.cornerRadius = roundValue
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: 0, height: heightOffset)
        layer.shadowRadius = CGFloat(radius)
    }
    
    func normalize() {
        layer.masksToBounds = false
        clipsToBounds = false
        
        layer.cornerRadius = 0
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOpacity = 0
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 0
    }
    
    func loadingIndicatorInView(_ show: Bool) {
        let tag = 808404
        if show {
            self.alpha = 0.5
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tag = tag
            indicator.style = .white
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.alpha = 1.0
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        // sample use
        // view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        // view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            //view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: viewsDictionary))
    }
    
    func addConstraintCenterX(view: UIView) {
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func addConstraintCenterY(view: UIView) {
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    // IBInspectable
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
