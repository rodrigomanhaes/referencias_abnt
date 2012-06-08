# encoding: utf-8

Gem::Specification.new do |s|
  s.name = 'referencia_abnt'
  s.version = File.read(File.join(File.dirname(__FILE__), 'VERSION'))
  s.date = %q{2012-06-08}
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.author = 'Rodrigo Manhães'
  s.description = 'Geração de referências bibliográficas ABNT.'
  s.email = 'rmanhaes@gmail.com'
  s.homepage = 'https://github.com/rodrigomanhaes/referencia_abnt'
  s.summary = 'Geração de referências bibliográficas ABNT com base no documento "Estilo bibtex compatível com as "normas" 6023 e 10520 da ABNT", versão 1.48.'

  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']

  s.files = Dir.glob('lib/**/*.rb') + %w(README.rdoc LICENSE.txt VERSION)
  s.add_development_dependency('rspec', '~> 2.10.0')
end
