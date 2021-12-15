class Solution:
    def numberOfSteps(self, num: int) -> int:
        step = 0
        while num > 0:
            step += 1
            if num % 2 == 0:
                num //= 2
            else:
                num -= 1
        return step

s = Solution()
print(s.numberOfSteps(14))
print(s.numberOfSteps(8))