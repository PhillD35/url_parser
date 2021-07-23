require 'rails_helper'

RSpec.describe LinksCreatorService do
  describe '.call' do
    subject { -> { described_class.call(text) } }

    before { expect(ImagesDownloaderService).to receive(:call) }

    context 'when text is nil' do
      let(:text) { nil }

      it { is_expected.not_to change(Link, :count) }
    end

    context 'when text is empty' do
      let(:text) { '' }

      it { is_expected.not_to change(Link, :count) }
    end

    context 'when text contains 2 new urls out of 2' do
      let(:text) do
        <<~TEXT
          https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/star-mort-rickturn-of-the-jerri-rick-and-morty-adult-swim-season-4-finale-1591004093.jpg
          https://pbs.twimg.com/media/E4lI4HaX0AQMCOw?format=jpg&name=small
          not an url
        TEXT
      end

      it { is_expected.to change(Link, :count).by(2) }
    end

    context 'when text contains 1 new url out of 2' do
      before { Link.create(url: 'https://pbs.twimg.com/media/E4lI4HaX0AQMCOw?format=jpg&name=small') }

      let(:text) do
        <<~TEXT
          https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/star-mort-rickturn-of-the-jerri-rick-and-morty-adult-swim-season-4-finale-1591004093.jpg
          https://pbs.twimg.com/media/E4lI4HaX0AQMCOw?format=jpg&name=small
          not an url
        TEXT
      end

      it { is_expected.to change(Link, :count).by(1) }
    end
  end
end
