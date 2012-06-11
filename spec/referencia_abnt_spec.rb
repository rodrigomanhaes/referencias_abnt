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

    it 'example 4' do
      ABNTReference.new(
        address: 'Rio de Janeiro',
        month: 'ago',
        note: 'Substitui a Ref. 5',
        organization: 'Associação Brasileira de Normas Técnicas',
        pages: 7,
        subtitle: 'Informação e documentação - Apresentação de citações em documentos',
        title: 'NBR 10520',
        year: 2000).to_s.should ==
      'ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. NBR 10520: Informação e documentação - Apresentação de citações em documentos. Rio de Janeiro, ago. 2000. 7 p. Substitui a Ref. 5.'
    end

    it 'example 5' do
      ABNTReference.new(
        address: 'Rio de Janeiro',
        month: 'jul',
        note: 'Substitui a Ref. 6',
        organization: 'Associação Brasileira de Normas Técnicas',
        pages: 4,
        subtitle: 'Informação e documentação - Apresentação de citações em documentos',
        title: 'NBR 10520',
        year: 2001).to_s.should ==
      'ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. NBR 10520: Informação e documentação - Apresentação de citações em documentos. Rio de Janeiro, jul. 2001. 4 p. Substitui a Ref. 6.'
    end

    it 'example 7' do
      ABNTReference.new(
        author: 'Gerald Weber',
        organization: 'Grupo abnTeX',
        subtitle: 'Questões específicas da "norma" 10520/2001',
        title: 'Estilo bibtex compatível com a "norma" 6023/2000 da ABNT',
        url: 'http://abntex.codigolivre.org.br',
        year: 2003).to_s.should ==
      'WEBER, G. Estilo bibtex compatível com a "norma" 6023/2000 da ABNT: Questões específicas da "norma" 10520/2001. [S.l.], 2003. Disponível em: <http://abntex.codigolivre.org.br>.'
    end

    it 'example 8' do
      ABNTReference.new(
        address: 'Niterói',
        author: 'Laura Graziela Figueiredo Fernandes Gomes',
        dimensions: '21 cm',
        isbn: '85-228-0268-8',
        note: 'Bibliografia: p. 131-132',
        number: 15,
        pages: 137,
        publisher: 'EdUFF',
        series: 'Coleção Antropologia e Ciência Política',
        title: 'Novela e Sociedade no Brasil',
        year: 1998).to_s.should ==
      'GOMES, L. G. F. F. Novela e Sociedade no Brasil. Niterói: EdUFF, 1998. 137 p., 21 cm. (Coleção Antropologia e Ciência Política, 15). Bibliografia: p. 131-132. ISBN 85-228-0268-8.'
    end
  end
end
