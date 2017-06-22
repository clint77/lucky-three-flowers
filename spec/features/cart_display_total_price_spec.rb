feature 'Cart will display total price' do
  scenario 'will display correct total price on last page' do
    enter_name_and_submit
    fill_in 'rose_quantity', with: 15
    click_button 'Submit'
    fill_in 'lily_quantity', with: 12
    click_button 'Submit'
    fill_in 'tulip_quantity', with: 17
    click_button 'Submit'
    expect(page).to have_content 'Total: $84.77'
  end
end

