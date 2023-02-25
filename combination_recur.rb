def combination(ary, size, acc = [])
  if acc.size == size
    [acc]
  else
    return [] if ary.empty?
    # https://hiraocafe.com/note/combination.html
    # の 組合わせの性質2 をつかう

    # あるA(ここでは先頭のary[0])をとり、残りのn-1(==ary[1..-1)個のからR-1個選ぶ(accにary[0]を追加するので残りR-1個しか選べない)場合
    use_first = combination(ary[1..-1], size, acc + [ary[0]])

    # Aをとらず、残りのn-1(==ary[1..-1)個のからR個選ぶ(accがそのままなので残りR個選べる)場合
    unuse_first = combination(ary[1..-1], size, acc)

    # その和
    use_first + unuse_first
  end
end

p combination([1, 2, 3, 4, 5], 3)
