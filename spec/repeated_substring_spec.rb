# encoding: UTF-8

require 'spec_helper'
require 'repeated_substring'

RSpec.describe 'repeated_substring' do
  it 'empty string' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('')).to eq('NONE')
  end
  it 'single character' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('a')).to eq('NONE')
  end
  it 'consume complete string' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('twintwin')).to eq('twin')
  end
  it 'overlapping substring' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('banana')).to eq('an')
  end
  it 'no repeated substring' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('abcdefg')).to eq('NONE')
  end
  it 'reject single spaces' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('am so uniqe')).to eq('NONE')
  end
  it 'substring contains spaces' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('aaa bbb ccc aaa bbb ddd')).to eq('aaa bbb ')
  end
  it 'multiple candidates take first' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('aaaXbbbaaaYbbb')).to eq('aaa')
  end
  it 'multiple candidates take longest' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('aaaXbbbb aaaYbbbb')).to eq('bbbb')
  end
  it 'special chars' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('äöü äöü')).to eq('äöü')
  end
  it 'special chars multiple candidates' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('aaa äöü aaa äöü')).to eq('aaa')
  end
  
end
