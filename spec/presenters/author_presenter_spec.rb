RSpec.describe AuthorPresenter do
  let(:author) { build(:author) }
  subject(:presenter) { AuthorPresenter.new(author) }

  describe 'full_name' do
    let(:author) { build(:author, first_name: 'John', last_name: 'Doe') }
    it "returns author's full name" do
      expect(presenter.full_name).to eq('John Doe')
    end
  end

  describe 'formatted_period_of_life' do
    context 'with death_date' do
      let(:author) { build(:author, birth_date: Time.new(1903, 6, 25),  death_date: Time.new(1950, 1, 21)) }

      it "returns formatted string with period of authors's life" do
        expect(presenter.formatted_period_of_life).to eq('25 June 1903 - 21 January 1950')
      end
    end

    context 'without death_date' do
      date_birth = Time.new(1903, 6, 25)
      let(:author) { build(:author, birth_date: date_birth) }

      it "returns formatted string with date of author's birth date" do
        expect(presenter.formatted_period_of_life).to eq("was born on 25 June 1903")
      end
    end
  end

  describe 'bestseller_badge' do
    it 'returns badge about bestseller status' do
      allow(author).to receive(:bestseller?) { true }

      expect(presenter.bestseller_badge).to eq("<span class=\"badge badge-secondary\">BESTSELLER</span>")
    end
  end

  describe 'main_photo' do
    let(:author) { create(:author, :with_images, count: 2) }

    it "returns url if first image from author's gallery" do
      expect(presenter.main_photo_url).to eq(Image.first.file_url)
    end
  end

  describe 'short_biography' do
    it "shows short version of author's biography" do
      expect(presenter.short_biography.length).to be <= 120
    end
  end
end
