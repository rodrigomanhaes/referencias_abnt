# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe PublicationInfo do
  it 'renders address, publisher and year' do
    PublicationInfo.new(address: 'Niterói', publisher: 'EdUFF', year: 1998).
      to_s.should == ' Niterói: EdUFF, 1998.'
  end

  it "renders month if provided" do
    PublicationInfo.new(address: 'Niterói', publisher: 'EdUFF', year: 1998,
      month: 'ago').to_s.should == ' Niterói: EdUFF, ago. 1998.'
  end

  it 'works when no publisher is provided' do
    PublicationInfo.new(address: 'Niterói', year: 1998, month: 'ago').to_s.
      should == ' Niterói, ago. 1998.'
  end

  it 'renders "[S.l.]" when no address is provided' do
    PublicationInfo.new(year: 1998).to_s.should == ' [S.l.], 1998.'
  end

  it 'renders furtherresp' do
    PublicationInfo.new(address: 'Niterói', publisher: 'EdUFF', year: 1998,
      furtherresp: 'Co-editor José das Couves').to_s.should ==
      ' Co-editor José das Couves. Niterói: EdUFF, 1998.'
  end

  context 'type is provided (presumes thesis)' do
    it 'address is not rendered' do
      PublicationInfo.new(type: 'Doutorado em Física', address: 'Niterói',
                          year: 2000).to_s.should == ' 2000.'
    end
  end
end
