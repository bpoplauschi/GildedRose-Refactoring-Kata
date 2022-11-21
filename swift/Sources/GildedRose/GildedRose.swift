final class AnyItemQualityCalculator: ItemQualityCalculator {
    override func updateQuality() {
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
    override func updateQuality() {
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
    override func updateQuality() {
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
    override func updateQuality() {}
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
