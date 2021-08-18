require 'rails_helper'
RSpec.describe 'ユーザーや登録画面のテスト', type: :system do

  describe '新規登録' do
    context 'ユーザーを新規作成した場合' do

      before do
        @user = FactoryBot.create(:user)
      end

      it '登録したユーザーが表示' do
        visit new_user_path
        fill_in 'user[name]', with: @user.name
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        binding.irb
        fill_in 'user[password_confirmation]', with: @user.password_confirmation
        click_on '作成する'
        expect(page).to have_content 'general_user@example.com'
      end
    end
  end
end
