public class GildedRose {
    public private(set) var items: [Item]
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
