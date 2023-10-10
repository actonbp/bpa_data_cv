# Load necessary library
library(datadrivencv)

# Get today's date and format it to match your desired format
today_date <- format(Sys.Date(), "%m.%d.%Y")

# Create file names with today's date
html_file_name <- paste0("Acton_CV_", today_date, ".html")
pdf_file_name <- paste0("Acton_CV_", today_date, ".pdf")

# Knit the HTML version
rmarkdown::render("cv_current.rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = html_file_name)

# Knit the PDF version to temporary HTML location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv_current.rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = pdf_file_name)

##DATE IN FILE NAME AUTOMATICALLY UPDATED!
