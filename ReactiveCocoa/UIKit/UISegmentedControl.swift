import ReactiveSwift
import enum Result.NoError
import UIKit

extension Reactive where Base: UISegmentedControl {
	/// Changes the selected segment of the segmented control.
	public var selectedSegmentIndex: ValueBindable<Base, Int> {
		return makeValueBindable(value: \.selectedSegmentIndex, values: { $0.reactive.selectedSegmentIndexes })
	}

	/// A signal of indexes of selections emitted by the segmented control.
	public var selectedSegmentIndexes: Signal<Int, NoError> {
		return mapControlEvents(.valueChanged) { $0.selectedSegmentIndex }
	}
}
