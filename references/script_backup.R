#for joining table and map...

#SharedData$n

breweries91 <- leaflet::breweries91

# A SpatialPointsDataFrame for the map.
# Set a group name to share data points with the table.
brew_sp <- SharedData$new(breweries91, group = "id")

# A regular data frame (without coordinates) for the table.
# Use the same group name as the map data.
brew_data <- as_tibble(breweries91) %>%
  dplyr::select(brewery, address, village, founded) %>%
  data.frame()
#SharedData$new(group = "id") #to do the joining

#head(brew_data)

map <- leaflet(brew_sp) %>%
  addTiles() %>%
  addMarkers()



library(htmltools)

data <- data.frame(
  Animal = c("beaver", "cow", "wolf", "goat"),
  Body = c(1.35, 465, 36.33, 27.66),
  Brain = c(8.1, 423, 119.5, 115)
)

reactable(
  data,
  columns = list(
    Animal = colDef(cell = function(value) {
      img_src <- image_uri(paste(getwd(), "img/down_arrow.jpg", sep="/"))
      image <- img(src = img_src, style = "height: 24px;", alt = value)
      tagList(
        div(style = "display: inline-block; width: 20px", image),
        value
      )
    }
    )
  )
)




uri = image_uri(file.path(R.home("doc"), "html", "logo.jpg"))
if (interactive()) {
  cat(sprintf("<img src=\"%s\" />", uri), file = "logo.html")
  browseURL("logo.html")  # you can check its HTML source
}


#color 

stocks <- data.frame(
  Symbol = c("GOOG", "FB", "AMZN", "NFLX", "TSLA"),
  Price = c(1265.13, 187.89, 1761.33, 276.82, 328.13),
  Change = c(4.14, 1.51, -19.45, 5.32, -12.45)
)

head(stocks)

reactable(
  stocks,
  columns = list(
  Change = colDef(
      cell = function(value) {
        if (value >= 0) paste0("+", value) else value
      },
      style = function(value) {
        color <- if (value > 0) {
          "#008000"
        } else if (value < 0) {
          "#e00000"
        }
        list(fontWeight = 600, color = color)
      }
    )
  )
)


library(reactablefmtr)

#----------------------------
#up and down arrow
data <- MASS::Cars93[20:49, c("Make", "MPG.city", "MPG.highway")]
head(data)
## By default, icon_sets() assigns blue circles to the lowest-third values,
## grey circles to the middle-third values,
## and orange to the top-third values
reactable(data,
          defaultColDef = colDef(cell = icon_sets(data)))

## Apply pre-set icon sets with icon_set:
reactable(data,
          defaultColDef = colDef(cell = icon_sets(data,
                                                  icon_set = 'ski rating')))

## Assign custom colors
reactable(data,
          defaultColDef = colDef(cell = icon_sets(data,
                                                  colors = c("tomato", "grey", "dodgerblue"))))

## Assign icons from Font Awesome's icon library
reactable(data,
          defaultColDef = colDef(cell = icon_sets(data,
                                                  icons = c("arrow-down","minus","arrow-up"))))

## Use number_fmt to format numbers using the scales package
car_prices <- MASS::Cars93[20:49, c("Make", "Price")]

reactable(car_prices,
          defaultColDef = colDef(cell = icon_sets(car_prices,
                                                  number_fmt = scales::dollar)))

## Position icons relative to the numbers. Options are to the left, right, above, below, or over.
reactable(car_prices,
          defaultColDef = colDef(cell = icon_sets(car_prices,
                                                  icon_position = "above")))

#------------------------------

brew_data %>% dplyr::mutate(founded2 = founded-1800)
brew_data %>% dplyr::mutate(founded2 = founded-1800)%>%data.frame()



data <- data.frame(
  price_USD = c(123456.56, 132, 5650.12),
  price_INR = c(350, 23208.552, 1773156.4),
  number_FR = c(123456.56, 132, 5650.12),
  temp = c(22, NA, 31),
  percent = c(0.9525556, 0.5, 0.112),
  date = as.Date(c("2019-01-02", "2019-03-15", "2019-09-22"))
)

head(data)


reactable(data, columns = list(
  price_USD = colDef(format = colFormat(prefix = "$", separators = TRUE, digits = 2)),
  price_INR = colDef(format = colFormat(currency = "INR", separators = TRUE, locales = "hi-IN")),
  number_FR = colDef(format = colFormat(locales = "fr-FR")),
  temp = colDef(format = colFormat(suffix = " \u00b0C")),
  percent = colDef(format = colFormat(percent = TRUE, digits = 1)),
  date = colDef(format = colFormat(date = TRUE, locales = "en-GB"))
))

# Date formatting
datetimes <- as.POSIXct(c("2019-01-02 3:22:15", "2019-03-15 09:15:55", "2019-09-22 14:20:00"))
data <- data.frame(
  datetime = datetimes,
  date = datetimes,
  time = datetimes,
  time_24h = datetimes,
  datetime_pt_BR = datetimes
)
reactable(data, columns = list(
  datetime = colDef(format = colFormat(datetime = TRUE)),
  date = colDef(format = colFormat(date = TRUE)),
  time = colDef(format = colFormat(time = TRUE)),
  time_24h = colDef(format = colFormat(time = TRUE, hour12 = FALSE)),
  datetime_pt_BR = colDef(format = colFormat(datetime = TRUE, locales = "pt-BR"))
))
# Currency formatting
data <- data.frame(
  USD = c(12.12, 2141.213, 0.42, 1.55, 34414),
  EUR = c(10.68, 1884.27, 0.37, 1.36, 30284.32),
  INR = c(861.07, 152122.48, 29.84, 110, 2444942.63),
  JPY = c(1280, 226144, 44.36, 164, 3634634.61),
  MAD = c(115.78, 20453.94, 4.01, 15, 328739.73)
)
reactable(data, columns = list(
  USD = colDef(
    format = colFormat(currency = "USD", separators = TRUE, locales = "en-US")
  ),
  EUR = colDef(
    format = colFormat(currency = "EUR", separators = TRUE, locales = "de-DE")
    8 colGroup
  ),
  INR = colDef(
    format = colFormat(currency = "INR", separators = TRUE, locales = "hi-IN")
  ),
  JPY = colDef(
    format = colFormat(currency = "JPY", separators = TRUE, locales = "ja-JP")
  ),
  MAD = colDef(
    format = colFormat(currency = "MAD", separators = TRUE, locales = "ar-MA")
  )
))
# Formatting aggregated cells
data <- data.frame(
  States = state.name,
  Region = state.region,
  Area = state.area
)
reactable(
  data,
  groupBy = "Region",
  columns = list(
    States = colDef(
      aggregate = "count",
      format = list(
        aggregated = colFormat(suffix = " states")
      )
    ),
    Area = colDef(
      aggregate = "sum",
      format = colFormat(suffix = " mi\u00b2", separators = TRUE)
    )
  )
)

#https://stackoverflow.com/questions/70915524/selecting-reactable-rows-via-leaflet-map-with-crosstalk
