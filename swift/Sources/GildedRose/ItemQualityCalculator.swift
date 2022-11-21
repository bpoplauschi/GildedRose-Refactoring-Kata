//
//  File.swift
//  
//
//  Created by Bogdan on 21.11.2022.
//

public class ItemQualityCalculator {
    let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateQuality() {}
    
    func decrementSellIn() {
        item.sellIn = item.sellIn - 1
    }
    
    func incrementQualityIfPossible() {
        if item.quality < 50 {
            item.quality = item.quality + 1
        }
    }
    
    func decrementQualityIfPossible() {
        if item.quality > 0 {
            item.quality = item.quality - 1
        }
    }
}
