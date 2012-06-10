# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Complement do
  it 'renders pages and note' do
    Complement.new(pages: 4, note: 'Substitui a Ref. 6').to_s.
      should == ' 4 p. Substitui a Ref. 6.'
  end

  it 'renders URL' do
    Complement.new(url: 'http://abntex.codigolivre.org.br').to_s.
      should == ' Disponível em: <http://abntex.codigolivre.org.br>.'
  end
end
