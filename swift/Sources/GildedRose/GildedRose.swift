final class AnyItemQualityCalculator: ItemQualityCalculator {
    override func updateQuality() {
        decrementQualityIfPossible()
        decrementSellIn()
        if item.sellIn < 0 {
            decrementQualityIfPossible()
        }
    }
}

final class AgedBrieItemQualityCalculator: ItemQualityCalculator {
    override func updateQuality() {
        incrementQualityIfPossible()
        decrementSellIn()
        if item.sellIn < 0 {
            incrementQualityIfPossible()
        }
    }
}

final class TAFKAL80ETCItemQualityCalculator: ItemQualityCalculator {
    override func updateQuality() {
        incrementQualityIfPossible()
        if item.quality < 50 {
            if item.sellIn < 11 {
                incrementQualityIfPossible()
            }
            if item.sellIn < 6 {
                incrementQualityIfPossible()
            }
        }
        decrementSellIn()
        if item.sellIn < 0 {
            item.quality = 0
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
