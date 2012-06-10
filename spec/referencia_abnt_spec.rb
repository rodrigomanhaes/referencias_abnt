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
      subtitle: 'Espaço sagrado hoje',
      address: 'São Paulo',
      publisher: 'Loyola',
      year: 1993).to_s.should ==
    'PASTRO, C. Arte Sacra: Espaço sagrado hoje. São Paulo: Loyola, 1993.'
  end

  context 'examples from abntex book' do
    it 'example 2' do
      ABNTReference.new(
        address: 'Rio de Janeiro',
        month: 'ago',
        note: 'Substitui a Ref. 3',
        organization: 'Associação Brasileira de Normas Técnicas',
        pages: 24,
        subtitle: 'Informação e documentação - Referências - Elaboração',
        title: 'NBR 6023',
        year: 2002).to_s.should ==
      'ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. NBR 6023: Informação e documentação - Referências - Elaboração. Rio de Janeiro, ago. 2002. 24 p. Substitui a Ref. 3.'
    end

    it 'example 3' do
      ABNTReference.new(
        address: 'Rio de Janeiro',
        month: 'ago',
        organization: 'Associação Brasileira de Normas Técnicas',
        pages: 22,
        subtitle: 'Informação e documentação - Referências - Elaboração',
        title: 'NBR 6023',
        year: 2000).to_s.should ==
      'ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. NBR 6023: Informação e documentação - Referências - Elaboração. Rio de Janeiro, ago. 2000. 22 p.'
    end
  end
end
