class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var step: Int = 0
        var numVar: Int = num
        while numVar > 0 {
            step += 1
            if numVar % 2 == 0 {
                numVar /= 2
            } else {
                numVar -= 1
            }
        }
        return step
    }
}