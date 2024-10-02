import mysql.connector
from mysql.connector import errorcode

def create_database():
    try:
        cnx = mysql.connector.connect(
            host='localhost',        
            user='root',    
            password='Russell19058%' 
        )
        cursor = cnx.cursor()

        create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"

        try:
            cursor.execute(create_db_query)
            print("Database 'alx_book_store' created successfully!")
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_DB_CREATE_EXISTS:
            
                print("Database 'alx_book_store' already exists.")
            else:
                
                print(f"Failed to create database: {err}")
    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL: {err}")
    finally:
        
        try:
            cursor.close()
            cnx.close()
        except:
            pass

if __name__ == "__main__":
    create_database()
