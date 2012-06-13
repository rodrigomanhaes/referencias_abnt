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

    it 'example 9' do
      ABNTReference.new(
        address: 'São Paulo',
        edition: 6,
        dimensions: '28 cm',
        isbn: '85-7285-026-0',
        note: 'Inclui índice',
        pages: 317,
        publisher: 'FUNDAP',
        title: 'Perfil da Administração Pública Paulista',
        year: 1994).to_s.should ==
      'PERFIL da Administração Pública Paulista. 6. ed. São Paulo: FUNDAP, 1994. 317 p., 28 cm. Inclui índice. ISBN 85-7285-026-0.'
    end

    it 'example 11 (introducing thesis)' do
      ABNTReference.new(
        address: 'Campinas',
        author: 'Maria de Fatima Piccolo Barcelos',
        pages: 160,
        school: 'Faculdade de Engenharia de Alimentos, Universidade Estadual de Campinas',
        title: 'Ensaio tecnológico, bioquímico e sensorial de soja e gandu enlatados no estágio verde e maturação de colheita',
        type: 'Doutorado em Nutrição',
        year: 1998).to_s.should ==
      'BARCELOS, M. F. P. Ensaio tecnológico, bioquímico e sensorial de soja e gandu enlatados no estágio verde e maturação de colheita. 1998. 160 f. Tese (Doutorado em Nutrição) - Faculdade de Engenharia de Alimentos, Universidade Estadual de Campinas, Campinas.'
    end

    it 'example 13' do
      ABNTReference.new(
        address: 'Brasília, DF',
        edition: 2,
        organization: 'IBICT',
        pages: 41,
        title: 'Manual de normas de editoração do IBICT',
        year: 1993).to_s.should ==
      'IBICT. Manual de normas de editoração do IBICT. 2. ed. Brasília, DF, 1993. 41 p.'
    end

    it 'example 14' do
      ABNTReference.new(
        address: 'São Paulo',
        editor: 'Antonio Houaiss',
        furtherresp: 'Co-editor Ismael Cardim',
        note: 'Edição exclusiva para o assinante da Folha de S. Paulo',
        publisher: 'Folha da Manhã',
        subtitle: 'inglês/português, português/inglês',
        title: "Novo dicionário Folha Webster's",
        year: 1996).to_s.should ==
      "HOUAISS, A. (Ed.). Novo dicionário Folha Webster's: inglês/português, português/inglês. Co-editor Ismael Cardim. São Paulo: Folha da Manhã, 1996. Edição exclusiva para o assinante da Folha de S. Paulo."
    end

    it 'example 15' do
      ABNTReference.new(
        address: 'São Paulo',
        illustrated: true,
        note: 'Inclui mapa rodoviário',
        pages: 319,
        publisher: 'Folha da Manhã',
        series: 'Roteiros turísticos Fiat',
        title: "Brasil: roteiros turísticos",
        year: 1995).to_s.should ==
      'BRASIL: roteiros turísticos. São Paulo: Folha da Manhã, 1995. 319 p., il. (Roteiros turísticos Fiat). Inclui mapa rodoviário.'
    end

    it 'example 16' do
      ABNTReference.new(
        address: 'São Paulo',
        organization: 'São Paulo (Estado). Secretaria do Meio Ambiente. Coordenadoria de Planejamento Ambiental',
        pages: 48,
        series: 'Série Manuais',
        subtitle: "manual de orientação",
        title: 'Estudo de impacto ambiental - EIA, Relatório de Impacto ambiental - RIMA',
        year: 1989).to_s.should ==
      'SÃO PAULO (Estado). Secretaria do Meio Ambiente. Coordenadoria de Planejamento Ambiental. Estudo de impacto ambiental - EIA, Relatório de Impacto ambiental - RIMA: manual de orientação. São Paulo, 1989. 48 p. (Série Manuais).'
    end

    it 'example 17' do
      ABNTReference.new(
        address: 'São Paulo',
        organization: 'Museu da Imigração (São Paulo, SP)',
        pages: 16,
        subtitle: "catálogo",
        title: 'Museu da Imigração - S. Paulo',
        year: 1997).to_s.should ==
      'MUSEU DA IMIGRAÇÃO (São Paulo, SP). Museu da Imigração - S. Paulo: catálogo. São Paulo, 1997. 16 p.'
    end

    it 'example 18' do
      ABNTReference.new(
        note: '1 folder. Apoio Ministério da Cultura: Lei Federal de Incentivo à Cultura',
        organization: 'Instituto Moreira Salles',
        subtitle: "fotografias: de 26 de abril a 3 de agosto de 1997, Casa da cultura de Poços de Caldas, MG",
        title: 'São Paulo de Vincenzo Pastore',
        year: 1997).to_s.should ==
      'INSTITUTO MOREIRA SALLES. São Paulo de Vincenzo Pastore: fotografias: de 26 de abril a 3 de agosto de 1997, Casa da cultura de Poços de Caldas, MG. [S.l.], 1997. 1 folder. Apoio Ministério da Cultura: Lei Federal de Incentivo à Cultura.'
    end

    it 'example 19 (introduces support to non-numeric edition)' do
      ABNTReference.new(
        address: 'São Paulo',
        author: 'M. Torelly',
        edition: 'Ed. fac-sim',
        note: 'Contém iconografia e depoimentos sobre o autor',
        publisher: 'Studioma: Arquivo do Estado',
        series: 'Coleção Almanaques do Barão de Itararé',
        subtitle: 'primeiro semestre ou Almanaque d\'A Manhã',
        title: 'Almanaque para 1949',
        year: 1991).to_s.should ==
      'TORELLY, M. Almanaque para 1949: primeiro semestre ou Almanaque d\'A Manhã. Ed. fac-sim. São Paulo: Studioma: Arquivo do Estado, 1991. (Coleção Almanaques do Barão de Itararé). Contém iconografia e depoimentos sobre o autor.'
    end

    it 'example 20 (introduces part of publication and many authors)' do
      ABNTReference.new(
        address: 'São Paulo',
        author: 'G. Romano',
        booktitle: 'História dos jovens 2',
        booksubtitle: 'a época contemporânea',
        editor: 'G. Levi; J. Schmidt',
        editortype: 'Org.',
        pages: '7-16',
        publisher: 'Companhia das Letras',
        title: 'Imagens da juventude na era moderna',
        year: 1996).to_s.should ==
      'ROMANO, G. Imagens da juventude na era moderna. In: LEVI, G.; SCHMIDT, J. (Org.). História dos jovens 2: a época contemporânea. São Paulo: Companhia das Letras, 1996. p. 7-16.'
    end

    it 'example 21 (introduces underlines for the same author in chapter and collection)' do
      ABNTReference.new(
        address: 'Macapá',
        author: 'Fernando Rodrigues dos Santos',
        booktitle: 'História do Amapá, 1º grau',
        chapter: 3,
        edition: 2,
        pages: '15-24',
        publisher: 'Valcan',
        title: 'A colonização da terra dos Tucujús',
        year: 1994).to_s.should ==
      'SANTOS, F. R. A colonização da terra dos Tucujús. In: ______. História do Amapá, 1º grau. 2. ed. Macapá: Valcan, 1994. cap. 3, p. 15-24.'
    end
  end
end
