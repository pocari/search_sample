require './stack'

def combination(ary, size)
  results = []
  data = Stack.new

  data.push([
    [],
    ary.dup,
  ])

  until data.empty?
    acc, useable_ary = data.get
    if acc.size == size
      results << acc
    else
      unless useable_ary.empty?
        data.push([
          acc + [useable_ary[0]],
          useable_ary[1..-1],
        ])
        data.push([
          acc,
          useable_ary[1..-1],
        ])
      end
    end
  end
  results
end

results = combination([1, 2, 3, 4, 5], 3)
if results
  p results
end
