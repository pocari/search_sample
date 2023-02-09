class Searcher
  def initialize(data)
    @data = data
  end

  def initialize_data
    raise NotImplementedError
  end

  def solved?(state)
    raise NotImplementedError
  end

  def handle_solved(state)
    raise NotImplementedError
  end

  def next_states(state)
    raise NotImplementedError
  end

  def search
    initialize_data

    solved = false
    until @data.empty?
      state = @data.pop

      if solved?(state)
        solved = true
        if handle_solved(state)
          # ここでtrueを返すと、探索を「成功」で終了する
          return true
        end
      else
        next_states(state) do |next_state|
          @data.push(next_state)
        end
      end
    end
    # 少なくとも1つ解があればtrue
    solved
  end
end