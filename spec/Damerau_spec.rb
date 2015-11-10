require 'spec_helper'

describe Damerau do
  it 'has a version number' do
    expect(Damerau::VERSION).not_to be nil
  end

   it 'should raise an exeprion when arguments is not String objects' do
    expect{Damerau.distance(1, 0.5)}.to raise_error()
  end

  it '.distance(a,b) should return distance between a and b' do
    Damerau.methods.include?(:distance).should eq(true)
  end

  it 'should calculate insertions/delitions correctly' do
  	string1 = ('a'..'f').to_a.join
  	string2 = 'a'
  	Damerau.distance(string1,string2).should eq(string1.size-1)
  end

  it 'should calculate replacements correctly' do
  	string1 = ('a'..'f').to_a.join
  	string2 = ('g'..'l').to_a.join
  	Damerau.distance(string1,string2).should eq(string1.size)
  end

  it 'should calculate swaps correctly' do
  	string1 = 'af'
  	string2 = 'fa'
  	Damerau.distance(string1,string2).should eq(1)
  end

  it '.min(*argv) should return min from arguments array' do
  	Damerau.min(1,2,3,4,5,6,7,8,9,0).should eq(0)
  end

  it '.max(*argv) should return max from arguments array' do
  	Damerau.max(1,2,3,4,5,6,7,8,9,0).should eq(9)
  end

  it '.ai_not_equal_bj_indicator(string1,string2,i,j) should return 0 or 1' do
  	Damerau.ai_not_equal_bj_indicator('ab','fb',2,2).should eq(0)
  	Damerau.ai_not_equal_bj_indicator('ab','fb',2,1).should eq(1)
  end

  it '.get_distance(string1,string2,i,j) should return distance' do
  	Damerau.get_distance('afafaf','fafafa',6,6).should eq(2)
  end
end
