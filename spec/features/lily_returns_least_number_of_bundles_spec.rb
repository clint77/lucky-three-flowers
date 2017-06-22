feature 'Rose returns the least number of bundle' do
  scenario 'will return 1 bundle of 9 if input is 9' do
    enter_name_and_submit
    enter_valid_rose_quantity
    fill_in 'lily_quantity', with: 9
    click_button 'Submit'
    enter_valid_tulip_quantity
    expect(page).to have_content '1 x 9 $24.95'
    expect(page).not_to have_content '3 x 5 $6.99'
  end

  scenario 'will return 1 bundle of 6 if input is 6' do
    enter_name_and_submit
    enter_valid_rose_quantity
    fill_in 'lily_quantity', with: 6
    click_button 'Submit'
    enter_valid_tulip_quantity
    expect(page).to have_content '1 x 6 $16.95'
    expect(page).not_to have_content '2 x 3 $6.99'
  end

  scenario 'will return 1 bundle of 3 if input is 3' do
    enter_name_and_submit
    enter_valid_rose_quantity
    fill_in 'lily_quantity', with: 3
    click_button 'Submit'
    enter_valid_tulip_quantity
    expect(page).to have_content '1 x 3 $6.99'
  end

  scenario 'will return 3 bundle of 9 and 1 bundle of 6 if input is 33' do
    enter_name_and_submit
    enter_valid_rose_quantity
    fill_in 'lily_quantity', with: 33
    click_button 'Submit'
    enter_valid_tulip_quantity
    expect(page).to have_content '3 x 9 $24.95'
    expect(page).to have_content '1 x 6 $16.95'
    expect(page).to have_content '0 x 3 $6.99'
  end

end