require_relative './searcher'
require_relative './stack'
require_relative './queue'

class DfsCombinationSearcher < Searcher
  attr_reader :results

  def initialize(ary, size)
    super(Stack.new)
    @results = []
    @ary = ary
    @size = size
  end

  def initialize_data
    # 状態の定義
    @data.push([
      # これまでに選択してきた要素の配列
      [],
      # これから使うことのできる要素の配列
      @ary.dup
    ])
  end

  def solved?(state)
    acc, _ = state
    acc.size == @size
  end

  def handle_solved(state)
    acc, _ = state
    @results << acc
    # 全部見つけるまで探し続けるのでfales
    false
  end

  def next_states(state)
    # 引数のstateから次に発生しうる状態を全部yieldする

    acc, ary = state

    return if ary.empty?

    # 先頭を使うパターン
    yield [
      acc + [ary[0]],
      ary[1..-1]
    ]

    # 先頭を使わないパターン
    yield [
      acc,
      ary[1..-1]
    ]
  end
end


searcher = DfsCombinationSearcher.new([1, 2, 3, 4, 5], 3)
if searcher.search
  p searcher.results
else
  p :not_found
end

