//
//  ImageUtil.swift
//  WWDC24
//
//  Created by Leo Cheng on 2024/2/18.
//

import Foundation
import UIKit
import SwiftUI
import CoreML

func CGImageToCIImage(_ cgImage: CGImage) -> CIImage {
    return CIImage.init(cgImage: cgImage)
}

func CIImageToCGImage(_ ciImage: CIImage) throws -> CGImage {
    let ciContext = CIContext.init()
    guard let res = ciContext.createCGImage(ciImage, from: ciImage.extent) else {
        throw Errors.ImageConvertError
    }
    
    return res
}

func UIImageToCIIMage(_ uiImage: UIImage) throws -> CIImage {
    var ciImage = uiImage.ciImage
    if ciImage == nil {
        guard let cgImage = uiImage.cgImage else {
            throw Errors.ImageConvertError
        }
        ciImage = CGImageToCIImage(cgImage)
    }
    
    return ciImage!
}

func UIImageToCGImage(_ uiImage: UIImage) throws -> CGImage {
    var cgImage = uiImage.cgImage
    
    if cgImage == nil {
        guard let ciImage = uiImage.ciImage else {
            throw Errors.ImageConvertError
        }
        do {
            cgImage = try CIImageToCGImage(ciImage)
        } catch {
            throw Errors.ImageConvertError
        }
    }
    
    return cgImage!
}
