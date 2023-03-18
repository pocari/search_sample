require 'set'

require_relative './searcher'
require_relative './stack'
require_relative './queue'

class Tubo2 < Searcher
  attr_reader :results

  def initialize(tubo, start, goal)
    super(Queue.new)
    @results = []
    @tubo = tubo
    @start = start
    @goal = goal
    @visited = Set.new
  end

  def initialize_data
    # 状態の定義
    @data.push([
      # 今の各ツボの状態
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
    cur, _ = state
    # 今の場所から次に進める場所のパターンを全部yieldする
    cur.size.times do |i|
      # 各ツボの油が入っていれば、違うツボに移すパターンを探す
      if cur[i] > 0
        cur.size.times do |j|
          next if i == j # 自分以外のツボだけ対象にする
          next if cur[j] == @tubo[j] # 油が満杯のツボは対象外

          # 油を移す
          next_cur = cur.dup
          from = next_cur[i]
          to = next_cur[j]

          # 移動先のツボに入れられる最大の油の容量
          enable_val = @tubo[j] - to
          # 実際に移動できる油の量
          real_val = enable_val <= from ? enable_val : from
          next_cur[i] -= real_val
          next_cur[j] += real_val

          # 既に訪れたことがある状態は探索しない
          unless @visited.include?(next_cur)
            @visited.add(next_cur)
            yield [next_cur, state]
          end
        end
      end
    end
  end
end

# https://nazesuugaku.com/questionsaburawakezan/

# 問題2
searcher = Tubo2.new([3, 7, 10], [0, 0, 10], [0, 5, 5])
if searcher.search
  p searcher.results
else
  p :not_found
end

# 問題3
searcher = Tubo2.new([7, 13, 19], [7, 13, 0], [0, 10, 10])
if searcher.search
  p searcher.results
else
  p :not_found
end
