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
    
    func dayPass() { item.sellIn -= 1 }
    
    func increaseQuality() {
        if item.quality < 50 {
            item.quality += 1
        }
    }
    
    func decreaseQuality() {
        if item.quality > 0 {
            item.quality -= 1
        }
    }
    
    var sellDateHasPassed: Bool { item.sellIn < 0 }
}

final class AnyItemQualityCalculator: ItemQualityCalculator {
    override func updateQuality() {
        decreaseQuality()
        dayPass()
        if sellDateHasPassed { decreaseQuality() }
    }
}

final class AgedBrieItemQualityCalculator: ItemQualityCalculator {
    override func updateQuality() {
        increaseQuality()
        dayPass()
        if sellDateHasPassed { increaseQuality() }
    }
}

final class TAFKAL80ETCItemQualityCalculator: ItemQualityCalculator {
    override func updateQuality() {
        increaseQuality()
        if in10daysOrLess { increaseQuality() }
        if in5daysOrLess { increaseQuality() }
        dayPass()
        if sellDateHasPassed { dropQuality() }
    }
    
    private var in10daysOrLess: Bool { item.sellIn < 11 }
    private var in5daysOrLess: Bool { item.sellIn < 6 }
    private func dropQuality() { item.quality = 0 }
}

final class SulfurasItemQualityCalculator: ItemQualityCalculator {
    override func updateQuality() {}
}

final class ConjuredItemQualityCalculator: ItemQualityCalculator {
    override func updateQuality() {
        decreaseQuality()
        decreaseQuality()
        dayPass()
        if sellDateHasPassed { decreaseQuality(); decreaseQuality() }
    }
}
