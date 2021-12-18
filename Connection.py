import mysql.connector
from mysql.connector import errorcode


try:
   cm_connection = mysql.connector.connect(
      user="Admin",
      password="123",
      host="localhost",
      database="finalproject")

except mysql.connector.Error as err:
   if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
      print("Invalid credentials")
   elif err.errno == errorcode.ER_BAD_DB_ERROR:
      print("Database not found")
   else:
      print("Cannot connect to database:", err)

else:
   # Execute database operations...
       my_cursor = cm_connection.cursor()
# Build the ‘SELECT’ command to select all columns from a table in your database. 
# Here I will use * to produce all columns in my Online_Beauty_Store table.
    OnlineBeautyStore = ("SELECT * FROM Online_Beauty_Store")  

    my_cursor.execute(OnlineBeautyStore)  

# Display results
    for row in my_cursor.fetchall():
        print("{} is  {}".format(row[0], row[1]))

    my_cursor.close()
      print("Success");
    cm_connection.close()   // be sure your file ends with only ONE of these. You cannot close a connection twice.


  
   
