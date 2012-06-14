# encoding: utf-8

require 'date'
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Complement do
  it 'renders pages and note' do
    Complement.new(pages: 4, note: 'Substitui a Ref. 6').to_s.
      should == ' 4 p. Substitui a Ref. 6.'
  end

  it 'renders pages with "p" as prefix when it is a range' do
    Complement.new(pages: '5-10').to_s.should == ' p. 5-10.'
  end

  it 'renders URL' do
    Complement.new(url: 'http://abntex.codigolivre.org.br').to_s.
      should == ' Disponível em: <http://abntex.codigolivre.org.br>.'
  end

  it 'renders URL with access date' do
    Complement.new(url: 'http://abntex.codigolivre.org.br',
      urlaccessdate: Date.new(2012, 04, 10)).to_s.
      should == ' Disponível em: <http://abntex.codigolivre.org.br>. Acesso em: 10 abr. 2012.'
  end

  it 'renders dimensions' do
    Complement.new(dimensions: '21 cm', note: 'Something here').to_s.should ==
      ' 21 cm. Something here.'
  end

  context 'renders illustrated information' do
    it 'with pages and dimensions' do
      Complement.new(pages: 3, illustrated: true, dimensions: '21 cm').to_s.
        should == ' 3 p., il., 21 cm.'
    end

    it 'without pages' do
      Complement.new(illustrated: true, dimensions: '21 cm').to_s.
        should == ' il., 21 cm.'
    end

    it 'without dimensions' do
      Complement.new(pages: 3, illustrated: true).to_s.should == ' 3 p., il.'
    end

    it 'only illustrated' do
      Complement.new(illustrated: true).to_s.
        should == ' il.'
    end
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

  it 'renders ISSN' do
    Complement.new(dimensions: '21 cm', note: 'Something here',
                   issn: '1234-123X').to_s.should ==
        ' 21 cm. Something here. ISSN 1234-123X.'
  end

  context 'type is provided (presumes thesis)' do
    let(:complement) do
      Complement.new(pages: 200, type: 'Doutorado em Física',
                     school: 'Universidade Federal Fluminense',
                     address: 'Niterói')
    end

    it 'page acronym is "f", not "p"' do
      complement.to_s.should =~ /200 f\./
    end

    it 'type is added to complement' do
      complement.to_s.should start_with ' 200 f. Tese (Doutorado em Física)'
    end

    it 'renders school and address' do
      complement.to_s.should end_with ' Tese (Doutorado em Física) - Universidade Federal Fluminense, Niterói.'
    end
  end

  it 'renders chapter' do
    Complement.new(chapter: 3, pages: 200).to_s.should == ' cap. 3, 200 p.'
  end

  it 'renders volume' do
    Complement.new(volume: 1).to_s.should == ' v. 1.'
  end
end
