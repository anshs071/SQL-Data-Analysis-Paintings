import pandas as pd
from sqlalchemy import create_engine

# Define the connection string (replace placeholders with your actual database credentials)
DB_USERNAME = 'your_username'
DB_PASSWORD = 'your_password'
DB_HOST = 'suppose_localhost'
DB_NAME = 'sql_painting_project'

conn_string = f'postgresql://{DB_USERNAME}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}'

# Create a database engine
db = create_engine(conn_string)

# Establish a connection
conn = db.connect()

# List of file names without the file extension
files = ['artist', 'canvas_size', 'image_link', 'museum_hours', 'museum', 'product_size', 'subject', 'work']

# Loop through each file name and import the corresponding CSV file into a DataFrame, then save it to the database
for file in files:
    # Construct the file path (replace with the actual path to your CSV files)
    file_path = f'{file}.csv'
    
    # Read the CSV file into a DataFrame
    df = pd.read_csv(file_path)
    
    # Save the DataFrame to the database
    df.to_sql(file, con=conn, if_exists='replace', index=False)

# Close the database connection
conn.close()
