import UIKit

extension UIView {
    func rounded(_ radius: CGFloat? = nil) {
        if let radius = radius {
            layer.cornerRadius = radius
        } else {
            layer.cornerRadius = frame.height / 2
        }
        if !subviews.isEmpty {
            subviews.forEach { $0.rounded(radius) }
        }
    }
}
