@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func test_combinations() {
        let names: [String] = [
            "",
            "foo",
            "Aged Brie",
            "Backstage passes to a TAFKAL80ETC concert",
            "Sulfuras, Hand of Ragnaros"]
        let sellIns: [Int] = [-1, 0, 1, 10, 11, 12, 15]
        let qualities: [Int] = [-1, 0, 1, 10, 50, 51, 60]
        
        let expectedResults = [
            ", -2, -1",
            ", -2, 0",
            ", -2, 0",
            ", -2, 8",
            ", -2, 48",
            ", -2, 49",
            ", -2, 58",
            ", -1, -1",
            ", -1, 0",
            ", -1, 0",
            ", -1, 8",
            ", -1, 48",
            ", -1, 49",
            ", -1, 58",
            ", 0, -1",
            ", 0, 0",
            ", 0, 0",
            ", 0, 9",
            ", 0, 49",
            ", 0, 50",
            ", 0, 59",
            ", 9, -1",
            ", 9, 0",
            ", 9, 0",
            ", 9, 9",
            ", 9, 49",
            ", 9, 50",
            ", 9, 59",
            ", 10, -1",
            ", 10, 0",
            ", 10, 0",
            ", 10, 9",
            ", 10, 49",
            ", 10, 50",
            ", 10, 59",
            ", 11, -1",
            ", 11, 0",
            ", 11, 0",
            ", 11, 9",
            ", 11, 49",
            ", 11, 50",
            ", 11, 59",
            ", 14, -1",
            ", 14, 0",
            ", 14, 0",
            ", 14, 9",
            ", 14, 49",
            ", 14, 50",
            ", 14, 59",
            "foo, -2, -1",
            "foo, -2, 0",
            "foo, -2, 0",
            "foo, -2, 8",
            "foo, -2, 48",
            "foo, -2, 49",
            "foo, -2, 58",
            "foo, -1, -1",
            "foo, -1, 0",
            "foo, -1, 0",
            "foo, -1, 8",
            "foo, -1, 48",
            "foo, -1, 49",
            "foo, -1, 58",
            "foo, 0, -1",
            "foo, 0, 0",
            "foo, 0, 0",
            "foo, 0, 9",
            "foo, 0, 49",
            "foo, 0, 50",
            "foo, 0, 59",
            "foo, 9, -1",
            "foo, 9, 0",
            "foo, 9, 0",
            "foo, 9, 9",
            "foo, 9, 49",
            "foo, 9, 50",
            "foo, 9, 59",
            "foo, 10, -1",
            "foo, 10, 0",
            "foo, 10, 0",
            "foo, 10, 9",
            "foo, 10, 49",
            "foo, 10, 50",
            "foo, 10, 59",
            "foo, 11, -1",
            "foo, 11, 0",
            "foo, 11, 0",
            "foo, 11, 9",
            "foo, 11, 49",
            "foo, 11, 50",
            "foo, 11, 59",
            "foo, 14, -1",
            "foo, 14, 0",
            "foo, 14, 0",
            "foo, 14, 9",
            "foo, 14, 49",
            "foo, 14, 50",
            "foo, 14, 59",
            "Aged Brie, -2, 1",
            "Aged Brie, -2, 2",
            "Aged Brie, -2, 3",
            "Aged Brie, -2, 12",
            "Aged Brie, -2, 50",
            "Aged Brie, -2, 51",
            "Aged Brie, -2, 60",
            "Aged Brie, -1, 1",
            "Aged Brie, -1, 2",
            "Aged Brie, -1, 3",
            "Aged Brie, -1, 12",
            "Aged Brie, -1, 50",
            "Aged Brie, -1, 51",
            "Aged Brie, -1, 60",
            "Aged Brie, 0, 0",
            "Aged Brie, 0, 1",
            "Aged Brie, 0, 2",
            "Aged Brie, 0, 11",
            "Aged Brie, 0, 50",
            "Aged Brie, 0, 51",
            "Aged Brie, 0, 60",
            "Aged Brie, 9, 0",
            "Aged Brie, 9, 1",
            "Aged Brie, 9, 2",
            "Aged Brie, 9, 11",
            "Aged Brie, 9, 50",
            "Aged Brie, 9, 51",
            "Aged Brie, 9, 60",
            "Aged Brie, 10, 0",
            "Aged Brie, 10, 1",
            "Aged Brie, 10, 2",
            "Aged Brie, 10, 11",
            "Aged Brie, 10, 50",
            "Aged Brie, 10, 51",
            "Aged Brie, 10, 60",
            "Aged Brie, 11, 0",
            "Aged Brie, 11, 1",
            "Aged Brie, 11, 2",
            "Aged Brie, 11, 11",
            "Aged Brie, 11, 50",
            "Aged Brie, 11, 51",
            "Aged Brie, 11, 60",
            "Aged Brie, 14, 0",
            "Aged Brie, 14, 1",
            "Aged Brie, 14, 2",
            "Aged Brie, 14, 11",
            "Aged Brie, 14, 50",
            "Aged Brie, 14, 51",
            "Aged Brie, 14, 60",
            "Backstage passes to a TAFKAL80ETC concert, -2, 0",
            "Backstage passes to a TAFKAL80ETC concert, -2, 0",
            "Backstage passes to a TAFKAL80ETC concert, -2, 0",
            "Backstage passes to a TAFKAL80ETC concert, -2, 0",
            "Backstage passes to a TAFKAL80ETC concert, -2, 0",
            "Backstage passes to a TAFKAL80ETC concert, -2, 0",
            "Backstage passes to a TAFKAL80ETC concert, -2, 0",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, -1, 0",
            "Backstage passes to a TAFKAL80ETC concert, 0, 2",
            "Backstage passes to a TAFKAL80ETC concert, 0, 3",
            "Backstage passes to a TAFKAL80ETC concert, 0, 4",
            "Backstage passes to a TAFKAL80ETC concert, 0, 13",
            "Backstage passes to a TAFKAL80ETC concert, 0, 50",
            "Backstage passes to a TAFKAL80ETC concert, 0, 51",
            "Backstage passes to a TAFKAL80ETC concert, 0, 60",
            "Backstage passes to a TAFKAL80ETC concert, 9, 1",
            "Backstage passes to a TAFKAL80ETC concert, 9, 2",
            "Backstage passes to a TAFKAL80ETC concert, 9, 3",
            "Backstage passes to a TAFKAL80ETC concert, 9, 12",
            "Backstage passes to a TAFKAL80ETC concert, 9, 50",
            "Backstage passes to a TAFKAL80ETC concert, 9, 51",
            "Backstage passes to a TAFKAL80ETC concert, 9, 60",
            "Backstage passes to a TAFKAL80ETC concert, 10, 0",
            "Backstage passes to a TAFKAL80ETC concert, 10, 1",
            "Backstage passes to a TAFKAL80ETC concert, 10, 2",
            "Backstage passes to a TAFKAL80ETC concert, 10, 11",
            "Backstage passes to a TAFKAL80ETC concert, 10, 50",
            "Backstage passes to a TAFKAL80ETC concert, 10, 51",
            "Backstage passes to a TAFKAL80ETC concert, 10, 60",
            "Backstage passes to a TAFKAL80ETC concert, 11, 0",
            "Backstage passes to a TAFKAL80ETC concert, 11, 1",
            "Backstage passes to a TAFKAL80ETC concert, 11, 2",
            "Backstage passes to a TAFKAL80ETC concert, 11, 11",
            "Backstage passes to a TAFKAL80ETC concert, 11, 50",
            "Backstage passes to a TAFKAL80ETC concert, 11, 51",
            "Backstage passes to a TAFKAL80ETC concert, 11, 60",
            "Backstage passes to a TAFKAL80ETC concert, 14, 0",
            "Backstage passes to a TAFKAL80ETC concert, 14, 1",
            "Backstage passes to a TAFKAL80ETC concert, 14, 2",
            "Backstage passes to a TAFKAL80ETC concert, 14, 11",
            "Backstage passes to a TAFKAL80ETC concert, 14, 50",
            "Backstage passes to a TAFKAL80ETC concert, 14, 51",
            "Backstage passes to a TAFKAL80ETC concert, 14, 60",
            "Sulfuras, Hand of Ragnaros, -1, -1",
            "Sulfuras, Hand of Ragnaros, -1, 0",
            "Sulfuras, Hand of Ragnaros, -1, 1",
            "Sulfuras, Hand of Ragnaros, -1, 10",
            "Sulfuras, Hand of Ragnaros, -1, 50",
            "Sulfuras, Hand of Ragnaros, -1, 51",
            "Sulfuras, Hand of Ragnaros, -1, 60",
            "Sulfuras, Hand of Ragnaros, 0, -1",
            "Sulfuras, Hand of Ragnaros, 0, 0",
            "Sulfuras, Hand of Ragnaros, 0, 1",
            "Sulfuras, Hand of Ragnaros, 0, 10",
            "Sulfuras, Hand of Ragnaros, 0, 50",
            "Sulfuras, Hand of Ragnaros, 0, 51",
            "Sulfuras, Hand of Ragnaros, 0, 60",
            "Sulfuras, Hand of Ragnaros, 1, -1",
            "Sulfuras, Hand of Ragnaros, 1, 0",
            "Sulfuras, Hand of Ragnaros, 1, 1",
            "Sulfuras, Hand of Ragnaros, 1, 10",
            "Sulfuras, Hand of Ragnaros, 1, 50",
            "Sulfuras, Hand of Ragnaros, 1, 51",
            "Sulfuras, Hand of Ragnaros, 1, 60",
            "Sulfuras, Hand of Ragnaros, 10, -1",
            "Sulfuras, Hand of Ragnaros, 10, 0",
            "Sulfuras, Hand of Ragnaros, 10, 1",
            "Sulfuras, Hand of Ragnaros, 10, 10",
            "Sulfuras, Hand of Ragnaros, 10, 50",
            "Sulfuras, Hand of Ragnaros, 10, 51",
            "Sulfuras, Hand of Ragnaros, 10, 60",
            "Sulfuras, Hand of Ragnaros, 11, -1",
            "Sulfuras, Hand of Ragnaros, 11, 0",
            "Sulfuras, Hand of Ragnaros, 11, 1",
            "Sulfuras, Hand of Ragnaros, 11, 10",
            "Sulfuras, Hand of Ragnaros, 11, 50",
            "Sulfuras, Hand of Ragnaros, 11, 51",
            "Sulfuras, Hand of Ragnaros, 11, 60",
            "Sulfuras, Hand of Ragnaros, 12, -1",
            "Sulfuras, Hand of Ragnaros, 12, 0",
            "Sulfuras, Hand of Ragnaros, 12, 1",
            "Sulfuras, Hand of Ragnaros, 12, 10",
            "Sulfuras, Hand of Ragnaros, 12, 50",
            "Sulfuras, Hand of Ragnaros, 12, 51",
            "Sulfuras, Hand of Ragnaros, 12, 60",
            "Sulfuras, Hand of Ragnaros, 15, -1",
            "Sulfuras, Hand of Ragnaros, 15, 0",
            "Sulfuras, Hand of Ragnaros, 15, 1",
            "Sulfuras, Hand of Ragnaros, 15, 10",
            "Sulfuras, Hand of Ragnaros, 15, 50",
            "Sulfuras, Hand of Ragnaros, 15, 51",
            "Sulfuras, Hand of Ragnaros, 15, 60"
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
