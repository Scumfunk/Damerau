require "Damerau/version"

module Damerau
  #Returns Damerau-Levinshtein distance between two strings
  #Usage: distance(string1,string2)

  def self.distance(a,b)
  	unless ((a.class.ancestors.include?(String)) and (b.class.ancestors.include?(String)))
  		raise "arguments must be String or child"
  	end
  	get_distance(a,b,a.size,b.size)
  end

  private

  #recursive function
  def self.get_distance (a, b, i, j)
  	if min(i,j) == 0
  	  max(i,j)
  	elsif ((i>1) and (j>1) and (at(a,i)==at(b,j-1)) and (at(a,i-1)==at(b,j)))
  	  min(get_distance(a,b,i-1,j)+1,
  	  	  get_distance(a,b,i,j-1)+1,
  	  	  get_distance(a,b,i-1,j-1)+ai_not_equal_bj_indicator(a,b,i,j),
  	  	  get_distance(a,b,i-2,j-2)+1)
  	else
	  min(get_distance(a,b,i-1,j)+1,
  	  	  get_distance(a,b,i,j-1)+1,
  	      get_distance(a,b,i-1,j-1)+ai_not_equal_bj_indicator(a,b,i,j))
  	end
  end

  #small hack: .at normalizes numeration in strings(from 0 in ruby, from 1 in algorythm)
  def self.at(arr,i)
  	arr[i-1]
  end

  def self.min (*argv)
  	argv.min
  end

  def self.max (*argv)
  	argv.max
  end

  def self.ai_not_equal_bj_indicator (a,b,i,j)
  	if at(a,i)==at(b,j)
  	  0
  	else
  	  1
  	end
  end
end