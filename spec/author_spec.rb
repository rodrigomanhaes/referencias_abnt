# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Author do
  it 'puts name in reference form' do
    Author.new(author: 'Laura Graziela Figueiredo Fernandes Gomes').to_s.
      should == 'GOMES, L. G. F. F.'
  end

  it 'when author is omitted, shows organization as author' do
    Author.new(organization: 'Associação Brasileira de Normas Técnicas').to_s.
      should == 'ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS.'
  end

  it 'having author and organizations, author is the author' do
    Author.new(author: 'José Couves', organization: 'Anything').to_s.
      should == 'COUVES, J.'
  end
end
