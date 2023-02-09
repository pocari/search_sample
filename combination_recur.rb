def combination(ary, size, acc = [])
  if acc.size == size
    [acc]
  else
    return [] if ary.empty?
    use_first = combination(ary[1..-1], size, acc + [ary[0]])
    unuse_first = combination(ary[1..-1], size, acc)

    use_first + unuse_first
  end
end

p combination([1, 2, 3, 4, 5], 3)
