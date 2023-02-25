def kuku_recur(acc = [])
  if acc.size == 2
    [acc]
  else
    (1..9).flat_map do |i|
      kuku_recur(acc + [i])
    end
  end
end

p kuku_recur