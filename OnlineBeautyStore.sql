-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-15 23:09:02.627

create database FinalProject;
use FinalProject;

-- tables
-- Table: Customer
CREATE TABLE Customer (
    Customer_Id int NOT NULL AUTO_INCREMENT,
    First_Name varchar(40) NOT NULL,
    Last_Name varchar(40) NOT NULL,
    Mail_ID varchar(100) NOT NULL,
    Address varchar(250) NOT NULL,
    PhoneNumber varchar(10) NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (Customer_Id)
);

-- Table: Online_Beauty_Store
CREATE TABLE Online_Beauty_Store (
    Beauty_product_ID int NOT NULL,
    Beauty_Product_Type varchar(20) NOT NULL,
    Product_Name varchar(30) NOT NULL,
    product_Details varchar(50) NOT NULL,
    Product_Price float(10,5) NOT NULL,
    Supplier_Supplier_ID int NOT NULL,
    CONSTRAINT Online_Beauty_Store_pk PRIMARY KEY (Beauty_product_ID)
) COMMENT 'Adding the beauty products types like Hair, Skin, Beauty.';

-- Table: Orders
CREATE TABLE Orders (
    Order_ID int NOT NULL,
    Quantity int NOT NULL,
    Customer_Customer_Id int NOT NULL,
    Payment_Payment_ID int NOT NULL,
    Payment_Details varchar(999) NOT NULL,
    Online_Beauty_Store_Beauty_product_Type_ID int NOT NULL,
    CONSTRAINT Orders_pk PRIMARY KEY (Order_ID)
);

-- Table: Payment
CREATE TABLE Payment (
    Payment_ID int NOT NULL,
    Cash_On_Delivery bool NOT NULL,
    Credit_card bool NOT NULL,
    Debit_Card bool NOT NULL,
    Internet_Banking bool NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (Payment_ID)
);

-- Table: Sales
CREATE TABLE Sales (
    Sale_ID int NOT NULL,
    Sale_Quantity int NOT NULL,
    ProfitAndLoss float(20,5) NOT NULL,
    Product_InStock bool NOT NULL,
    Month int NOT NULL,
    Monthly_sales_inPercent int NOT NULL,
    Online_Beauty_Store_Beauty_product_ID int NOT NULL,
    CONSTRAINT Sales_pk PRIMARY KEY (Sale_ID)
);

-- Table: Supplier
CREATE TABLE Supplier (
    Supplier_ID int NOT NULL,
    Supplier_Name varchar(40) NOT NULL,
    Product_Item varchar(30) NOT NULL,
    Average_Date_to_supply date NOT NULL,
    CONSTRAINT Supplier_pk PRIMARY KEY (Supplier_ID)
);

-- foreign keys
-- Reference: Online_Beauty_Store_Supplier (table: Online_Beauty_Store)
ALTER TABLE Online_Beauty_Store ADD CONSTRAINT Online_Beauty_Store_Supplier FOREIGN KEY Online_Beauty_Store_Supplier (Supplier_Supplier_ID)
    REFERENCES Supplier (Supplier_ID);

-- Reference: Order_Customer (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Order_Customer FOREIGN KEY Order_Customer (Customer_Customer_Id)
    REFERENCES Customer (Customer_Id);

-- Reference: Order_Online_Beauty_Store (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Order_Online_Beauty_Store FOREIGN KEY Order_Online_Beauty_Store (Online_Beauty_Store_Beauty_product_Type_ID)
    REFERENCES Online_Beauty_Store (Beauty_product_ID);

-- Reference: Order_Payment (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Order_Payment FOREIGN KEY Order_Payment (Payment_Payment_ID)
    REFERENCES Payment (Payment_ID);

-- Reference: Sales_Online_Beauty_Store (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT Sales_Online_Beauty_Store FOREIGN KEY Sales_Online_Beauty_Store (Online_Beauty_Store_Beauty_product_ID)
    REFERENCES Online_Beauty_Store (Beauty_product_ID);
	

-- End of file.

