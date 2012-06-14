# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Title do
  it "simply returns title when there's no subtitle" do
    Title.new(title: 'A Privataria Tucana').to_s.should ==
      ' A Privataria Tucana.'
  end

  it 'returns title and subtitle, separated by :' do
    Title.new(title: 'Honoráveis Bandidos',
              subtitle: 'Um retrato do Brasil na era Sarney').to_s.should ==
      ' Honoráveis Bandidos: Um retrato do Brasil na era Sarney.'
  end

  it 'render nothing when omitted' do
    Title.new({}).to_s.should be_empty
  end

  context 'received a valid author' do
    it 'when provided, acts as default' do
      Title.new(title: 'Honoráveis Bandidos', author: stub(provided?: true)).
        to_s.should == ' Honoráveis Bandidos.'
    end

    it 'when not provided, renders itself in an author-like way' do
      Title.new(title: 'Honoráveis Bandidos', author: stub(provided?: false)).
        to_s.should == 'HONORÁVEIS Bandidos.'
    end
  end
end
