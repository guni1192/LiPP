# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id         :bigint(8)        not null, primary key
#  repo_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  # describe 'Projec.user_id' do
  #   it '空白禁止' do
  #     project = create(:project)
  #     project.user_id = '   '
  #     expect(project).not_to(be_valid)
  #   end
  # end

  # describe 'Projec.repo_id' do
  #   it '空白禁止' do
  #     project = create(:project)
  #     project.repo_id = '   '
  #     expect(project).not_to(be_valid)
  #   end
  # end
end
