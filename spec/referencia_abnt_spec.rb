# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ABNTReference do
  it 'generates using essential elements' do
    ABNTReference.new(
      author: 'Laura Graziela Figueiredo Fernandes Gomes',
      title: 'Novela e Sociedade no Brasil',
      address: 'Niterói',
      publisher: 'EdUFF',
      year: 1998).to_s.should ==
    'GOMES, L. G. F. F. Novela e Sociedade no Brasil. Niterói: EdUFF, 1998.'
  end

  it 'having a subtitle' do
    ABNTReference.new(
      author: 'Cláudio Pastro',
      title: 'Arte Sacra',
      subtitle: 'Espaço Sagrado Hoje',
      address: 'São Paulo',
      publisher: 'Loyola',
      year: 1993).to_s.should ==
    'PASTRO, C. Arte Sacra: Espaço sagrado hoje. São Paulo: Loyola, 1993.'
  end
end
