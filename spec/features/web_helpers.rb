def enter_name_and_submit
  visit '/'
  fill_in :customer_name, with: 'Susan'
  click_button 'Submit'
end

def enter_valid_rose_quantity
  fill_in 'rose_quantity', with: 5
  click_button 'Submit'
end

def enter_valid_lily_quantity
  fill_in 'lily_quantity', with: 9
  click_button 'Submit'
end

def enter_valid_tulip_quantity
  fill_in 'tulip_quantity', with: 9
  click_button 'Submit'
end

def enter_valid_rose_quantity_10
  fill_in 'rose_quantity', with: 10
  click_button 'Submit'
end