import mysql.connector
from mysql.connector import errorcode

try:

    mydb = mysql.connector.connect(
        host='localhost',  
        user='username',  
        password='password',  
        database='alx_book_store'  
    )

    if mydb.is_connected():
        print("Database connection successful.")
        mycursor = mydb.cursor()


        create_authors_table = 
        CREATE TABLE IF NOT EXISTS Authors (
            author_id INT AUTO_INCREMENT PRIMARY KEY,
            author_name VARCHAR(215) NOT NULL
        )
        
        
        create_books_table = 
        CREATE TABLE IF NOT EXISTS Books (
            book_id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(130) NOT NULL,
            author_id INT,
            price DOUBLE,
            publication_date DATE,
            FOREIGN KEY (author_id) REFERENCES authors(author_id)
        )
        
        create_customers_table = 
        CREATE TABLE IF NOT EXISTS Customers (
            customer_id INT AUTO_INCREMENT PRIMARY KEY,
            customer_name VARCHAR(215) NOT NULL,
            email VARCHAR(215),
            address TEXT
        )
        
        
        create_orders_table = 
        CREATE TABLE IF NOT EXISTS Orders (
            order_id INT AUTO_INCREMENT PRIMARY KEY,
            customer_id INT,
            order_date DATE,
            FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        )
        
        
        create_order_details_table = 
        CREATE TABLE IF NOT EXISTS Order_details (
            orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
            order_id INT,
            book_id INT,
            quantity DOUBLE,
            FOREIGN KEY (order_id) REFERENCES orders(order_id),
            FOREIGN KEY (book_id) REFERENCES books(book_id)
        )
        
        cursor.execute(create_authors_table)
        cursor.execute(create_books_table)
        cursor.execute(create_customers_table)
        cursor.execute(create_orders_table)
        cursor.execute(create_order_details_table)

        print("Tables created successfully!")

except mysql.connector.Error as errormsg:
    if errormsg.errmsgno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Please check your username and/or password")
    elif errormsg.errormsgno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(errormsg)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection ended.")