//
// Copyright (C) 2015 GraphKit, Inc. <http://graphkit.io> and other GraphKit contributors.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program located at the root of the software package
// in a file called LICENSE.  If not, see <http://www.gnu.org/licenses/>.
//

import UIKit

public class CardView : MaterialPulseView {
	//
	//	:name:	dividerLayer
	//
	internal var dividerLayer: CAShapeLayer?
	
	//
	//	:name:	dividerColor
	//
	public var dividerColor: UIColor? {
		didSet {
			dividerLayer?.backgroundColor = dividerColor?.CGColor
		}
	}
	
	/**
		:name:	divider
	*/
	public var divider: Bool = MaterialTheme.cardView.divider {
		didSet {
			reloadView()
		}
	}
	
	/**
		:name:	dividerInsets
	*/
	public var dividerInsets: MaterialInsets? {
		didSet {
			dividerInsetsRef = nil == dividerInsets ? nil : MaterialInsetsToValue(dividerInsets!)
		}
	}
	
	/**
		:name:	dividerInsetsRef
	*/
	public var dividerInsetsRef: MaterialInsetsType! {
		didSet {
			dividerInsetsRef = nil == dividerInsetsRef ? MaterialInsetsToValue(.None) : dividerInsetsRef!
			reloadView()
		}
	}
	
	/**
		:name:	imageLayer
	*/
	public private(set) lazy var imageLayer: CAShapeLayer = CAShapeLayer()
	
	/**
		:name:	image
	*/
	public override var image: UIImage? {
		get {
			return nil == imageLayer.contents ? nil : UIImage(CGImage: imageLayer.contents as! CGImage)
		}
		set(value) {
			if let v = value {
				imageLayer.contents = v.CGImage
				if 0 == maxImageSize {
					if 0 == imageLayer.frame.size.height {
						imageLayer.frame.size.height = v.size.height
					}
				} else {
					imageLayer.frame.size.height = maxImageSize
				}
				imageLayer.hidden = false
			}
			else {
				imageLayer.contents = nil
				imageLayer.frame = CGRectZero
				imageLayer.hidden = true
			}
			reloadView()
		}
	}
	
	/**
		:name:	maxImageSize
	*/
	public var maxImageSize: CGFloat = 0 {
		didSet {
			if 0 < maxImageSize {
				imageLayer.frame.size.height = maxImageSize
//				imageLayer.contentsGravity = MaterialGravityToString(contentsGravity)
			}
			reloadView()
		}
	}
	
	/**
		:name:	contentsRect
	*/
	public override var contentsRect: CGRect {
		didSet {
			imageLayer.contentsRect = contentsRect
		}
	}
	
	/**
		:name:	contentsCenter
	*/
	public override var contentsCenter: CGRect {
		didSet {
			imageLayer.contentsCenter = contentsCenter
		}
	}
	
	/**
		:name:	contentsScale
	*/
	public override var contentsScale: CGFloat {
		didSet {
			imageLayer.contentsScale = contentsScale
		}
	}
	
	/**
		:name:	contentsGravity
	*/
	public override var contentsGravity: MaterialGravity {
		didSet {
			imageLayer.contentsGravity = MaterialGravityToString(contentsGravity)
		}
	}
	
	/**
		:name:	contentInsets
	*/
	public var contentInsets: MaterialInsets? {
		didSet {
			contentInsetsRef = nil == contentInsets ? nil : MaterialInsetsToValue(contentInsets!)
		}
	}
	
	/**
		:name:	contentInsetsRef
	*/
	public var contentInsetsRef: MaterialInsetsType! {
		didSet {
			contentInsetsRef = nil == contentInsetsRef ? MaterialInsetsToValue(.None) : contentInsetsRef!
			reloadView()
		}
	}
	
	/**
		:name:	titleLabelInsets
	*/
	public var titleLabelInsets: MaterialInsets? {
		didSet {
			titleLabelInsetsRef = nil == titleLabelInsets ? nil : MaterialInsetsToValue(titleLabelInsets!)
		}
	}
	
	/**
		:name:	titleLabelInsetsRef
	*/
	public var titleLabelInsetsRef: MaterialInsetsType! {
		didSet {
			titleLabelInsetsRef = nil == titleLabelInsetsRef ? MaterialInsetsToValue(.None) : titleLabelInsetsRef!
			reloadView()
		}
	}
	
	/**
		:name:	titleLabel
	*/
	public var titleLabel: UILabel? {
		didSet {
			titleLabel?.translatesAutoresizingMaskIntoConstraints = false
			reloadView()
		}
	}
	
	/**
		:name:	detailLabelInsets
	*/
	public var detailLabelInsets: MaterialInsets? {
		didSet {
			detailLabelInsetsRef = nil == detailLabelInsets ? nil : MaterialInsetsToValue(detailLabelInsets!)
		}
	}
	
	/**
		:name:	detailLabelInsetsRef
	*/
	public var detailLabelInsetsRef: MaterialInsetsType! {
		didSet {
			detailLabelInsetsRef = nil == detailLabelInsetsRef ? MaterialInsetsToValue(.None) : detailLabelInsetsRef!
			reloadView()
		}
	}
	
	/**
		:name:	detailLabel
	*/
	public var detailLabel: UILabel? {
		didSet {
			detailLabel?.translatesAutoresizingMaskIntoConstraints = false
			reloadView()
		}
	}
	
	/**
		:name:	leftButtonsInsets
	*/
	public var leftButtonsInsets: MaterialInsets? {
		didSet {
			leftButtonsInsetsRef = nil == leftButtonsInsets ? nil : MaterialInsetsToValue(leftButtonsInsets!)
		}
	}
	
	/**
		:name:	leftButtonsInsetsRef
	*/
	public var leftButtonsInsetsRef: MaterialInsetsType! {
		didSet {
			leftButtonsInsetsRef = nil == leftButtonsInsetsRef ? MaterialInsetsToValue(.None) : leftButtonsInsetsRef!
			reloadView()
		}
	}
	
	/**
		:name:	leftButtons
	*/
	public var leftButtons: Array<UIButton>? {
		didSet {
			if let v = leftButtons {
				for b in v {
					b.translatesAutoresizingMaskIntoConstraints = false
				}
			}
			reloadView()
		}
	}
	
	/**
		:name:	rightButtonsInsets
	*/
	public var rightButtonsInsets: MaterialInsets? {
		didSet {
			rightButtonsInsetsRef = nil == rightButtonsInsets ? nil : MaterialInsetsToValue(rightButtonsInsets!)
		}
	}
	
	/**
		:name:	rightButtonsInsetsRef
	*/
	public var rightButtonsInsetsRef: MaterialInsetsType! {
		didSet {
			rightButtonsInsetsRef = nil == rightButtonsInsetsRef ? MaterialInsetsToValue(.None) : rightButtonsInsetsRef!
			reloadView()
		}
	}
	
	/**
		:name:	rightButtons
	*/
	public var rightButtons: Array<UIButton>? {
		didSet {
			if let v = rightButtons {
				for b in v {
					b.translatesAutoresizingMaskIntoConstraints = false
				}
			}
			reloadView()
		}
	}
	
	/**
		:name:	init
	*/
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		prepareImageLayer()
	}
	
	/**
		:name:	init
	*/
	public override init(frame: CGRect) {
		super.init(frame: frame)
		prepareImageLayer()
	}
	
	/**
		:name:	init
	*/
	public convenience init() {
		self.init(frame: CGRectNull)
	}
	
	/**
		:name:	init
	*/
	public convenience init?(image: UIImage? = nil, titleLabel: UILabel? = nil, detailLabel: UILabel? = nil, leftButtons: Array<UIButton>? = nil, rightButtons: Array<UIButton>? = nil) {
		self.init(frame: CGRectNull)
		prepareProperties(image, titleLabel: titleLabel, detailLabel: detailLabel, leftButtons: leftButtons, rightButtons: rightButtons)
	}
	
	/**
		:name:	layoutSubviews
	*/
	public override func layoutSubviews() {
		super.layoutSubviews()
		// image
		imageLayer.frame.size.width = bounds.size.width
		
		// divider
		if divider {
			var y: CGFloat = contentInsetsRef!.bottom + dividerInsetsRef!.bottom
			if 0 < leftButtons?.count {
				y += leftButtonsInsetsRef!.top + leftButtonsInsetsRef!.bottom + leftButtons![0].frame.size.height
			} else if 0 < rightButtons?.count {
				y += rightButtonsInsetsRef!.top + rightButtonsInsetsRef!.bottom + rightButtons![0].frame.size.height
			}
			if 0 < y {
				prepareDivider(bounds.size.height - y - 0.5, width: bounds.size.width)
			}
		} else {
			dividerLayer?.removeFromSuperlayer()
			dividerLayer = nil
		}
	}
	
	/**
		:name:	prepareView
	*/
	public override func prepareView() {
		super.prepareView()
		userInteractionEnabled = MaterialTheme.cardView.userInteractionEnabled
		backgroundColor = MaterialTheme.cardView.backgroundColor
		pulseColor = MaterialTheme.cardView.pulseColor
		
		contentInsetsRef = MaterialTheme.cardView.contentInsetsRef
		titleLabelInsetsRef = MaterialTheme.cardView.titleLabelInsetsRef
		detailLabelInsetsRef = MaterialTheme.cardView.detailLabelInsetsRef
		leftButtonsInsetsRef = MaterialTheme.cardView.leftButtonsInsetsRef
		rightButtonsInsetsRef = MaterialTheme.cardView.rightButtonsInsetsRef
		dividerInsetsRef = MaterialTheme.cardView.dividerInsetsRef
		
		contentsRect = MaterialTheme.cardView.contentsRect
		contentsCenter = MaterialTheme.cardView.contentsCenter
		contentsScale = MaterialTheme.cardView.contentsScale
		contentsGravity = MaterialTheme.cardView.contentsGravity
		shadowDepth = MaterialTheme.cardView.shadowDepth
		shadowColor = MaterialTheme.cardView.shadowColor
		zPosition = MaterialTheme.cardView.zPosition
		borderWidth = MaterialTheme.cardView.borderWidth
		borderColor = MaterialTheme.cardView.bordercolor
		dividerColor = MaterialTheme.cardView.dividerColor
	}
	
	/**
		:name:	reloadView
	*/
	public func reloadView() {
		// clear constraints so new ones do not conflict
		removeConstraints(constraints)
		for v in subviews {
			v.removeFromSuperview()
		}
		
		var verticalFormat: String = "V:|"
		var views: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
		var metrics: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
		
		if nil != imageLayer.contents {
			verticalFormat += "-(insetTop)"
			metrics["insetTop"] = imageLayer.frame.size.height
		} else if nil != titleLabel {
			verticalFormat += "-(insetTop)"
			metrics["insetTop"] = contentInsetsRef!.top + titleLabelInsetsRef!.top
		} else if nil != detailLabel {
			verticalFormat += "-(insetTop)"
			metrics["insetTop"] = contentInsetsRef!.top + detailLabelInsetsRef!.top
		}
		
		// title
		if let v = titleLabel {
			addSubview(v)
			
			if nil == imageLayer.contents {
				verticalFormat += "-[titleLabel]"
				views["titleLabel"] = v
			} else {
				MaterialLayout.alignFromTop(self, child: v, top: contentInsetsRef!.top + titleLabelInsetsRef!.top)
			}
			MaterialLayout.alignToParentHorizontallyWithInsets(self, child: v, left: contentInsetsRef!.left + titleLabelInsetsRef!.left, right: contentInsetsRef!.right + titleLabelInsetsRef!.right)
		}
		
		// detail
		if let v = detailLabel {
			addSubview(v)
			
			if nil == imageLayer.contents && nil != titleLabel {
				verticalFormat += "-(insetB)"
				metrics["insetB"] = titleLabelInsetsRef!.bottom + detailLabelInsetsRef!.top
			} else {
				metrics["insetTop"] = (metrics["insetTop"] as! CGFloat) + detailLabelInsetsRef!.top
			}
			
			verticalFormat += "-[detailLabel]"
			views["detailLabel"] = v
			
			MaterialLayout.alignToParentHorizontallyWithInsets(self, child: v, left: contentInsetsRef!.left + detailLabelInsetsRef!.left, right: contentInsetsRef!.right + detailLabelInsetsRef!.right)
		}
		
		// leftButtons
		if let v = leftButtons {
			if 0 < v.count {
				var h: String = "H:|"
				var d: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
				var i: Int = 0
				for b in v {
					let k: String = "b\(i)"
					
					d[k] = b
					
					if 0 == i++ {
						h += "-(left)-"
					} else {
						h += "-(left_right)-"
					}
					
					h += "[\(k)]"
					
					addSubview(b)
					MaterialLayout.alignFromBottom(self, child: b, bottom: contentInsetsRef!.bottom + leftButtonsInsetsRef!.bottom)
				}
				
				addConstraints(MaterialLayout.constraint(h, options: [], metrics: ["left" : contentInsetsRef!.left + leftButtonsInsetsRef!.left, "left_right" : leftButtonsInsetsRef!.left + leftButtonsInsetsRef!.right], views: d))
			}
		}
		
		// rightButtons
		if let v = rightButtons {
			if 0 < v.count {
				var h: String = "H:"
				var d: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
				var i: Int = v.count - 1
				
				for b in v {
					let k: String = "b\(i)"
					
					d[k] = b
					
					h += "[\(k)]"
					
					if 0 == i-- {
						h += "-(right)-"
					} else {
						h += "-(right_left)-"
					}
					
					addSubview(b)
					MaterialLayout.alignFromBottom(self, child: b, bottom: contentInsetsRef!.bottom + rightButtonsInsetsRef!.bottom)
				}
				
				addConstraints(MaterialLayout.constraint(h + "|", options: [], metrics: ["right" : contentInsetsRef!.right + rightButtonsInsetsRef!.right, "right_left" : rightButtonsInsetsRef!.right + rightButtonsInsetsRef!.left], views: d))
			}
		}
		
		if 0 < leftButtons?.count {
			verticalFormat += "-(insetC)-[button]"
			views["button"] = leftButtons![0]
			metrics["insetC"] = leftButtonsInsetsRef!.top
			metrics["insetBottom"] = contentInsetsRef!.bottom + leftButtonsInsetsRef!.bottom
		} else if 0 < rightButtons?.count {
			verticalFormat += "-(insetC)-[button]"
			views["button"] = rightButtons![0]
			metrics["insetC"] = rightButtonsInsetsRef!.top
			metrics["insetBottom"] = contentInsetsRef!.bottom + rightButtonsInsetsRef!.bottom
		}
		
		if nil != detailLabel {
			if nil == metrics["insetC"] {
				metrics["insetBottom"] = contentInsetsRef!.bottom + detailLabelInsetsRef!.bottom + (divider ? dividerInsetsRef!.top + dividerInsetsRef!.bottom : 0)
			} else {
				metrics["insetC"] = (metrics["insetC"] as! CGFloat) + detailLabelInsetsRef!.bottom + (divider ? dividerInsetsRef!.top + dividerInsetsRef!.bottom : 0)
			}
		} else if nil != titleLabel {
			if nil == metrics["insetC"] {
				metrics["insetBottom"] = contentInsetsRef!.bottom + titleLabelInsetsRef!.bottom + (divider ? dividerInsetsRef!.top + dividerInsetsRef!.bottom : 0)
			} else {
				metrics["insetC"] = (metrics["insetC"] as! CGFloat) + titleLabelInsetsRef!.bottom + (divider ? dividerInsetsRef!.top + dividerInsetsRef!.bottom : 0)
			}
		} else if nil != metrics["insetC"] {
			metrics["insetC"] = (metrics["insetC"] as! CGFloat) + contentInsetsRef!.top + (divider ? dividerInsetsRef!.top + dividerInsetsRef!.bottom : 0)
		}
		
		if 0 < views.count {
			verticalFormat += "-(insetBottom)-|"
			print(verticalFormat)
			addConstraints(MaterialLayout.constraint(verticalFormat, options: [], metrics: metrics, views: views))
		}
	}
	
	//
	//	:name:	prepareImageLayer
	//
	internal func prepareImageLayer() {
		imageLayer.masksToBounds = true
		imageLayer.zPosition = 0
		visualLayer.addSublayer(imageLayer)
	}
	
	//
	//	:name:	prepareDivider
	//
	internal func prepareDivider(y: CGFloat, width: CGFloat) {
		if nil == dividerLayer {
			dividerLayer = CAShapeLayer()
			dividerLayer!.zPosition = 0
			layer.addSublayer(dividerLayer!)
		}
		dividerLayer?.backgroundColor = dividerColor?.CGColor
		dividerLayer?.frame = CGRectMake(dividerInsetsRef!.left, y, width - dividerInsetsRef!.left - dividerInsetsRef!.right, 1)
	}
	
	//
	//	:name:	prepareProperties
	//
	internal func prepareProperties(image: UIImage?, titleLabel: UILabel?, detailLabel: UILabel?, leftButtons: Array<UIButton>?, rightButtons: Array<UIButton>?) {
		self.image = image
		self.titleLabel = titleLabel
		self.detailLabel = detailLabel
		self.leftButtons = leftButtons
		self.rightButtons = rightButtons
	}
}