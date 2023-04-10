require 'rails_helper'

RSpec.feature "UsersIndices", type: :feature do
  context 'When testing user index page' do
      scenario 'should show the username of all other users.' do
      visit users_path
      expect(page).to have_content(['Don G. Adams', 'Les J. Haley', 'Caroline G. Metcalf', 'Terry B. Benavidez','Rebecca J. Morris'])
    end
end
end