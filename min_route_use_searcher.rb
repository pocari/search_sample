require 'set'

require_relative './searcher'
require_relative './stack'
require_relative './queue'

class MinRouteSearcher < Searcher
  attr_reader :results

  def initialize(graph, start, goal)
    super(Queue.new)
    @results = []
    @graph = graph
    @start = start
    @goal = goal
    @visited = Set.new
  end

  def initialize_data
    # 状態の定義
    @data.push([
      # 今いる場所
      @start,
      # この状態の元になった(一手前の)状態
      nil
    ])
    # startには行ったことがあるのでvisitedに入れておく
    @visited.add(@start)
  end

  def solved?(state)
    cur, _ = state
    cur == @goal
  end

  def handle_solved(state)
    @results = state
    # 1つ見つけたらOKなのでtrueを返す
    true
  end

  def next_states(state)
    cur, prev = state
    # 今の場所から次に進める場所のパターンを全部yieldする
    @graph[cur].each do |next_cur|
      unless @visited.include?(next_cur)
        # 言ったことがない場所なら行く
        yield [next_cur, state]
        @visited.add(next_cur)
      end
    end
  end
end


# 下記のような経路の0〜6までの最短経路を探す
#            0
#           /|\
#          / | \
#         1--3--2
#           / \
#          5---4
#           \  |
#            6 |
#             \|
#              7
# 上記のグラフを隣接リストで表現する
graph = [
  [1, 2, 3],       # 0
  [0, 3],          # 1
  [0, 3],          # 2
  [0, 1, 2, 4, 5], # 3
  [3, 5, 7],       # 4
  [4, 6],          # 5
  [5, 7],          # 6
  [4, 6],          # 7
]
searcher = MinRouteSearcher.new(graph, 0, 7)
if searcher.search
  p searcher.results
else
  p :not_found
end

