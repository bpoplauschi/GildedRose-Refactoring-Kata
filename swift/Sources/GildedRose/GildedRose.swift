public protocol ItemQualityCalculator {
    func updateQuality()
}

final class AnyItemQualityCalculator: ItemQualityCalculator {
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateQuality() {
        if item.quality > 0 {
            item.quality = item.quality - 1
        }
        
        item.sellIn = item.sellIn - 1
        
        if item.sellIn < 0 {
            if item.quality > 0 {
                item.quality = item.quality - 1
            }
        }
    }
}

final class AgedBrieItemQualityCalculator: ItemQualityCalculator {
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateQuality() {
        if item.quality < 50 {
            item.quality = item.quality + 1
        }
        
        item.sellIn = item.sellIn - 1
        
        if item.sellIn < 0 {
            if item.quality < 50 {
                item.quality = item.quality + 1
            }
        }
    }
}

final class TAFKAL80ETCItemQualityCalculator: ItemQualityCalculator {
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateQuality() {
        if item.quality < 50 {
            item.quality = item.quality + 1
            
            if item.sellIn < 11 {
                if item.quality < 50 {
                    item.quality = item.quality + 1
                }
            }
            
            if item.sellIn < 6 {
                if item.quality < 50 {
                    item.quality = item.quality + 1
                }
            }
        }
        
        item.sellIn = item.sellIn - 1
        
        if item.sellIn < 0 {
            item.quality = item.quality - item.quality
        }
    }
}

final class SulfurasItemQualityCalculator: ItemQualityCalculator {
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateQuality() {}
}

public class GildedRose {
    var items: [Item]
    private let calculatorFactory: (Item) -> ItemQualityCalculator

    public init(items: [Item], calculatorFactory: @escaping (Item) -> ItemQualityCalculator = itemQualityCalculatorFactory(item:)) {
        self.items = items
        self.calculatorFactory = calculatorFactory
    }
    
    public func updateQuality() {
        items.forEach { item in
            let calculator: ItemQualityCalculator = calculatorFactory(item)
            calculator.updateQuality()
        }
    }
}

public func itemQualityCalculatorFactory(item: Item) -> ItemQualityCalculator {
    let result: ItemQualityCalculator
    switch item.name {
    case "Aged Brie": result = AgedBrieItemQualityCalculator(item: item)
    case "Backstage passes to a TAFKAL80ETC concert": result = TAFKAL80ETCItemQualityCalculator(item: item)
    case "Sulfuras, Hand of Ragnaros": result = SulfurasItemQualityCalculator(item: item)
    default: result = AnyItemQualityCalculator(item: item)
    }
    return result
}
