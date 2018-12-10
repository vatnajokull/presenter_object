RSpec.describe Image, type: :model do
  context 'fields' do
    it { is_expected.to have_db_column(:file).of_type(:text) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  context 'relations' do
    it { is_expected.to belong_to(:author) }
  end
end
