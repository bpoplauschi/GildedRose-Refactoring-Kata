protocol ItemQualityCalculator {
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

    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        items.forEach { item in
            let calculator: ItemQualityCalculator
            switch item.name {
            case "Aged Brie": calculator = AgedBrieItemQualityCalculator(item: item)
            case "Backstage passes to a TAFKAL80ETC concert": calculator = TAFKAL80ETCItemQualityCalculator(item: item)
            case "Sulfuras, Hand of Ragnaros": calculator = SulfurasItemQualityCalculator(item: item)
            default: calculator = AnyItemQualityCalculator(item: item)
            }
            calculator.updateQuality()
        }
    }
}
