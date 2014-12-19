params = {
	reg_email: "test@interview.com",
	name: "Test Name",
	password: "testpw1",
	missing_cf_pw_err_msg: "Mật khẩu phải có ít nhất 1 chữ số"
}

Given(/^open the home page$/) do
	visit '/'
	set_window_size(1350, 1350)
end

And(/^sign up for the new account without inputting the confirm password$/) do
  $act.home_sign_up(:name => params[:name], 
  									:email => params[:reg_email], 
  									:password => params[:password])
end

Then(/^error message for invalid sign up data display properly$/) do
  expect(page).to have_content(params[:missing_cf_pw_err_msg])
end