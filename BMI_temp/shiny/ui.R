library(shiny)

# UI definition
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Body Mass Index Calculator (BMI)"),
  
  # Side panel: input values, slidebar for zooming, and some information
  sidebarPanel(
    numericInput("Weight", "What is your weight [kg] ?", 70),
    numericInput("Height", "What is your height [cm] ?",185),
    
    selectInput("Country", "By the way, where are your from ?",
                list('Afghanistan' = '1','Albania' = '2','Algeria' = '3','Andorra' = '4','Angola' = '5','Antigua and Barbuda' = '6','Argentina' = '7','Armenia' = '8','Australia' = '9','Austria' = '10','Azerbaijan' = '11','Bahamas' = '12','Bahrain' = '13','Bangladesh' = '14','Barbados' = '15','Belarus' = '16','Belgium' = '17','Belize' = '18','Benin' = '19','Bhutan' = '20','Bolivia (Plurinational State of)' = '21','Bosnia and Herzegovina' = '22','Botswana' = '23','Brazil' = '24','Brunei Darussalam' = '25','Bulgaria' = '26','Burkina Faso' = '27','Burundi' = '28','Côte dIvoire' = '29','Cabo Verde' = '30','Cambodia' = '31','Cameroon' = '32','Canada' = '33','Central African Republic' = '34','Chad' = '35','Chile' = '36','China' = '37','Colombia' = '38','Comoros' = '39','Congo' = '40','Cook Islands' = '41','Costa Rica' = '42','Croatia' = '43','Cuba' = '44','Cyprus' = '45','Czech Republic' = '46','Democratic Peoples Republic of Korea' = '47','Democratic Republic of the Congo' = '48','Denmark' = '49','Djibouti' = '50','Dominica' = '51','Dominican Republic' = '52','Ecuador' = '53','Egypt' = '54','El Salvador' = '55','Equatorial Guinea' = '56','Eritrea' = '57','Estonia' = '58','Ethiopia' = '59','Fiji' = '60','Finland' = '61','France' = '62','Gabon' = '63','Gambia' = '64','Georgia' = '65','Germany' = '66','Ghana' = '67','Greece' = '68','Grenada' = '69','Guatemala' = '70','Guinea' = '71','Guinea-Bissau' = '72','Guyana' = '73','Haiti' = '74','Honduras' = '75','Hungary' = '76','Iceland' = '77','India' = '78','Indonesia' = '79','Iran (Islamic Republic of)' = '80','Iraq' = '81','Ireland' = '82','Israel' = '83','Italy' = '84','Jamaica' = '85','Japan' = '86','Jordan' = '87','Kazakhstan' = '88','Kenya' = '89','Kiribati' = '90','Kuwait' = '91','Kyrgyzstan' = '92','Lao Peoples Democratic Republic' = '93','Latvia' = '94','Lebanon' = '95','Lesotho' = '96','Liberia' = '97','Libya' = '98','Lithuania' = '99','Luxembourg' = '100','Madagascar' = '101','Malawi' = '102','Malaysia' = '103','Maldives' = '104','Mali' = '105','Malta' = '106','Marshall Islands' = '107','Mauritania' = '108','Mauritius' = '109','Mexico' = '110','Micronesia (Federated States of)' = '111','Monaco' = '112','Mongolia' = '113','Montenegro' = '114','Morocco' = '115','Mozambique' = '116','Myanmar' = '117','Namibia' = '118','Nauru' = '119','Nepal' = '120','Netherlands' = '121','New Zealand' = '122','Nicaragua' = '123','Niger' = '124','Nigeria' = '125','Niue' = '126','Norway' = '127','Oman' = '128','Pakistan' = '129','Palau' = '130','Panama' = '131','Papua New Guinea' = '132','Paraguay' = '133','Peru' = '134','Philippines' = '135','Poland' = '136','Portugal' = '137','Qatar' = '138','Republic of Korea' = '139','Republic of Moldova' = '140','Romania' = '141','Russian Federation' = '142','Rwanda' = '143','Saint Kitts and Nevis' = '144','Saint Lucia' = '145','Saint Vincent and the Grenadines' = '146','Samoa' = '147','San Marino' = '148','Sao Tome and Principe' = '149','Saudi Arabia' = '150','Senegal' = '151','Serbia' = '152','Seychelles' = '153','Sierra Leone' = '154','Singapore' = '155','Slovakia' = '156','Slovenia' = '157','Solomon Islands' = '158','Somalia' = '159','South Africa' = '160','Spain' = '161','Sri Lanka' = '162','Sudan' = '163','Suriname' = '164','Swaziland' = '165','Sweden' = '166','Switzerland' = '167','Syrian Arab Republic' = '168','Tajikistan' = '169','Thailand' = '170','The former Yugoslav Republic of Macedonia' = '171','Timor-Leste' = '172','Togo' = '173','Tonga' = '174','Trinidad and Tobago' = '175','Tunisia' = '176','Turkey' = '177','Turkmenistan' = '178','Tuvalu' = '179','Uganda' = '180','Ukraine' = '181','United Arab Emirates' = '182','United Kingdom' = '183','United Republic of Tanzania' = '184','United States of America' = '185','Uruguay' = '186','Uzbekistan' = '187','Vanuatu' = '188','Venezuela (Bolivarian Republic of)' = '189','Viet Nam' = '190','Yemen' = '191','Zambia' = '192','Zimbabwe' = '193')),
    
    radioButtons('Zoom', 'Zoom',c('Full range','Zoom on my country')),
    
    sliderInput("obs","Zoom", min = 1, max = 189, value = 189),
    
    helpText('Just enter the values and see the results ! \n
             The calculation of the Body Mass Index (BMI) is as follows:\n'),
    includeHTML("include.html")
    
  ),
  
  # Main panel : Results
  
  mainPanel(
    h2('Results'),
    h4('My BMI'),
    verbatimTextOutput("BMI"),
    h4('Worldwide distribution'),
    plotOutput("Plot"),
    h4('Sources'),
    tags$a("BMI on Wikipedia", href="http://en.wikipedia.org/wiki/Body_mass_index"),
    br(),
    tags$a("World Health Organisation", href="http://apps.who.int/gho/data/view.main.2461?lang=fr")
  ) 
  
))
