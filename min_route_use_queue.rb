require 'set'
require './queue'
require './stack'

def min_route(graph, start, goal)
  results = []
  data = Queue.new
  visited = Set.new

  data.push([
    start,
    nil,
  ])
  visited.add(start)

  until data.empty?
    state = data.shift
    cur, _ = state
    if cur == goal
      return state
    else
      graph[cur].each do |next_node|
        unless visited.include?(next_node)
          data.push([
            next_node,
            state,
          ])
          visited.add(next_node)
        end
      end
    end
  end
  false
end

# 下記のような経路の0〜7までの最短経路を探す
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
results = min_route(graph, 0, 7)
if results
  p results
end
