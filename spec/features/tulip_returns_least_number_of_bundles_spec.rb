feature 'Tulip returns the least number of bundle' do
  scenario 'will return 1 bundle of 9 if input is 9' do
    enter_name_and_submit
    enter_valid_rose_quantity
    enter_valid_lily_quantity
    fill_in 'tulip_quantity', with: 9
    click_button 'Submit'
    expect(page).to have_content '1 x 9 $16.95'
  end
end