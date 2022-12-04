//
//  Gradient.swift
//  Rezerva
//
//  Created by Mohamed Nawar on 5/4/19.
//

import Foundation
import UIKit

class ThreeColorsGradientView: UIButton {
    var firstColor: UIColor = UIColor(named: "MainColor") ?? .blue
    var secondColor: UIColor = UIColor(named: "GradienColor2") ?? .blue
    var thirdColor: UIColor = UIColor(named: "GradienColor3") ?? .blue
    
    @IBInspectable var vertical: Bool = false {
        didSet {
            updateGradientDirection()
        }
    }
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor]
        layer.startPoint = CGPoint.zero
        layer.cornerRadius = 20
        return layer
    }()
    
    //MARK: -
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        applyGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        applyGradient()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applyGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
    }
    
    //MARK: -
    
    func applyGradient() {
        updateGradientDirection()
        layer.sublayers = [gradientLayer]
    }
    
    func updateGradientFrame() {
        gradientLayer.frame = bounds
    }
    
    func updateGradientDirection() {
        gradientLayer.cornerRadius = 20
        layer.cornerRadius = 20
        gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
    }
}

import Foundation
import UIKit

class ThreeColors2GradientView: UIButton {
    var firstColor: UIColor = UIColor(named: "MainColor") ?? .blue
    var secondColor: UIColor = UIColor(named: "GradienColor2") ?? .blue
    var thirdColor: UIColor = UIColor(named: "GradienColor3") ?? .blue
    
    @IBInspectable var vertical: Bool = false {
        didSet {
            updateGradientDirection()
        }
    }
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor]
        layer.startPoint = CGPoint.zero
        layer.cornerRadius = 20
        return layer
    }()
    
    //MARK: -
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        applyGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        applyGradient()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applyGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
    }
    
    //MARK: -
    
    func applyGradient() {
        updateGradientDirection()
        layer.sublayers = [gradientLayer]
    }
    
    func updateGradientFrame() {
        gradientLayer.frame = bounds
    }
    
    func updateGradientDirection() {
        gradientLayer.cornerRadius = 10
        layer.cornerRadius = 10
        gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
    }
}



class ColorGradientView: UIView {
    var firstColor: UIColor = UIColor(named: "MainColor") ?? .blue
    var secondColor: UIColor = UIColor(named: "GradienColor2") ?? .blue
    var thirdColor: UIColor = UIColor(named: "GradienColor3") ?? .blue
    
    @IBInspectable var vertical: Bool = false {
        didSet {
            updateGradientDirection()
        }
    }
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor]
        layer.startPoint = CGPoint.zero
        layer.cornerRadius = 20
        return layer
    }()
    
    //MARK: -
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        applyGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        applyGradient()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applyGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
    }
    
    //MARK: -
    
    func applyGradient() {
        updateGradientDirection()
        layer.sublayers = [gradientLayer]
    }
    
    func updateGradientFrame() {
        gradientLayer.frame = bounds
    }
    
    func updateGradientDirection() {
        gradientLayer.cornerRadius = 10
        layer.cornerRadius = 10
        gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
    }
}

class GradientView: UIView {
    
    @IBInspectable var startColor:   UIColor =  UIColor(named: "MainColor") ?? .blue { didSet { updateColors() }}
    @IBInspectable var secondColor:   UIColor = UIColor(named: "GradienColor2") ?? .blue{ didSet { updateColors() }}
    
    @IBInspectable var endColor:     UIColor =  UIColor(named: "GradienColor3") ?? .blue { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.20 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var verticalMode:  Bool =  false { didSet { updatePoints() }}

    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
         
        } else if verticalMode {
            gradientLayer.startPoint = CGPoint.zero
            gradientLayer.endPoint   = verticalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, secondColor.cgColor , endColor.cgColor]
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}

extension UIViewController{
    func createAlert(title: String?, message: String){
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: NSLocalizedString("Ok", comment: "حسنا"), style: .default, handler: { (action) -> Void in
            dialogMessage.dismiss(animated: true, completion: {
            })
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
