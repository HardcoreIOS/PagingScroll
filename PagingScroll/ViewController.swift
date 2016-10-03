//
//  ViewController.swift
//  PagingScroll
//
//  Created by Abdurrahman on 9/29/16.
//  Copyright © 2016 AR Ehsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	
	var images = [UIImageView]()

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		var contentWidth: CGFloat = 0.0
		
		let scrollViewWidth = scrollView.frame.size.width
		
		for x in 0...2 {
			let image = UIImage(named: "slope \(x).png")
			let imageView = UIImageView(image: image)
			images.append(imageView)
			
			var newX: CGFloat = 0.0
			
			newX = scrollViewWidth / 2 + scrollViewWidth * CGFloat(x)
			
			//contentWidth += newX --#-- Adds extra space at end
			
			scrollView.addSubview(imageView)
			
			imageView.frame = CGRect(x: newX - 150, y: (scrollView.frame.size.height / 2) - 150, width: 300, height: 300)
		}
		
		// fixes extra space at end
		contentWidth = scrollViewWidth * CGFloat(images.count)
		
		scrollView.clipsToBounds = false
		scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

}

