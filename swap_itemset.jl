# -*- coding: utf-8 -*-

DB = [
   1 1 1 0 0 0 1 1;
   1 0 1 0 0 1 0 0;
   1 1 1 0 0 0 0 1;
   1 1 1 0 1 1 0 1;
   0 0 0 1 0 0 0 0;
   0 0 1 1 1 1 0 0;
   0 0 0 1 1 1 1 0;
   0 0 1 1 0 0 0 0;
   0 0 1 1 1 0 0 1;
]

# display(DB)
# println()

X = [1,1,0,0,0,0,0,0]

function support(D, X)
  counter = 0
  N, M = size(D)
  for i=1:N
    if X & D[i, :] == X
      counter += 1
    end
  end
  return counter
end

num = support(DB, X)
println(num)

function swap(D; K=5)
  Dp = copy(D)
  N, M = size(Dp)
  for i = 1:K
    s, t = rand(1:N), rand(1:N)
    x, y = rand(1:M), rand(1:M)
    while Dp[s, x] != 1 && Dp[t, y] != 1
        s, t = rand(1:N), rand(1:N)
	x, y = rand(1:M), rand(1:M)
    end
    # println("Selected: $s, $x, $t, $y")
    if Dp[s, y] == 0 && D[t, x] == 0
       Dp[s, x] = Dp[t, y] = 0
       Dp[s, y] = Dp[t, x] = 1
    end
  end

  println("1: $(sum(D,1)), $(sum(Dp,1))")
  println("2: $(sum(D,2)), $(sum(Dp,2))")
  return Dp
end

# DBp = swap(DB)
# display(DBp)
# println()

NumTest = 10
K = 100
count_ge = 0
count_X = support(DB, X)
for i=1:NumTest
  DBpi = swap(DB)
  count_i = support(DBpi, X)
  if count_i >= count_X
    count_ge += 1
  end
  # println("$i,$count_i")
end

println("Test: $NumTest")
println("Swap: $K")
println("# GE: $count_ge")

# println(sum(DB, 1))
# println(sum(DB, 2))