//
//  ImageCacher.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 13/08/26.
//

import Foundation
import UIKit
import SwiftUI

class ImageCacher {
    static var imageCache = [String: UIImage]()

    static func fetchImage(from urlString: String) async throws -> UIImage {
        if let cachedImage = imageCache[urlString] {
            return cachedImage
        }
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        guard let image = UIImage(data: data) else {
            throw URLError(.cannotDecodeContentData)
        }

        imageCache[urlString] = image
        return image
    }
}
