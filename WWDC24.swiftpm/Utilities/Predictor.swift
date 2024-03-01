//
//  VisionUtil.swift
//
//
//  Created by Leo Cheng on 2024/2/18.
//

import Foundation
import Vision
import UIKit

class Predictor {
    struct result {
        let type: String
        let confidence: Float
    }
    
    static func getClassifier() -> VNCoreMLModel {
        
        guard let classifier = try? yolov8s(configuration: MLModelConfiguration()) else {
            fatalError("Failed to crease YOLOv8s instance.")
        }
        
        print("YOLOv8s instance created.")
        
        let classifierModel = classifier.model
        
        guard let classifierVNModel = try? VNCoreMLModel(for: classifierModel) else {
            fatalError("Failed to create 'VNCoreMLModel' instance.")
        }
        
        print("'VNCoreMLModel' instance created.")
        
        return classifierVNModel
    }
    
    private static let imageClassifier = getClassifier()
    
    func predict(uiImage: UIImage) throws -> result? {
        do {
            let ciImage = try UIImageToCIIMage(uiImage)
            
            let request = VNCoreMLRequest(model: Predictor.imageClassifier)
            
            request.imageCropAndScaleOption = .centerCrop
            
            let handler = VNImageRequestHandler(ciImage: ciImage)
            
            try handler.perform([request])
            
            guard let res = request.results as? [VNRecognizedObjectObservation] else {
                throw Errors.PredictorRequestFailedError
            }
            
            if(res.isEmpty) {
                throw Errors.CannotIdentifyError
            }
            
            let returnResult: result = result(type: res[0].labels[0].identifier, confidence: res[0].confidence * 100)
            
            return returnResult
            
        } catch {
            throw error
        }
    }
}
