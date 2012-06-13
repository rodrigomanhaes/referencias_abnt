# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Collection do
  it 'renders suffix "In: " and editor as author and title' do
    Collection.new(editor: 'José das Couves', booktitle: 'A book',
                   booksubtitle: 'with subtitle').to_s.should ==
      ' In: COUVES, J. (Ed.). A book: with subtitle.'
  end

  it 'allows definition of editor acronym' do
    Collection.new(editor: 'José das Couves', booktitle: 'A book',
                   booksubtitle: 'with subtitle', editortype: 'Org.').to_s.
      should == ' In: COUVES, J. (Org.). A book: with subtitle.'
  end

  it 'renders nothing if editor, booktitle or booksubtitle is missing' do
    Collection.new(editor: 'José das Couves',
                   booksubtitle: 'with subtitle').to_s.should be_empty
    Collection.new(editor: 'José das Couves', booktitle: 'A book').to_s.
      should be_empty
    Collection.new(booktitle: 'A book',
                   booksubtitle: 'with subtitle', ).to_s.should be_empty
  end
end
