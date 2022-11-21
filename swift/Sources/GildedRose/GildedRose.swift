class ItemQualityCalculator {
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateQuality() {
        if item.name != "Aged Brie", item.name != "Backstage passes to a TAFKAL80ETC concert" {
            if item.quality > 0 {
                if item.name != "Sulfuras, Hand of Ragnaros" {
                    item.quality = item.quality - 1
                }
            }
        } else {
            if item.quality < 50 {
                item.quality = item.quality + 1
                
                if item.name == "Backstage passes to a TAFKAL80ETC concert" {
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
            }
        }
        
        if item.name != "Sulfuras, Hand of Ragnaros" {
            item.sellIn = item.sellIn - 1
        }
        
        if item.sellIn < 0 {
            if item.name != "Aged Brie" {
                if item.name != "Backstage passes to a TAFKAL80ETC concert" {
                    if item.quality > 0 {
                        if item.name != "Sulfuras, Hand of Ragnaros" {
                            item.quality = item.quality - 1
                        }
                    }
                } else {
                    item.quality = item.quality - item.quality
                }
            } else {
                if item.quality < 50 {
                    item.quality = item.quality + 1
                }
            }
        }
    }
}

public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        items.forEach {
            let calculator = ItemQualityCalculator(item: $0)
            calculator.updateQuality()
        }
    }
}
