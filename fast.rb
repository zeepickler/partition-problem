# Partition Problem Solver
# Author: Ryan Smith
# Date: 4/17/17

def create_set(k,n)
  set = []
  n.times{ set << rand(2 ** k) + 1}
  return set
end

# To create your own random set, uncomment the line below.
# k is the size of the number and n is the number of 
# elements in the set.

# set = create_set(10,10)

set = [771, 121, 281, 854, 885, 734, 486, 1003, 83, 62]

set.sort!.reverse!

print "The set: "
p set

set_total = set.inject(0){|x,acc| x + acc }

set_size = set.size

n_half = set_size / 2


half = set_total / 2

def display_subset(binary, set)
  set_a = []
  set_b = []
  binary.split("").each_with_index do |x,i|
    if x == "0"
      set_a << set[i]
    elsif x == "1"
      set_b << set[i]
    else
      raise "invalid character"
    end
  end
  print "Subset 1: "
  p set_a

  print "Subset 2: "
  p set_b
end

def check_partition(binary_total, set, half, set_size)
  total = 0
  binary = binary_total.abs.to_s(2)
  set.each_with_index do |x,i|
    if binary[i] == "1"
      total += x
    end
  end
  if total == half
    display_subset(binary.slice(0,set_size), set)
    exit
  end
  return total
end

def update_binary_total(binary_total, total, half, factor)
  if total > half
    binary_total -= (2 ** factor)
  else
    binary_total += (2 ** factor)
  end
  return binary_total
end

offset = set_size - 2

binary_total = 2 ** (set_size - 1)
offset.times do |k|
  offset.times do
    offset.downto(0) do |n|
      total = check_partition(binary_total, set, half, set_size)
      if n == n_half
        binary_total = update_binary_total(binary_total, total, half, k)
      end
      binary_total = update_binary_total(binary_total, total, half, n)
    end
    check_partition(binary_total, set, half, set_size)
  end
end
