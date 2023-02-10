class Queue
  def initialize
    @data = []
  end

  def push(e)
    @data.tap do |data|
      data.push(e)
    end
  end

  def shift
    # 最初にいれたやつを取り出す
    @data.shift
  end

  alias get shift

  def empty?
    @data.empty?
  end
end
