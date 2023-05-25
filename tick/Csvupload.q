// Connect to the tickerplant
h:hopen `::5012

// Define the path of the folder where the CSV file is located
path: "`$":/capstone/tick/Csvupload";"

// Get a list of all the CSV files in the folder
files: ` sv/: path,/: key ` sv/: system "cmd /c dir /b /a-d \"" , path , "\""

// Loop through each file and publish it to the tickerplant
{[file]
  // Read the CSV file into a q table
  data: ("FS"; enlist ",") 0: hsym path, file

  // Publish the data to the tickerplant
  h("insert";`sym`time xcol data)
 } each files

// Close the connection to the tickerplant
hclose h


