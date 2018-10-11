//
//  NFXImageBodyDetailsController.swift
//  netfox
//
//  Copyright © 2016 netfox. All rights reserved.
//

#if os(iOS)
    
import Foundation
import UIKit

class NFXImageBodyDetailsController: NFXGenericBodyDetailsController
{
    var imageView: UIImageView = UIImageView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "Image preview"

        let width: CGFloat = self.view.frame.width - 2*10
        let height: CGFloat = self.view.frame.height - 2*10
        self.imageView.frame = CGRect(x: 10, y: 10, width: width, height: height)
        self.imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.imageView.contentMode = .scaleAspectFit
        let data = Data.init(base64Encoded: self.selectedModel.getResponseBody() as String, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)

        self.imageView.image = UIImage(data: data!)

        self.view.addSubview(self.imageView)
        
    }
}

#endif
