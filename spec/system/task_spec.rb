require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  describe '新規作成機能' do
    let!(:user) { FactoryBot.create(:user) }

    before do
      FactoryBot.create(:task, user_id: user.id )
      FactoryBot.create(:fourth_task, user_id: user.id )
      FactoryBot.create(:fifth_task, user_id: user.id )
      visit new_session_path
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_button 'ログイン'
    end

   context 'ユーザーがログインしている時' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[title]', with: "料理"
        fill_in 'task[content]', with: "カレー"
        select '2021', from: 'task_expired_at_1i'
        select '8月', from: 'task_expired_at_2i'
        select '30', from: 'task_expired_at_3i'
        select 'completed', from: 'task[status]'
        click_on '作成する'
        expect(page).to have_content '作成しました！'
        expect(page).to have_content "料理"
        expect(page).to have_content "カレー"
        expect(page).to have_content "2021-08-30 00:00:00 +0900"
        expect(page).to have_content "completed"
      end
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'トレーニング'
        expect(page).to have_content '勉強'
        expect(page).to have_content '散歩'
      end
       it 'タスクが作成日時の降順に並んでいる' do
         visit tasks_path
         expect(all('tr')[1].text).to have_content 'トレーニング'
         expect(all('tr')[2].text).to have_content '勉強'
         expect(all('tr')[3].text).to have_content '散歩'
       end
       it '任意のタスク詳細画面で該当タスクの内容が表示される' do
         visit tasks_path
         all('tr td')[5].click #allメソッドは引数に渡されたタグやclass, id値で一致する要素を全てとってきて配列に入れてくれる

         # visit task_path(task.id)
         expect(page).to have_content 'トレーニング'
         expect(page).to have_content 'タスク詳細'
         binding.irb
       end
    end
     context '終了期限でソートするボタンを押した場合' do
       it 'タスクが降順に並んでいる' do
         visit tasks_path
         binding.irb
         click_on '終了期限でソートする'#allメソッドは引数に渡されたタグやclass, id値で一致する要素を全てとってきて配列に入れてくれる
         expect(all('tr td')[0].text).to have_content 'トレーニング'
         expect(all('tr td')[8].text).to have_content '勉強'
         expect(all('tr td')[16].text).to have_content '散歩'
       end
     end
     context '優先度でソートするボタンを押した場合' do
       it 'タスクが優先度高い順に並んでいる' do
         visit tasks_path
         click_on '優先度でソートする'#allメソッドは引数に渡されたタグやclass, id値で一致する要素を全てとってきて配列に入れてくれる
         expect(all('tr td')[4].text).to have_content '高'
         expect(all('tr td')[12].text).to have_content '中'
         expect(all('tr td')[20].text).to have_content '低'
       end
     end
   end
   describe '検索機能' do
     context 'タイトルであいまい検索をした場合' do
       it "検索キーワードを含むタスクで絞り込まれる" do
         visit tasks_path
           fill_in 'title', with: "勉強"
           click_on '検索する'
         # タスクの検索欄に検索ワードを入力する (例: task)
         # 検索ボタンを押す
         expect(page).to have_content '勉強'
       end
     end
     context 'ステータス検索をした場合' do
       it "ステータスに完全一致するタスクが絞り込まれる" do
         visit tasks_path
            select 'completed', from: 'status'
            click_on '検索する'
         expect(page).to have_content 'completed'
       end
     end
     context 'タイトルのあいまい検索とステータス検索をした場合' do
       it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
         visit tasks_path
          fill_in 'title', with: "トレーニング"
          select 'working', from: 'status'
          click_on '検索する'
          expect(page).to have_content 'トレーニング'
          expect(page).to have_content 'working'
         # ここに実装する
       end
     end
   end
end
