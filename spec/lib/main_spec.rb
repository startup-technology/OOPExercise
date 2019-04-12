require './spec/spec_helper'
require './lib/main'

class MockInput
  attr_accessor :ss
  def initialize(ss)
    self.ss = ss
  end

  def gets
    @ss.shift
  end
end

class MockOutput
  attr_accessor :ss
  def initialize
    self.ss = []
  end

  def puts(str)
    ss.push str
  end
end

RSpec.describe Main do
  describe '#main' do
    let(:master) {
      Class.new do
        extend Main
      end
    }

    let(:mock_input_strings) {[
      '500 COKE'
    ]}

    let(:mock_input) { MockInput.new(mock_input_strings) }
    let(:mock_output) { MockOutput.new }

    subject { master.main(mock_input, mock_output) }


    it 'gets a coke' do
      is_expected.to be_truthy
      expect(mock_output.ss).to eq %w[コーラを購入しました おつりは400円です]
    end

    context 'some times' do
      let(:mock_input_strings) {[
        '500 COKE', '100 COKE', '100 COKE', '100 COKE', '100 COKE',
        '500 TEA', '100 TEA', '100 TEA', '100 TEA', '100 TEA',
        '500 DIET_COKE', '100 DIET_COKE', '100 DIET_COKE', '100 DIET_COKE', '100 DIET_COKE'
      ]}

      it 'gets some drink' do
        is_expected.to be_truthy
        expect(mock_output.ss).to eq %w[
          コーラを購入しました おつりは400円です
          コーラを購入しました おつりは0円です
          コーラを購入しました おつりは0円です
          コーラを購入しました おつりは0円です
          コーラを購入しました おつりは0円です
          お茶を購入しました おつりは400円です
          お茶を購入しました おつりは0円です
          お茶を購入しました おつりは0円です
          お茶を購入しました おつりは0円です
          お茶を購入しました おつりは0円です
          ダイエットコーラを購入しました おつりは400円です
          ダイエットコーラを購入しました おつりは0円です
          ダイエットコーラを購入しました おつりは0円です
          ダイエットコーラを購入しました おつりは0円です
          ダイエットコーラを購入しました おつりは0円です ]
      end
    end

    context 'when empty coins in vending machine' do
      let(:mock_input_strings) {[
        '500 COKE', '500 TEA', '500 COKE'
      ]}

      it 'gets 2 coke and exception' do
        expect { subject }.to raise_error Main::MyError
        expect(mock_output.ss).to eq %w[
          コーラを購入しました おつりは400円です
          お茶を購入しました おつりは400円です]
      end
    end

    context 'when empty coke in vending machine' do
      let(:mock_input_strings) {[
        '100 COKE', '100 COKE', '100 COKE', '100 COKE', '100 COKE', '100 COKE'
      ]}

      it 'gets 5 coke and exception' do
        expect { subject }.to raise_error Main::MyError
        expect(mock_output.ss).to eq %w[
          コーラを購入しました おつりは0円です
          コーラを購入しました おつりは0円です
          コーラを購入しました おつりは0円です
          コーラを購入しました おつりは0円です
          コーラを購入しました おつりは0円です ]
      end
    end

    context 'when empty tea in vending machine' do
      let(:mock_input_strings) {[
        '100 TEA', '100 TEA', '100 TEA', '100 TEA', '100 TEA', '100 TEA'
      ]}

      it 'gets 5 tea and exception' do
        expect { subject }.to raise_error Main::MyError
        expect(mock_output.ss).to eq %w[
          お茶を購入しました おつりは0円です
          お茶を購入しました おつりは0円です
          お茶を購入しました おつりは0円です
          お茶を購入しました おつりは0円です
          お茶を購入しました おつりは0円です ]
      end
    end

    context 'when empty diet coke in vending machine' do
      let(:mock_input_strings) {[
        '100 DIET_COKE', '100 DIET_COKE', '100 DIET_COKE', '100 DIET_COKE', '100 DIET_COKE', '100 DIET_COKE'
      ]}

      it 'gets 5 coke and exception' do
        expect { subject }.to raise_error Main::MyError
        expect(mock_output.ss).to eq %w[
          ダイエットコーラを購入しました おつりは0円です
          ダイエットコーラを購入しました おつりは0円です
          ダイエットコーラを購入しました おつりは0円です
          ダイエットコーラを購入しました おつりは0円です
          ダイエットコーラを購入しました おつりは0円です ]
      end
    end

    context 'when coin is not 100 or 500' do
      let(:mock_input_strings) {[
        '150 COKE'
      ]}

      it 'raise exception' do
        expect { subject }.to raise_error Main::MyError
      end
    end

    context 'when drink is not COKE or DIET_COKE or TEA' do
      let(:mock_input_strings) {[
        '100 MyError',
        '500 DIET_COKE'
      ]}

      it 'say input format and gets a diet coke' do
        is_expected.to be_truthy
        expect(mock_output.ss).to eq [
                                       '`100 COKE`の形で入力してください',
                                       'ダイエットコーラを購入しました', 'おつりは400円です']
      end
    end

    context 'when cant purse input' do
      let(:mock_input_strings) {[
        'コーラほしいよ',
        '500 COKE'
      ]}

      it 'say input format and gets a coke' do
        is_expected.to be_truthy
        expect(mock_output.ss).to eq [
          '`100 COKE`の形で入力してください',
          'コーラを購入しました', 'おつりは400円です']
      end
    end
  end
end
