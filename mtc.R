#Using mtcars Dataset form 'R' and Creating a user input Histogram
library(shiny)
ui = fluidPage(
  #Creating a title with Heading 4(size) and aligned to center
  
  titlePanel(h4("List of the cars", align='center')),
  #Creating SidebarLayout and SidebarPanel
  sidebarLayout(
  sidebarPanel(
  selectInput("car","List of Cars", choices=c("Mpg"=1,"Cyl"=2,"Disp"=3)),hr(),
  sliderInput("bin","Choose the slider", value=33,min=5,max=35),
  hr(),
  radioButtons("but","Choose the color", choices=c("Red","Green","Blue"))
  ),  
  mainPanel(
    plotOutput("hist")
  )
  )
  
)
server= function(input,output,session){
  #Rendering histogram of differnt column of mtcars Dataset
  output$hist = renderPlot({
    colm= as.numeric(input$car)
    hist(mtcars[,colm], breaks=seq(0,max(mtcars[,colm], length=input$bin+1)),col=input$but, main="List of Cars Dataset", xlab=names(mtcars[colm]))})
  }
shinyApp(ui,server)
