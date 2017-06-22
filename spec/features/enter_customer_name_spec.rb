feature 'Enter customer names' do
  scenario 'submitting customer names' do
    enter_name_and_submit
    expect(page).to have_content 'Welcome Susan!'
  end
end