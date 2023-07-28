//
//  LocalFileManager.swift
//  FastPizza
//
//  Created by Alex Karamanets on 09/06/2023.
//

import Foundation
import SwiftUI

final class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private let folder = "Images"
    
    private init() {}
    
    func saveImage(image: UIImage, imageName: String) {
        
        /// create folder if this folder doesn't exist
        createFolderIfNeed()
        
        /// Get path for image
        guard let data = image.pngData(),
              let url = getUrlForImage(imageName: imageName) else {
            return
        }
        /// Save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("[🔥] Error saving image: \(imageName) - \(error.localizedDescription)")
        }
    }
    
    func getImage(imageName: String) -> UIImage? {
        
        guard
            /// Get image path
            let url = getUrlForImage(imageName: imageName),
            /// Check if image exist
            FileManager.default.fileExists(atPath: url.path()) else {
            return nil
        }
        /// If image image exist -> return image
        return UIImage(contentsOfFile: url.path())
    }
    
    private func createFolderIfNeed() {
        
        guard let url = getUrlForFolder() else { return }
        
        /// If directory doesn't exist -> create
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("[🔥] Error creating directory: \(error.localizedDescription)")
            }
        }
    }
    
    private func getUrlForFolder() -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        
        return url.appendingPathComponent(folder, conformingTo: .folder)
    }
    
    private func getUrlForImage(imageName: String) -> URL? {
        
        guard let folder = getUrlForFolder() else { return nil }
        
        return folder.appendingPathComponent(imageName, conformingTo: .png)
    }
}
