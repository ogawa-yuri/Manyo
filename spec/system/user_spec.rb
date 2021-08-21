require 'rails_helper'
RSpec.describe 'ユーザーや登録画面のテスト', type: :system do

  describe 'ユーザーのテスト' do
    context 'ユーザーを新規作成した場合' do

      before do
        @user = FactoryBot.build(:user)
      end

      it '登録したユーザーが表示' do
        visit new_user_path
        fill_in 'user[name]', with: @user.name
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        fill_in 'user[password_confirmation]', with: @user.password_confirmation
        click_on '作成する'
        expect(page).to have_content 'general_user@example.com'
        end
      end
    end

    context 'ユーザーがログインせずタスク一覧に飛ぼうとした場合' do
      it 'ログイン画面に遷移する' do
        visit tasks_path
        expect(page).to have_content 'ログイン'
      end
    end

  describe 'セッション機能のテスト' do
    before do
      @user = FactoryBot.create(:user)
      visit new_session_path
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: @user.password
      click_button 'ログイン'
      @admin_user = FactoryBot.create(:admin_user)
    end
    context 'ログイン後' do
      it '自分の詳細画面に遷移できる' do
        visit user_path(@user)
        expect(page).to have_content 'general_user@example.com'
      end
      it '他の人の詳細画面に飛べない' do
        visit user_path(@admin_user)
        expect(page).to have_content 'タスク一覧'
      end
      it 'ログアウトができる' do
        visit tasks_path
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
    end
    describe '管理画面のテスト' do
      context '管理ユーザーはログイン後' do
        before do
          # @admin_user = FactoryBot.create(:admin_user)
          visit new_session_path
          fill_in 'session[email]', with: @admin_user.email
          fill_in 'session[password]', with: @admin_user.password
          click_button 'ログイン'
          # @user = FactoryBot.create(:user)
        end
        it '管理画面に遷移できる' do
          visit admin_users_path
          expect(page).to have_content '登録済みのユーザー一覧'
        end
        it 'ユーザーの新規登録ができる' do
          visit admin_users_path
          click_link 'ユーザーを作成する'
          fill_in 'user[name]', with: "sample"
          fill_in 'user[email]', with: "sample@example.com"
          fill_in 'user[password]', with: "11111111"
          fill_in 'user[password_confirmation]', with: "11111111"
          click_on '作成する'
          expect(page).to have_content 'ユーザーを登録しました'
        end
        it 'ユーザーの詳細画面に遷移できる' do
          visit admin_users_path
          all('tr td')[5].click
          binding.irb
          expect(page).to have_content "admin_test@example.com"
        end
        it 'ユーザーの編集画面からユーザーを編集できる' do
          visit admin_users_path
          all('tr td')[6].click
          fill_in 'user[email]', with: "sample2@example.com"
          fill_in 'user[password]', with: "11111111"
          fill_in 'user[password_confirmation]', with: "11111111"
          click_on '更新する'
          expect(page).to have_content 'sample2@example.com'
        end
        it 'ユーザーを削除できる' do
          visit admin_users_path
          all('tr td')[15].click
          expect(page).to have_content 'ユーザーを削除しました'
        end
      end
      context '一般ユーザーはログイン後' do
        it '管理画面には移動できない' do
          visit new_session_path
          fill_in 'session[email]', with: @user.email
          fill_in 'session[password]', with: @user.password
          click_button 'ログイン'
          visit admin_users_path
          binding.irb
          expect(page).to have_content '管理者以外はアクセスできません'
        end
      end
    end
  end
end
