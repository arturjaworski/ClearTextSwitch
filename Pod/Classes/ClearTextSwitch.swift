//
//  ClearTextSwitch.swift
//  Pods
//
//  Created by Artur Jaworski on 08.12.2015.
//
//

import PureLayout

public class ClearTextSwitch: UIControl {
    public var delegate: ClearTextSwitchDelegate?
    public var titleAttributes: [String: AnyObject]? {
        didSet {
            self.didChangeLayoutAttributes()
        }
    }
    public var title: String = "Label" {
        didSet {
            self.didChangeLayoutAttributes()
        }
    }
    public override var selected: Bool {
        set {
            self.setSelected(newValue, animated: false)
        }
        get {
            return self._selected
        }
    }
    public var normalBackgroundColor: UIColor? {
        didSet {
            self.didChangeLayoutAttributes()
        }
    }
    public var selectedBackgroundColor: UIColor? {
        didSet {
            self.didChangeLayoutAttributes()
        }
    }
    
    private let label: UILabel = UILabel.init(forAutoLayout: ())
    private var labelLeftMarginConstraint: NSLayoutConstraint!
    private var labelRightMarginConstraint: NSLayoutConstraint!
    private var _selected: Bool = false {
        didSet {
            if oldValue != _selected {
                self.delegate?.clearTextSwitchDidChange(self)
            }
        }
    }
    private let margin: CGFloat = 10.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.onInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.onInit()
    }
    
    private func onInit() {
        self.addSubview(self.label)
        
        self.configureLabel()
        self.normalBackgroundColor = self.backgroundColor
        self.selected = self._selected
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        super.endTrackingWithTouch(touch, withEvent: event)
        
        self.setSelected(!self.selected, animated: true)
    }
    
    public func setSelected(selected: Bool, animated: Bool) {
        self._selected = selected
        self.changeSelectionAttributes(animated: animated)
    }
    
    private func changeSelectionAttributes(animated animated: Bool = true) {
        if self.selected {
            self.labelLeftMarginConstraint.autoRemove()
            self.labelRightMarginConstraint.autoInstall()
        }
        else {
            self.labelLeftMarginConstraint.autoInstall()
            self.labelRightMarginConstraint.autoRemove()
        }
        
        func performChanges() {
            self.layoutIfNeeded()
            if self.selected {
                self.backgroundColor = self.selectedBackgroundColor
            }
            else {
                self.backgroundColor = self.normalBackgroundColor
            }
        }
        
        if animated {
            UIView.animateWithDuration(0.2) {
                performChanges()
            }
        }
        else {
            performChanges()
        }
    }
    
    private func didChangeLayoutAttributes() {
        self.label.attributedText = NSAttributedString(string: self.title, attributes: self.titleAttributes)
        changeSelectionAttributes(animated: false)
    }
    
    private func configureLabel() {
        self.label.autoConstrainAttribute(.Top, toAttribute: .Top, ofView: self)
        self.label.autoConstrainAttribute(.Bottom, toAttribute: .Bottom, ofView: self)
        self.label.autoConstrainAttribute(.Left, toAttribute: .Left, ofView: self, withOffset: self.margin, relation: .GreaterThanOrEqual)
        self.label.autoConstrainAttribute(.Right, toAttribute: .Right, ofView: self, withOffset: -self.margin, relation: .LessThanOrEqual)
        
        self.labelLeftMarginConstraint = self.label.autoConstrainAttribute(.Left, toAttribute: .Left, ofView: self, withOffset: self.margin, relation: .Equal)
        self.labelLeftMarginConstraint.priority = UILayoutPriorityDefaultLow
        
        self.labelRightMarginConstraint = self.label.autoConstrainAttribute(.Right, toAttribute: .Right, ofView: self, withOffset: self.margin, relation: .Equal)
        self.labelRightMarginConstraint.priority = UILayoutPriorityDefaultLow
        self.labelRightMarginConstraint.autoRemove()
    }
}