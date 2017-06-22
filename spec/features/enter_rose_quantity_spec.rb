feature 'Enter rose quantity' do
  scenario 'will accept number of roses not fit to bundles of 5s or 10s' do
    enter_name_and_submit
    fill_in 'rose_quantity', with: 7
    click_button 'Submit'
    expect(page).to have_content 'That number would not appear to be a bundle of 5s or 10s.'
  end

  scenario 'will accept a number that is either bundle of 5s or 10s' do
    enter_name_and_submit
    fill_in 'rose_quantity', with: 5
    click_button 'Submit'
    expect(page).to have_content 'Lilies Product Code: L09'
  end
end