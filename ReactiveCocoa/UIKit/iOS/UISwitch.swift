import ReactiveSwift
import enum Result.NoError
import UIKit

extension Reactive where Base: UISwitch {
	/// Sets the on-off state of the switch.
	public var isOn: ValueBindable<Base, Bool> {
		return makeValueBindable(value: \.isOn, values: { $0.reactive.isOnValues })
	}

	/// A signal of on-off states in `Bool` emitted by the switch.
	public var isOnValues: Signal<Bool, NoError> {
		return mapControlEvents(.valueChanged) { $0.isOn }
	}
}
