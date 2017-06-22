feature 'Enter quantity of lilies' do
  scenario 'able to enter number of lilies' do
    enter_name_and_submit
    enter_valid_rose_quantity
    fill_in 'lily_quantity', with: 16
    expect(page).to have_selector("input[value='16']")
  end

  scenario 'see error message when number entered is not divisible by 3' do
    enter_name_and_submit
    enter_valid_rose_quantity
    fill_in 'lily_quantity', with: 4
    click_button 'Submit'
    expect(page).to have_content 'That number would not appear to be a bundle of 3s, 6s or 9s.'
  end

  scenario 'will not see error message when number entered is divisible by 3' do
    enter_name_and_submit
    enter_valid_rose_quantity
    fill_in 'lily_quantity', with: 6
    click_button 'Submit'
    expect(page).not_to have_content 'That number would not appear to be a bundle of 3s, 6s or 9s.'
  end
end