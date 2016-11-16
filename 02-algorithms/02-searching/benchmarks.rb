require 'benchmark'

# fibonacci, iterative
def fibI(n)
    fib_0 = 0
    fib_1 = 1
    for n in 0...n do 
        temp = fib_0
        fib_0 = fib_1
        fib_1 = fib_1 + temp
    end
    return fib_1
end

# fibonacci, recursive
def fibR(n)
    if (n == 0)
        return 0
    elsif (n == 1)
        return 1
    else
        return fibR(n-1) + fibR(n-2)
    end
end

Benchmark.bm do |x|
    x.report { fibI(20) }
    x.report { fibR(20) }
end

# Output

#       user     system      total        real
#   0.000000   0.000000   0.000000 (  0.000006)
#   0.000000   0.000000   0.000000 (  0.001245)
