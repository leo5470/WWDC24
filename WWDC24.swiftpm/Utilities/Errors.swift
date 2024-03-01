//
//  Errors.swift
//
//
//  Created by Leo Cheng on 2024/2/19.
//

import Foundation

enum Errors: Error {
    case ImageConvertError
    case GeneralNilError
    case CannotIdentifyError
    case PredictorRequestFailedError
    
    var errorDescription: String? {
        switch self {
        case .ImageConvertError:
            return "Cannot convert image"
        case .GeneralNilError:
            return "Unexpected Nil occurred"
        case .CannotIdentifyError:
            return "YOLO cannot seem to identify the object"
        case .PredictorRequestFailedError:
            return "Cannot get YOLO response"
        }
    }
}
