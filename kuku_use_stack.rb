require './stack'

def kuku_use_stack
  results = []
  data = Stack.new

  data.push([])

  until data.empty?
    acc = data.get
    if acc.size == 2
      results << acc
    else
      (1..9).each do |i|
        data.push(acc + [i])
      end
    end
  end
  results
end

results = kuku_use_stack
p results
