def fib(n)
    fib_0 = 0
    fib_1 = 1
    for n in 0...n do 
        temp = fib_0
        fib_0 = fib_1
        fib_1 = fib_1 + temp
    end
    return fib_1
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)

# Output:
# 1
# 1
# 2
# 3
# 5
# 8
# 13
# 21
# 34
# 55