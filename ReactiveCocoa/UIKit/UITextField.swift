import ReactiveSwift
import enum Result.NoError
import UIKit

extension Reactive where Base: UITextField {
	/// Sets the text of the text field.
	public var text: ValueBindable<Base, String?> {
		return makeValueBindable(value: \.text, values: { $0.reactive.textValues })
	}

	/// Sets the text of the text field.
	public var continuousText: ValueBindable<Base, String?> {
		return makeValueBindable(value: \.text, values: { $0.reactive.continuousTextValues })
	}

	/// A signal of text values emitted by the text field upon end of editing.
	///
	/// - note: To observe text values that change on all editing events,
	///   see `continuousTextValues`.
	public var textValues: Signal<String?, NoError> {
		return mapControlEvents([.editingDidEnd, .editingDidEndOnExit]) { $0.text }
	}

	/// A signal of text values emitted by the text field upon any changes.
	///
	/// - note: To observe text values only when editing ends, see `textValues`.
	public var continuousTextValues: Signal<String?, NoError> {
		return mapControlEvents(.allEditingEvents) { $0.text }
	}
	
	/// Sets the attributed text of the text field.
	public var attributedText: ValueBindable<Base, NSAttributedString?> {
		return makeValueBindable(value: \.attributedText, values: { $0.reactive.attributedTextValues })
	}
	
	/// Sets the textColor of the text field.
	public var textColor: BindingTarget<UIColor> {
		return makeBindingTarget { $0.textColor = $1 }
	}
	
	/// A signal of attributed text values emitted by the text field upon end of editing.
	///
	/// - note: To observe attributed text values that change on all editing events,
	///   see `continuousAttributedTextValues`.
	public var attributedTextValues: Signal<NSAttributedString?, NoError> {
		return mapControlEvents([.editingDidEnd, .editingDidEndOnExit]) { $0.attributedText }
	}
	
	/// A signal of attributed text values emitted by the text field upon any changes.
	///
	/// - note: To observe attributed text values only when editing ends, see `attributedTextValues`.
	public var continuousAttributedTextValues: Signal<NSAttributedString?, NoError> {
		return mapControlEvents(.allEditingEvents) { $0.attributedText }
	}

	/// Sets the secure text entry attribute on the text field.
	public var isSecureTextEntry: BindingTarget<Bool> {
		return makeBindingTarget { $0.isSecureTextEntry = $1 }
	}
}
