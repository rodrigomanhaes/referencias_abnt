# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Edition do
  it 'renders edition number' do
    Edition.new(edition: 6).to_s.should == ' 6. ed.'
  end

  it 'renders empty string if nothing is provided' do
    Edition.new.to_s.should == ''
  end

  it 'does not add "ed." when edition is not an integer number' do
    Edition.new(edition: 'Ed. fac-sim').to_s.should  == ' Ed. fac-sim.'
  end
end
