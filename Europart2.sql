CREATE TABLE invoices (
  invoice_number VARCHAR(20) PRIMARY KEY,
  idate DATE,
  vat_total NUMBER,
  total_value NUMBER,
  supplier_number VARCHAR(10),
  FOREIGN KEY (supplier_number) REFERENCES supplier(supplier_number)
);

CREATE TABLE invoice_details (
  invoice_number VARCHAR(20),
  part_number_with_prefix CHAR(12), 
  quantity NUMBER,
  net_price NUMBER,
  net_vat NUMBER,
  PRIMARY KEY (invoice_number, part_number_with_prefix),
  FOREIGN KEY (invoice_number) REFERENCES invoice(invoice_number),
  FOREIGN KEY (part_number_with_prefix) REFERENCES part(part_number_with_prefix)
);

CREATE TABLE locations (
  part_number_with_prefix CHAR(12), 
  bin_number VARCHAR(10),
  quantity NUMBER,
  warehouse_id VARCHAR(50),
  PRIMARY KEY (part_number_with_prefix, bin_number, warehouse_id),
  FOREIGN KEY (part_number_with_prefix) REFERENCES part(part_number_with_prefix),
  FOREIGN KEY (bin_number, warehouse_id) REFERENCES bin(bin_number, warehouse_id)
);

CREATE TABLE suppliers (
  supplier_number VARCHAR(10) PRIMARY KEY,
  supplier_name VARCHAR(100) NOT NULL,
  address VARCHAR(100),
  town VARCHAR(50),
  county VARCHAR(50),
  postcode VARCHAR(10),
  contact_number VARCHAR(20),
  email_address VARCHAR(100),
  country VARCHAR(50)
);

CREATE TABLE warehouses (
  warehouse_id VARCHAR(50) PRIMARY KEY,
  address VARCHAR(100),
  town VARCHAR(50),
  county VARCHAR(50),  
  postcode VARCHAR(10),
  contact_number VARCHAR(20)
);

CREATE TABLE bins (
  bin_number VARCHAR(10),
  warehouse_id VARCHAR(50),
  PRIMARY KEY (bin_number, warehouse_id),
  FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)
);

CREATE TABLE parts (
  part_number_with_prefix CHAR(12) PRIMARY KEY,
  part_number CHAR(10) NOT NULL,
  description VARCHAR(40),
  discount_sw_code CHAR(4),
  discount_sw_percent NUMBER(3),
  krona_net NUMBER,
  discount_uk_code CHAR(4), 
  discount_uk_percent NUMBER(3),
  sterling_net NUMBER  
);



