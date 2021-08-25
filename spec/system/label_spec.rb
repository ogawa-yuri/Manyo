require 'rails_helper'
RSpec.describe 'ラベル検索機能', type: :system do

  describe 'ラベル検索機能' do
    let!(:user) { FactoryBot.create(:user) }

    before do
      FactoryBot.create(:task, user_id: user.id )
      # FactoryBot.create(:second_task, user_id: user.id )
      # FactoryBot.create(:fourth_task, user_id: user.id )
      # FactoryBot.create(:fifth_task, user_id: user.id )
      visit new_session_path
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_button 'ログイン'
    end

   describe '新規タスクでのラベル作成' do
     context 'タスクの新規作成時に複数のラベルを登録した場合' do
       it 'スク一覧詳細画面に登録したラベルが表示される' do
         visit new_task_path
         fill_in 'task[title]', with: "料理"
         fill_in 'task[content]', with: "カレー"
         select '2021', from: 'task_expired_at_1i'
         select '8月', from: 'task_expired_at_2i'
         select '30', from: 'task_expired_at_3i'
         select 'completed', from: 'task[status]'
         check 'task_label_ids_1'
         check 'task_label_ids_2'
         click_on '作成する'
         all('tr td')[5].click
         expect(page).to have_content 'リフレッシュ'
         expect(page).to have_content '勉強'
        end
      end
    end
    describe 'ラベル検索機能' do
      context 'ラベル名で検索した場合' do
        it '結果が正しく表示される' do
          visit new_task_path
          fill_in 'task[title]', with: "料理"
          fill_in 'task[content]', with: "カレー"
          select '2021', from: 'task_expired_at_1i'
          select '8月', from: 'task_expired_at_2i'
          select '30', from: 'task_expired_at_3i'
          select 'completed', from: 'task[status]'
          check 'task_label_ids_1'
          check 'task_label_ids_2'
          click_on '作成する'
          find("option[value='2']").select_option
          click_on '検索する'
          expect(page).to have_content '料理'
          expect(page).to have_content 'カレー'
         end
       end
     end
  end
end
