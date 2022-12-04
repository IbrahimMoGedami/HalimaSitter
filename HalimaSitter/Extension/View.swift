//
//  ViewController.swift
//  Rezerva
//
//  Created by Mohamed Nawar on 5/4/19.
//

import UIKit

final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}


@IBDesignable
extension UIView {
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 0, height: 3.0),
                   shadowOpacity: Float = 0.2,
                   shadowRadius: CGFloat = 5.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
}

@IBDesignable extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
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

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 80
        return sizeThatFits
    }
}

@IBDesignable
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[kCTForegroundColorAttributeName as NSAttributedString.Key: newValue!])
        }
    }
}
extension UIViewController{
    //Check E-mail Validation
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

}
extension UIResponder {
    /**
     * Returns the next responder in the responder chain cast to the given type, or
     * if nil, recurses the chain until the next responder is nil or castable.
     */
    func next<U: UIResponder>(of type: U.Type = U.self) -> U? {
        return self.next.flatMap({ $0 as? U ?? $0.next() })
    }
}
extension UITableViewCell {
    var tableView: UITableView? {
        return self.next(of: UITableView.self)
    }

    var indexPath: IndexPath? {
        return self.tableView?.indexPath(for: self)
    }
}
extension UICollectionViewCell {
    var collectionView: UICollectionView? {
        return self.next(of: UICollectionView.self)
    }

    var indexPath: IndexPath? {
        return self.collectionView?.indexPath(for: self)
    }
}

extension UINavigationController {
  func popViewControllers(viewsToPop: Int, animated: Bool = true) {
    if viewControllers.count > viewsToPop {
      let vc = viewControllers[viewControllers.count - viewsToPop - 1]
      popToViewController(vc, animated: animated)
    }
  }
}

extension UIView
{
    func applyGradient(colors: [CGColor],corner: CGFloat)
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.30, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = corner
        self.layer.insertSublayer(gradientLayer, at: 1)
    }
    
    func dotedBorder(){
        let yourViewBorder = CAShapeLayer()
        yourViewBorder.cornerRadius = 8
        yourViewBorder.masksToBounds = true
        yourViewBorder.strokeColor = #colorLiteral(red: 0.3921568627, green: 0.09411764706, blue: 0.9607843137, alpha: 0.4615426937)
        yourViewBorder.lineDashPattern = [5, 5]
        yourViewBorder.frame = self.bounds
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
        self.layer.addSublayer(yourViewBorder)
    }
}

import MaterialComponents.MaterialTextControls_OutlinedTextFields
extension UIViewController{
    func setupCustomTextField(textField: MDCOutlinedTextField,name: String){
        textField.label.text = name
        textField.placeholder = name
        textField.setOutlineColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1745237586), for: .normal)
        textField.setOutlineColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1745237586), for: .editing)
    }
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}


class DataPicker:  UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    static var shared = DataPicker()
    var array = [String]() {
        didSet{
            if array.count > 0 {
                isEmptyData = false
            }else{
                array =  ["No Data Found".localized]
                isEmptyData = true
            }
        }
    }
    private var txtFiled : UITextField!
    static let instance = DataPicker()
    private var selectedIndex:Int?
    private var view : UIView!
    private var isEmptyData = true
    
    private var completion: ((Int?) -> Void)?
    private var picker = UIPickerView()
    
    func initPickerView(arrayString:[String] = [],txtField : UITextField , view : UIView, complition:((Int?) -> Void)?) {
        
        self.txtFiled = txtField
        self.view = view
        self.array = arrayString
        self.delegate = self
        txtField.inputView = self
        createToolbar()

        if  arrayString.isEmpty {
            isEmptyData = true
        }else{
            isEmptyData = false
        }
       
        
        complition?(nil)
        self.completion = complition
    }
    
    func createToolbar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done".localized, style: .plain, target: self, action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        txtFiled.inputAccessoryView = toolBar
    }
    @objc func dismissKeyboard(){
        if isEmptyData {
            completion?(nil)
        }else{
            if  txtFiled.text == nil || txtFiled.text == "" {
                txtFiled.text = array.first
                completion?(0)
            }else{
                completion?(selectedIndex)
            }
        }
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard array.count > 0  else {
            view.endEditing(true)
            return nil}
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard array.count > 0 else{return}
        if !isEmptyData {
            txtFiled.text = array[row]
            completion?(row)
            selectedIndex = row
        }
    }
}
