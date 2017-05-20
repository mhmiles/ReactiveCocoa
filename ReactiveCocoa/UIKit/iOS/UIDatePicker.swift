import ReactiveSwift
import enum Result.NoError
import UIKit

extension Reactive where Base: UIDatePicker {
	/// Sets the date of the date picker.
	public var date: ValueBindable<Base, Date> {
		return makeValueBindable(value: \.date, values: { $0.reactive.dates })
	}

	/// A signal of dates emitted by the date picker.
	public var dates: Signal<Date, NoError> {
		return mapControlEvents(.valueChanged) { $0.date }
	}
}
