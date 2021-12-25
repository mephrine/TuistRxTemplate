import XCTest
@testable import ResourcePackage

final class ImageAssetTests: XCTestCase {
 func test_image() {
   XCTAssertNotNil(R.Image.close_normal.cgImage)
 }
}
