def kuku_loop
  (1..9).flat_map do |i|
    (1..9).map do |j|
      [i, j]
    end
  end
end

p kuku_loop