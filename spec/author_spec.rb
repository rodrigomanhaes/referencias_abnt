require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Author do
  it 'puts name in reference form' do
    Author.new('Laura Graziela Figueiredo Fernandes Gomes').to_s.
      should == 'GOMES, L. G. F. F.'
  end
end
