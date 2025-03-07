
import pandas as pd
 
from ydata_profiling import ProfileReport
#Specify Filepath of the Data File along with the format
file_path = "path/to/your/csv/file.csv"
#Specify the Column/Field Sperator of the Data
df = pd.read_csv(file_path, sep = '/t')
#Specify the Title to be printed on the HTML document
profile = ProfileReport(df, title="Profiling Report")
#Specify the Name of the Generated File
profile.to_file("Austin_Profiling.html")


#Repeat the same for other data sources
 
from ydata_profiling import ProfileReport

df = pd.read_csv(file_path, sep = '/t')

profile = ProfileReport(df, title="Profiling Report")

profile.to_file("Chicago_Profiling.html")

#Repeat the same for other data sources
 
from ydata_profiling import ProfileReport

df = pd.read_csv(file_path, sep = '/t')

profile = ProfileReport(df, title="Profiling Report")

profile.to_file("New_York_Profiling.html")