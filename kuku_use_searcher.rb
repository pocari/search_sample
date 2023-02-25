require_relative './searcher'
require_relative './stack'

class DfsKukuSearcher < Searcher
  attr_reader :results

  def initialize
    super(Stack.new)
    @results = []
  end

  def initialize_data
    # 状態の定義
    @data.push([])
  end

  def solved?(state)
    # 終わってるかどうかのチェック
    state.size == 2
  end

  def handle_solved(state)
    @results << state
    # 全部見つけるまで探し続けるのでfales
    false
  end

  def next_states(state)
    (1..9).each do |i|
      yield state + [i]
    end
  end
end


searcher = DfsKukuSearcher.new
searcher.search
p searcher.results
