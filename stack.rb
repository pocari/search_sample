class Stack
  def initialize
    @data = []
  end

  def push(e)
    @data.tap do |data|
      data.push(e)
    end
  end

  def pop
    # 最後にいれたやつを取り出す
    @data.pop
  end
  alias get pop

  def empty?
    @data.empty?
  end
end