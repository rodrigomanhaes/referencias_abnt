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

  it 'renders nothing if booktitle is missing' do
    Collection.new(editor: 'José das Couves',
                   booksubtitle: 'with subtitle').to_s.should be_empty
  end

  context 'editor is not provided' do
    it 'assumes author and editor are the same if author is provided' do
      Collection.new(booktitle: 'A book', work_author: stub(provided?: true)).
        to_s.should == ' In: ______. A book.'
      Collection.new(booktitle: 'A book', booksubtitle: 'with subtitle',
        work_author: stub(provided?: true)).to_s.should ==
        ' In: ______. A book: with subtitle.'
    end

    it 'behaves like when there is no author if author is not provided' do
      Collection.new(booktitle: 'Crazy book',
                     work_author: stub(provided?: false)).to_s.should ==
        ' In: CRAZY book.'
    end
  end
end
