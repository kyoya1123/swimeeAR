import Foundation

extension Int {
    var timerFormat: String {
        var hour = 0
        if self >= 3600 {
            hour = self / 3600
        }
        var min = self - hour * 3600
        if min >= 60 {
            min /= 60
        } else {
            min = 0
        }
        let sec = self - (hour * 3600 + min * 60)
        return "\(oneDigitTimerFormat(min)):\(oneDigitTimerFormat(sec))"
    }
    
    private func oneDigitTimerFormat(_ num: Int) -> String {
        num < 10 ? "0\(num)" : String(num)
    }
}
