require 'rails_helper'

RSpec.describe Gear, type: :model do
  describe "Gear" do

    it "ブランド名、アイテム名、ギアタイプがあれば有効な状態であること" do
      gear = build(:gear)
      expect(gear).to be_valid
    end

    it "brandがない場合は無効な状態であること" do
        gear = build(:gear)
        gear.brand = nil
        gear.valid?
        expect(gear.errors[:brand]).to include("can't be blank")
    end

    it "アイテム名がない場合は無効な状態であること" do
        gear = build(:gear)
        gear.name = nil
        gear.valid?
        expect(gear.errors[:name]).to include("can't be blank")
    end

    # it "ギアタイプがない場合は無効な状態であること" do
    #     gear = build(:gear)
    #     gear.gear_type = nil
    #     gear.valid?
    #     expect(gear.errors[:gear_type]).to include("を入力してください")
    # end

  end
end
