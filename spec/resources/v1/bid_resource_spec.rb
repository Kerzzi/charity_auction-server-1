module V1
  RSpec.describe BidResource do

    let :creatable_fields do
      [
        :auction_item,
        :bidder,
        :amount,
        :winner,
      ].sort
    end

    subject do
      described_class.new Bid.new, {}
    end

    it "has the correct creatable fields" do
      expect(described_class.creatable_fields({}).sort).to eq creatable_fields
    end

    it "has the correct updatable fields" do
      expect(described_class.updatable_fields({}).sort).to eq creatable_fields
    end

    it "has the correct fetchable fields" do
      expect(subject.fetchable_fields.sort).to eq (creatable_fields + [:id, :created_at, :updated_at, :bid_payments, :balance]).sort
    end
  end
end
