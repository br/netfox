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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Image preview"
        addImageView()
    }

    private func addImageView() {
        let width: CGFloat = view.frame.width - 2*10
        let height: CGFloat = view.frame.height - 2*10
        imageView.frame = CGRect(x: 10, y: 10, width: width, height: height)
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.contentMode = .scaleAspectFit
        let base64String: String = selectedModel.getResponseBody() as String
        let data = Data.init(base64Encoded: base64String, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        if let data = data {
            imageView.image = UIImage(data: data)
        }
        view.addSubview(imageView)
    }
}

#endif
