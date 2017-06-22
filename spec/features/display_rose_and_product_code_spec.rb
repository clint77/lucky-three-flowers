feature 'display Rose and product code' do
  scenario 'will display Rose and product name as options after entering name' do
    enter_name_and_submit
    expect(page).to have_content 'Rose'
    expect(page).to have_content 'R12'
  end 
end