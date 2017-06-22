feature 'Enter quantity of tulips' do
  before :each do
    enter_name_and_submit
    enter_valid_rose_quantity
    enter_valid_lily_quantity
  end
  
  scenario 'able to enter number of tulips' do
    fill_in 'tulip_quantity', with: 26
    expect(page).to have_selector("input[value='26']")
  end

  scenario 'see error message if number is not divisible by 5' do
    fill_in 'tulip_quantity', with: 7
    click_button 'Submit'
    expect(page).to have_content 'That number would not appear to be a bundle of 3s, 5s or 9s.'
  end

  scenario 'will not see an error if number is divisible by 5' do
    fill_in 'tulip_quantity', with: 10
    expect(page).not_to have_content 'That number would not appear to be a bundle of 3s, 5s or 9s.'
  end


end