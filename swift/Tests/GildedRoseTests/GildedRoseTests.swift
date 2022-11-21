@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func test_foo() {
        let sut = makeSUT(itemName: "foo")
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "foo, -1, 0")
    }
    
    func test_fooWithSellIn() {
        let sut = makeSUT(itemName: "foo", sellIn: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "foo, 9, 0")
    }
    
    func test_fooWithSellInOver11() {
        let sut = makeSUT(itemName: "foo", sellIn: 12)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "foo, 11, 0")
    }
    
    func test_fooWithQuality() {
        let sut = makeSUT(itemName: "foo", quality: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "foo, -1, 8")
    }
    
    func test_fooWithQualityOver50() {
        let sut = makeSUT(itemName: "foo", quality: 51)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "foo, -1, 49")
    }
    
    func test_fooWithSellInAndQuality() {
        let sut = makeSUT(itemName: "foo", sellIn: 5, quality: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "foo, 4, 9")
    }
    
    func test_AgedBrie() {
        let sut = makeSUT(itemName: "Aged Brie")
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Aged Brie, -1, 2")
    }
    
    func test_AgedBrieWithSellIn() {
        let sut = makeSUT(itemName: "Aged Brie", sellIn: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Aged Brie, 9, 1")
    }
    
    func test_AgedBrieWithQuality() {
        let sut = makeSUT(itemName: "Aged Brie", quality: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Aged Brie, -1, 12")
    }
    
    func test_AgedBrieWithSellInAndQuality() {
        let sut = makeSUT(itemName: "Aged Brie", sellIn: 5, quality: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Aged Brie, 4, 11")
    }
    
    func test_BackstagePassesToTAFKAL80ETCConcert() {
        let sut = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert")
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Backstage passes to a TAFKAL80ETC concert, -1, 0")
    }
    
    func test_BackstagePassesToTAFKAL80ETCConcertWithSellIn() {
        let sut = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Backstage passes to a TAFKAL80ETC concert, 9, 2")
    }
    
    func test_BackstagePassesToTAFKAL80ETCConcertWithQuality() {
        let sut = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", quality: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Backstage passes to a TAFKAL80ETC concert, -1, 0")
    }
    
    func test_BackstagePassesToTAFKAL80ETCConcertWithSellInAndQuality() {
        let sut = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Backstage passes to a TAFKAL80ETC concert, 4, 13")
    }
    
    func test_SulfurasHandOfRagnaros() {
        let sut = makeSUT(itemName: "Sulfuras, Hand of Ragnaros")
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Sulfuras, Hand of Ragnaros, 0, 0")
    }
    
    func test_SulfurasHandOfRagnarosWithQuality() {
        let sut = makeSUT(itemName: "Sulfuras, Hand of Ragnaros", quality: 5)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Sulfuras, Hand of Ragnaros, 0, 5")
    }
    
    func test_SulfurasHandOfRagnarosWithSellIn() {
        let sut = makeSUT(itemName: "Sulfuras, Hand of Ragnaros", sellIn: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Sulfuras, Hand of Ragnaros, 10, 0")
    }
    
    func test_SulfurasHandOfRagnarosWithSellInAndQuality() {
        let sut = makeSUT(itemName: "Sulfuras, Hand of Ragnaros", sellIn: 5, quality: 10)
        
        sut.updateQuality()
        
        XCTAssertEqual(sut.itemDescription, "Sulfuras, Hand of Ragnaros, 5, 10")
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
