# encoding: utf-8
def registration_scripts_path
  $:.unshift(File.dirname(__FILE__))
  $:.unshift(File.dirname(__FILE__) + '/../..')
end

def include_scripts
  registration_scripts_path
  require 'capybara/cucumber'
  require 'TEST_KIT'
  require 'selenium-webdriver'
  require 'rspec'
end

def setup_capybara # конфигурирование и запуск браузера
  Capybara.register_driver :selenium do |app|
    browser = (ENV['browser'] || 'firefox').to_sym
      Capybara::Selenium::Driver.new(app, :browser => browser)
  end
  Capybara.default_driver = :selenium
  Capybara.current_session.driver.browser.manage.window.resize_to(2048, 1024)
  Capybara.default_selector = :css
  Capybara.default_max_wait_time = 15
end

def add_kits
  World(TEST_KIT)
end

include_scripts
setup_capybara
add_kits

TEST_DATE = Time.now.strftime('%Y-%m-%d-%H-%M-%S')
LOG_PATH =  "./test_errors/#{TEST_DATE}" #путь к логам

def on_error(scenario) # обработка ошибо
  require 'fileutils'
  error = scenario.exception.message
  name = "#{LOG_PATH}/#{scenario.name}"

  begin
    f.mkdir_p LOG_PATH unless File.exists?(LOG_PATH)
    page.save_screenshot "#{name}.png" # сохранение скриншота
    file = File.open("#{name}.log", 'w')
    file.write(error)
    Capybara.save_page "#{name}.html" # сохреннение страницы
  rescue Exception => e
    puts "Error while loging #{e.to_s}"
  end
end



