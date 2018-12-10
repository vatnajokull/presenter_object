RSpec.describe Author, type: :model do
  context 'fields' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:biography).of_type(:string) }
    it { is_expected.to have_db_column(:birth_date).of_type(:date) }
    it { is_expected.to have_db_column(:death_date).of_type(:date) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  context 'relations' do
    it { is_expected.to have_many(:books) }
    it { is_expected.to have_many(:images) }
  end
end
