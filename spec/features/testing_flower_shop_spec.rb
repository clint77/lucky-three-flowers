feature 'Testing Setup' do
  scenario 'Can run and check page content' do
    visit '/'
    expect(page).to have_content 'Hello from Flowers!'
  end
end