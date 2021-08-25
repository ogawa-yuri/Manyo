FactoryBot.define do
  factory :labeling do
    task
    label 
  end
end

# labeling = FactoryBot.build(:labeling)
# labeling.task == Task.new()
# labeling.label == Label.new
#
# labeling1 = FactoryBot.create(:labeling)
#
# task = FactoryBot.build(:task)
#
# task.labels = []
