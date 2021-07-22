require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  before do
    FactoryBot.create(:task)
    FactoryBot.create(:fourth_task)
    FactoryBot.create(:fifth_task)
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[title]', with: "test_title"
        fill_in 'task[content]', with: "test_content"
        # fill_in 'title', with: 'test_task2'
        # fill_in 'content', with: 'test_content2'
        click_on '作成する'
        expect(page).to have_content '作成しました！'
        expect(page).to have_content "test_title"
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'test_title'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
       it '新しいタスクが一番上に表示される' do
         # ここに実装する
         visit tasks_path
         test = all('tr')[1]
         test2 = all('tr')[2]
         test3 = all('tr')[3]
         expect(test).to have_content 'test_title5'
         expect(test2).to have_content 'test_title4'
         expect(test3).to have_content 'test_title'
       end
     end
   end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         visit tasks_path
         all('tr td')[2].click #allメソッドは引数に渡されたタグやclass, id値で一致する要素を全てとってきて配列に入れてくれる

         # visit task_path(task.id)
         expect(page).to have_content 'test_title'
         expect(page).to have_content 'タスク詳細'
       end
     end
  end
end
