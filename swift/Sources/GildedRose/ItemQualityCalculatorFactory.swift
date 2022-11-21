//
//  File.swift
//  
//
//  Created by Bogdan on 21.11.2022.
//

public func itemQualityCalculatorFactory(item: Item) -> ItemQualityCalculator {
    let result: ItemQualityCalculator
    switch item.name {
    case "Aged Brie": result = AgedBrieItemQualityCalculator(item: item)
    case "Backstage passes to a TAFKAL80ETC concert": result = TAFKAL80ETCItemQualityCalculator(item: item)
    case "Sulfuras, Hand of Ragnaros": result = SulfurasItemQualityCalculator(item: item)
    case "Conjured Mana Cake": result = ConjuredItemQualityCalculator(item: item)
    default: result = AnyItemQualityCalculator(item: item)
    }
    return result
}
