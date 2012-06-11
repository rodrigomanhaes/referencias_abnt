# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Title do
  it "simply returns title when there's no subtitle" do
    Title.new('A Privataria Tucana').to_s.should == ' A Privataria Tucana.'
  end

  it 'returns title and subtitle, separated by :' do
    Title.new(
      'Honoráveis Bandidos', 'Um retrato do Brasil na era Sarney').to_s.should ==
      ' Honoráveis Bandidos: Um retrato do Brasil na era Sarney.'
  end
end
