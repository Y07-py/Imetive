//
//  ImageCacheManager.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/01.
//

import Foundation
import Kingfisher

typealias ImageCacheType = ImageCacheManager.ImageCacheType

final class ImageCacheManager {
    static let shared = ImageCacheManager()
    
    enum ImageCacheType: String {
        case restaurantCache = "restaurant-top-caehe"
        case reportCache = "report-detail-cache"
        case defaultCache
        
        func getCache() -> ImageCache {
            switch self {
            case .restaurantCache:
                return ImageCacheManager.shared.restaurantCache
            case .reportCache:
                return ImageCacheManager.shared.reportCache
            case .defaultCache:
                return ImageCacheManager.shared.defaultCache
            }
        }
    }
    
    private let restaurantCache: ImageCache
    private let reportCache: ImageCache
    private let defaultCache = ImageCache.default
    
    init() {
        let megabyte: Int = 1024 * 1024
        restaurantCache = ImageCache(name: ImageCacheType.restaurantCache.rawValue)
        restaurantCache.memoryStorage.config.totalCostLimit = 100 * megabyte
        restaurantCache.memoryStorage.config.countLimit = 100
        restaurantCache.memoryStorage.config.cleanInterval = 60
        restaurantCache.memoryStorage.config.expiration = .seconds(60)
        restaurantCache.diskStorage.config.sizeLimit = UInt(300 * megabyte)
        
        reportCache = ImageCache(name: ImageCacheType.reportCache.rawValue)
        reportCache.memoryStorage.config.totalCostLimit = 100 * megabyte
        reportCache.memoryStorage.config.countLimit = 100
        reportCache.memoryStorage.config.cleanInterval = 60
        reportCache.memoryStorage.config.expiration = .seconds(60)
        reportCache.diskStorage.config.sizeLimit = UInt(300 * megabyte)
        
       
        defaultCache.memoryStorage.config.totalCostLimit = 300 * megabyte
        defaultCache.memoryStorage.config.countLimit = 100
        defaultCache.memoryStorage.config.cleanInterval = 60
        defaultCache.memoryStorage.config.expiration = .seconds(60)
        defaultCache.diskStorage.config.sizeLimit = UInt(500 * megabyte)
    }
    
    func clearCache(_ types: [ImageCacheType]) {
        for type in types {
            switch type {
            case .restaurantCache:
                restaurantCache.clearMemoryCache()
            case .reportCache:
                reportCache.clearMemoryCache()
            case .defaultCache:
                defaultCache.clearMemoryCache()
            }
        }
    }
    
    func removeExpireCache() {
        restaurantCache.memoryStorage.removeExpired()
        reportCache.memoryStorage.removeExpired()
        defaultCache.memoryStorage.removeExpired()
    }
}
