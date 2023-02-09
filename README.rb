# 組み合わせの抽出と最短経路をサンプルに

- combination_recur.rb
  - 再帰で探索するパターン

- combination_use_stack.rb
  - 再帰を使わずにスタックを使って探索するパターン

- min_route_use_queue.rb
  - 最短経路問題を例に、キューを使って探査するパターン

- combination_use_searcher.rb
  - main_use_stackと同様の検索だが、検索処理自体はフレームワークとして提供し、組み合わせの抽出に必要な状態の定義、次の状態の生成などを切り出したパターン

- min_route_use_searcher.rb
  - 検索処理自体はフレームワークとして提供し、データ構造をQueueにすることで、グラフの最短経路を求めるパターン
