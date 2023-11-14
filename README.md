# README #

### About the repository ###
* The repository contains the implementation to demonstrate an effective way to use 'Selenium/WebDriver Support plugin' to design and develop a web true client performance test automation framework
* The website under test is 'buggy.justtestit'
* There are 2 test scenarios within the Test Suite

### Application under-test prerequisite ###
* 'https://buggy.justtestit.org/' should be up and working as expected

### Prerequisite for test execution ###
* Java 8 or higher installed
* JAVA_HOME environment variable configured
* Apache JMeter 5.5 or latest (binary) downloaded and unzipped (https://jmeter.apache.org/download_jmeter.cgi)
* JMETER_HOME environment variable configured
* Install 'JMeter Plugins Manager' (https://jmeter-plugins.org/wiki/PluginsManager)
* Install 'Selenium/WebDriver Support' plugin (Version 4 | Example: 4.13.0.0)
* Add below lines under 'apache-jmeter-5.5\bin\user.properties' at the bottom
  ```
  webdriver.sampleresult_class=com.googlecode.jmeter.plugins.webdriver.sampler.SampleResultWithSubs  
  subresults.disable_renaming=true
  ```
* Google Chrome web browser installed
* Mozilla Firefox web browser installed (only if tests need to execute on Firefox)
* Microsoft Edge web browser installed (only if tests need to execute on Edge)

### How do I get set up ###
* Clone or download the repository 'jmeter-selenium'
* Paste 'jmeter-selenium' into the 'apache-jmeter-5.5\bin\' folder
* Check if 'browser-driver' folder already available under 'apache-jmeter-5.5\bin\jmeter-selenium\', else create folder 'browser-driver' under 'apache-jmeter-5.5\bin\jmeter-selenium\'
* Download ChromeDriver exe as per the Chrome Browser version installed in the machine (https://chromedriver.chromium.org/downloads), then paste chromedriver.exe under folder 'apache-jmeter-5.5\bin\jmeter-selenium\browser-driver\'
* Check if 'run\RunTestCreateCsvAndHtml.bat' folder and file already available under 'apache-jmeter-5.5\bin\jmeter-selenium\', else Create a folder 'run' under 'apache-jmeter-5.5\bin\jmeter-selenium\'. Then within 'run' folder, create a Windows Batch File (.bat) named 'RunTestCreateCsvAndHtml.bat' with below content in it:
  ```
  cd..
  
  set CUR_YYYY=%date:~10,4%
  set CUR_MM=%date:~7,2%
  set CUR_DD=%date:~4,2%
  set CUR_HH=%time:~0,2%
  if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
  set CUR_NN=%time:~3,2%
  set CUR_SS=%time:~6,2%
  set CUR_MS=%time:~9,2%
  
  set CURRENTDATETIME=%CUR_YYYY%%CUR_MM%%CUR_DD%_%CUR_HH%%CUR_NN%%CUR_SS%
  set RESULTSFOLDERNAME=results_%CURRENTDATETIME%
  
  mkdir %RESULTSFOLDERNAME%
  
  cd..
  jmeter -n -t jmeter-selenium\scripts\TrueClientTests.jmx -l jmeter-selenium\%RESULTSFOLDERNAME%\TestOutput.csv -e -o jmeter-selenium\%RESULTSFOLDERNAME%\html\
  ```

### Folder/file structure after setup would be ###
- apache-jmeter-5.5
    - bin
        - jmeter-selenium
            - browser-driver
                - chromedriver.exe
            - run
                - RunTestCreateCsvAndHtml.bat
            - scripts
                - TrueClientTests.jmx
            - README.md

### How to execute tests in JMeter console/UI ###
* Launch JMeter 'apache-jmeter-5.5\bin\jmeter.bat'
* Open 'apache-jmeter-5.5\bin\jmeter-selenium\scripts\TrueClientTests.jmx'
* You would be able to see 2 test scenarios
    - InvalidRegisterScenario  
    - LoginScenario  
* Enable or Disable any test scenario(s). Click on 'Start' icon to execute tests

### How to execute tests via command-line and generate report ###
* Execute 'jmeter-selenium\run\RunTestCreateCsvAndHtml.bat'  
  'RunTestCreateCsvAndHtml.bat' includes commands to create required result folder then execute tests and generate result report. The syntax of test execution command is as below:  
  ```
  jmeter -n -t [full path to jmx file]\TWR_Digi_UI_Tests.jmx -l [full path to get csv report]\TestOutput.csv -e -o [full path to get html report]
  ```

### Test result report ###
* After command-line test execution completed, results can be seen under 'apache-jmeter-5.5\bin\jmeter-selenium\results_CurrentDate_Time'

### How to know about existing test implementation and guidance to add new tests ###
* Go through the existing Test Scenario files (jp@gc - WebDriver Sampler)
* To know the basics, follow 'https://jmeter-plugins.org/wiki/WebDriverSampler'

### How to manipulate Thread Properties (number of users, loop count) ###
* Goto Thread Group  
  Note: It is recommended to setup and use 'jp@gc - Remote Driver Config' if tests need to execute with multiple users

### Who do I talk to ###
* For more information contact: Jaspal Aujla at [jaspal.qa@outlook.com](mailto:jaspal.qa@outlook.com) or [jsaujla1@gmail.com](mailto:jsaujla1@gmail.com)
