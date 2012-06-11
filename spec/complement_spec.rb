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

  it 'renders dimensions' do
    Complement.new(dimensions: '21 cm', note: 'Something here').to_s.should ==
      ' 21 cm. Something here.'
  end

  context 'renders series' do
    it 'without number' do
      Complement.new(dimensions: '21 cm', note: 'Something here',
                     series: 'Coleção Vaga-Lume').to_s.should ==
        ' 21 cm. (Coleção Vaga-Lume). Something here.'
    end

    it 'with number' do
      Complement.new(dimensions: '21 cm', note: 'Something here',
                     series: 'Coleção Vaga-Lume', number: 20).to_s.should ==
        ' 21 cm. (Coleção Vaga-Lume, 20). Something here.'
    end
  end

  it 'renders ISBN' do
    Complement.new(dimensions: '21 cm', note: 'Something here',
                   series: 'Coleção Vaga-Lume', number: 20,
                   isbn: '85-228-0268-8').to_s.should ==
        ' 21 cm. (Coleção Vaga-Lume, 20). Something here. ISBN 85-228-0268-8.'
  end
end
