class RepeatedSubstring
  def find_repeated_substring(string)
		n = string.length
		tab = Array.new(n) {Array.new(n,0)}
		maxval = 0
		maxpos = -1
    for i in 0..n
			for j in (i+1)..n
				if not string[i].eql? string[j]
					tab[i][j] = 0
					next
				end
				if i == 0 or j == 0
					prev = 0
				else
					prev = tab[i-1][j-1]
				end
				tmpmax = [prev+1, j-i].min
				tab[i][j] = tmpmax
				if (tmpmax > maxval)
					maxval = tmpmax
					maxpos = i
				end
			end
		end
		if maxval == 0
			return "NONE"
		else
			return string[maxpos+1, maxval]
		end
  end
end

#~ rs = RepeatedSubstring.new()
#~ puts rs.find_repeated_substring("banana")
