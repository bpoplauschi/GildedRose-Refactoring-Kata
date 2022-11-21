import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func test_updateQuality_onNegativeQuality_doesNotChangeQuality() {
        let sut = GildedRose(items: [Item(name: "any item name", sellIn: 0, quality: -1)])
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "any item name, -1, -1", "Negative quality does not change")
    }
    
    func test_updateQuality_onZeroQuality_doesNotChangeQuality() {
        let sut = GildedRose(items: [Item(name: "any item name", sellIn: 0, quality: 0)])
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "any item name, -1, 0", "Zero quality does not change")
    }
    
    func test_updateQuality_onNegativeSellIn_decreasesSellIn() {
        let sut = GildedRose(items: [Item(name: "any item name", sellIn: -1, quality: 0)])
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "any item name, -2, 0", "Negative sell in decreases")
    }
    
    func test_updateQuality_onZeroSellIn_decreasesSellIn() {
        let sut = GildedRose(items: [Item(name: "any item name", sellIn: 0, quality: 0)])
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "any item name, -1, 0", "Zero sell in decreases")
    }
    
    func test_updateQuality_combinationsOfNameSellInQuality() {
        let names: [String] = [
            "any item name",
            "Aged Brie",
            "Backstage passes to a TAFKAL80ETC concert",
            "Sulfuras, Hand of Ragnaros",
            "Conjured Mana Cake"
        ]
        let sellIns: [Int] = [0, 1, 5, 10, 11]
        let qualities: [Int] = [1, 10, 50]
        
        let expectedResults = [
            "any item name, -1, 0",
            "any item name, -1, 8",
            "any item name, -1, 48",
            "any item name, 0, 0",
            "any item name, 0, 9",
            "any item name, 0, 49",
            "any item name, 4, 0",
            "any item name, 4, 9",
            "any item name, 4, 49",
            "any item name, 9, 0",
            "any item name, 9, 9",
            "any item name, 9, 49",
            "any item name, 10, 0",
            "any item name, 10, 9",
            "any item name, 10, 49",
            "Aged Brie, -1, 3",
            "Aged Brie, -1, 12",
            "Aged Brie, -1, 50",
            "Aged Brie, 0, 2",
            "Aged Brie, 0, 11",
            "Aged Brie, 0, 50",
            "Aged Brie, 4, 2",
            "Aged Brie, 4, 11",
            "Aged Brie, 4, 50",
            "Aged Brie, 9, 2",
            "Aged Brie, 9, 11",
            "Aged Brie, 9, 50",
            "Aged Brie, 10, 2",
            "Aged Brie, 10, 11",
            "Aged Brie, 10, 50",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, 0, 4",
            "Backstage passes to a TAFKAL80ETC concert, 0, 13",
            "Backstage passes to a TAFKAL80ETC concert, 0, 50",
            "Backstage passes to a TAFKAL80ETC concert, 4, 4",
            "Backstage passes to a TAFKAL80ETC concert, 4, 13",
            "Backstage passes to a TAFKAL80ETC concert, 4, 50",
            "Backstage passes to a TAFKAL80ETC concert, 9, 3",
            "Backstage passes to a TAFKAL80ETC concert, 9, 12",
            "Backstage passes to a TAFKAL80ETC concert, 9, 50",
            "Backstage passes to a TAFKAL80ETC concert, 10, 2",
            "Backstage passes to a TAFKAL80ETC concert, 10, 11",
            "Backstage passes to a TAFKAL80ETC concert, 10, 50",
            "Sulfuras, Hand of Ragnaros, 0, 1",
            "Sulfuras, Hand of Ragnaros, 0, 10",
            "Sulfuras, Hand of Ragnaros, 0, 50",
            "Sulfuras, Hand of Ragnaros, 1, 1",
            "Sulfuras, Hand of Ragnaros, 1, 10",
            "Sulfuras, Hand of Ragnaros, 1, 50",
            "Sulfuras, Hand of Ragnaros, 5, 1",
            "Sulfuras, Hand of Ragnaros, 5, 10",
            "Sulfuras, Hand of Ragnaros, 5, 50",
            "Sulfuras, Hand of Ragnaros, 10, 1",
            "Sulfuras, Hand of Ragnaros, 10, 10",
            "Sulfuras, Hand of Ragnaros, 10, 50",
            "Sulfuras, Hand of Ragnaros, 11, 1",
            "Sulfuras, Hand of Ragnaros, 11, 10",
            "Sulfuras, Hand of Ragnaros, 11, 50",
            "Conjured Mana Cake, -1, 0",
            "Conjured Mana Cake, -1, 6",
            "Conjured Mana Cake, -1, 46",
            "Conjured Mana Cake, 0, 0",
            "Conjured Mana Cake, 0, 8",
            "Conjured Mana Cake, 0, 48",
            "Conjured Mana Cake, 4, 0",
            "Conjured Mana Cake, 4, 8",
            "Conjured Mana Cake, 4, 48",
            "Conjured Mana Cake, 9, 0",
            "Conjured Mana Cake, 9, 8",
            "Conjured Mana Cake, 9, 48",
            "Conjured Mana Cake, 10, 0",
            "Conjured Mana Cake, 10, 8",
            "Conjured Mana Cake, 10, 48"
        ]
        
        var expectedIndex = 0
        
        for name in names {
            for sellIn in sellIns {
                for quality in qualities {
                    let sut = makeSUT(itemName: name, sellIn: sellIn, quality: quality)
                    
                    sut.updateQuality()
                    
                    XCTAssertEqual(sut.itemDescription, expectedResults[expectedIndex], "Expected \(expectedResults[expectedIndex]) for item \(sut.items[0].name)")
                    expectedIndex += 1
                }
            }
        }
    }
    
    func test_multipleItems() {
        let items: [Item] = [
            Item(name: "foo", sellIn: 0, quality: 0),
            Item(name: "Aged Brie", sellIn: 0, quality: 0),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 0),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 0)
        ]
        let sut = GildedRose(items: items)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.items.map { $0.description }, [
            "foo, -1, 0",
            "Aged Brie, -1, 2",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Sulfuras, Hand of Ragnaros, 0, 0"
        ])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(itemName name: String, sellIn: Int = 0, quality: Int = 0) -> GildedRose {
        let item = Item(name: name, sellIn: sellIn, quality: quality)
        let sut = GildedRose(items: [item])
        trackForMemoryLeaks(sut)
        return sut
    }
}

extension GildedRose {
    var itemDescription: String { items.first?.description ?? "" }
}

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
