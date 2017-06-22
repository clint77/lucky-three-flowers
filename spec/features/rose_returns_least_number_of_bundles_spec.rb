feature 'Rose returns the least amount of bundle' do
  scenario 'will return 1 bundle of 10 if input is 10' do
    enter_name_and_submit
    fill_in 'rose_quantity', with: 10
    click_button 'Submit'
    enter_valid_lily_quantity
    enter_valid_tulip_quantity
    expect(page).to have_content '1 x 10 $12.99'
    expect(page).not_to have_content '2 x 5 $6.99'
  end

  scenario 'will return 1 bundle of 10 and 1 bundle of 5 if input is 15' do
    enter_name_and_submit
    fill_in 'rose_quantity', with: 15
    click_button 'Submit'
    enter_valid_lily_quantity
    enter_valid_tulip_quantity
    expect(page).to have_content '1 x 10 $12.99'
    expect(page).to have_content '1 x 5 $6.99'
    expect(page).not_to have_content '3 x 5 $6.99'
  end

  scenario 'will return 5 bundle of 10 and 1 bundle of 5 if input is 55' do
    enter_name_and_submit
    fill_in 'rose_quantity', with: 55
    click_button 'Submit'
    enter_valid_lily_quantity
    enter_valid_tulip_quantity
    expect(page).to have_content '5 x 10 $12.99'
    expect(page).to have_content '1 x 5 $6.99'
    expect(page).not_to have_content '11 x 5 $6.99'
  end


end

