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

  it 'renders editor as author if provided' do
    Author.new(editor: 'José das Couves').to_s.should == 'COUVES, J. (Ed.).'
  end

  it 'renders nothing when neither author nor organization is provided' do
    Author.new.to_s.should be_empty
  end

  it 'checks if any author info was provided' do
    Author.new.should_not be_provided
    Author.new(author: 'Johnny').should be_provided
    Author.new(organization: 'codigolivre.org').should be_provided
    Author.new(author: 'Johnny', organization: 'codigolivre.org').
      should be_provided
  end

  it 'ignores name connectors' do
    Author.new(author: 'José das Couves').to_s.should == 'COUVES, J.'
    Author.new(author: 'Luis Alves de Lima e Silva').to_s.should ==
      'SILVA, L. A. L.'
    Author.new(author: 'Paulinho da Viola').to_s.should == 'VIOLA, P.'
    Author.new(author: 'Jacob do Bandolim').to_s.should == 'BANDOLIM, J.'
  end

  it 'renders organization in downcase starting from parenthesis' do
    Author.new(organization: 'São Paulo (Estado). Secretaria de Meio Ambiente').to_s.
      should == 'SÃO PAULO (Estado). Secretaria de Meio Ambiente.'
  end
end
