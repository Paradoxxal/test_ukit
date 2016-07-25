When(/^я открываю страницу авторизации$/) do
    visit START_PAGE
end


When(/^я ввожу в поле "([^"]*)" текст "([^"]*)"$/) do |field, text|
    fill_in field, text
end

When(/^нажимаю кнопку "([^"]*)"$/) do |caption|
    button_click caption
end

When(/^я должен увидеть авторизованного пользователя "([^"]*)"$/) do |user_name|
    check_user_name user_name
end


When(/^разавторизоваться$/) do
    logout
end


When(/^проверяю окно авторизации через соц\. сеть "(ВКонтакте|Facebook|uID.me|Яндекс|Google\+|Одноклассники|Twitter|Disqus|LinkedIn)"$/) do |caption|
    check_soc_net caption
end

When(/^разварачиваю список соц\. сетей$/) do
    full_list_soc_net
end

When(/^должен увидеть текст "([^"]*)" на странице$/) do |text|
    page.should have_text text
end

When(/^я должен увидеть ошибку "(Пользователь с таким email не существует|Неверный пароль)"$/) do |text|
    check_erorr text
end

When(/^я должен увидеть неактивную кнопку "([^"]*)"$/) do |caption|
    check_disable_btn caption
end