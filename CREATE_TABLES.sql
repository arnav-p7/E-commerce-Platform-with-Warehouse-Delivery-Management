-- ============================================================
--  E-Commerce Platform with Warehouse & Delivery Management — DDL SCRIPTS (PostgreSQL)
--  IT214 - Database Management System
--  Dhirubhai Ambani University | Academic Year 2026
-- ============================================================


-- -------------------------
-- USER
-- -------------------------
CREATE TABLE "User" (
    user_id     INT             PRIMARY KEY,
    name        VARCHAR(100)    NOT NULL,
    designation VARCHAR(50)     NOT NULL,
    password    VARCHAR(255)    NOT NULL
);


-- -------------------------
-- CUSTOMER
-- -------------------------
CREATE TABLE customer (
    customer_id INT             PRIMARY KEY,
    user_id     INT             NOT NULL UNIQUE,
    email       VARCHAR(150)    NOT NULL UNIQUE,
    phone       VARCHAR(15)     NOT NULL,
    address     TEXT,
    age         INT             CHECK (age >= 18),
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);


-- -------------------------
-- ADMIN
-- -------------------------
CREATE TABLE admin (
    admin_id    INT             PRIMARY KEY,
    user_id     INT             NOT NULL UNIQUE,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);


-- -------------------------
-- VENDOR
-- -------------------------
CREATE TABLE vendor (
    vendor_id   INT             PRIMARY KEY,
    email       VARCHAR(150)    NOT NULL UNIQUE,
    phone       VARCHAR(15)     NOT NULL,
    bank_info   TEXT,
    rating      FLOAT           CHECK (rating >= 0 AND rating <= 5)
);


-- -------------------------
-- CATEGORY
-- -------------------------
CREATE TABLE category (
    category_id     INT             PRIMARY KEY,
    cat_name        VARCHAR(100)    NOT NULL,
    parent_cat_id   INT             DEFAULT NULL,
    FOREIGN KEY (parent_cat_id) REFERENCES category(category_id) ON DELETE SET NULL
);


-- -------------------------
-- PRODUCT
-- -------------------------
CREATE TABLE product (
    product_id      INT             PRIMARY KEY,
    p_name          VARCHAR(150)    NOT NULL,
    description     TEXT,
    base_price      FLOAT           NOT NULL CHECK (base_price >= 0),
    current_price   FLOAT           NOT NULL CHECK (current_price >= 0),
    category_id     INT             NOT NULL,
    vendor_id       INT             NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE RESTRICT,
    FOREIGN KEY (vendor_id)   REFERENCES vendor(vendor_id)     ON DELETE RESTRICT
);


-- -------------------------
-- WAREHOUSE
-- -------------------------
CREATE TABLE warehouse (
    warehouse_id    INT             PRIMARY KEY,
    w_name          VARCHAR(150)    NOT NULL,
    location        VARCHAR(200)    NOT NULL,
    region          VARCHAR(50)     NOT NULL
);


-- -------------------------
-- WAREHOUSE_MANAGER
-- -------------------------
CREATE TABLE warehouse_manager (
    mgr_id          INT             PRIMARY KEY,
    mgr_email       VARCHAR(150)    NOT NULL UNIQUE,
    warehouse_id    INT             NOT NULL UNIQUE,
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id) ON DELETE CASCADE
);


-- -------------------------
-- INVENTORY
-- -------------------------
CREATE TABLE inventory (
    product_id      INT             NOT NULL,
    warehouse_id    INT             NOT NULL,
    stock           INT             NOT NULL DEFAULT 0 CHECK (stock >= 0),
    PRIMARY KEY (product_id, warehouse_id),
    FOREIGN KEY (product_id)   REFERENCES product(product_id)     ON DELETE CASCADE,
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id) ON DELETE CASCADE
);


-- -------------------------
-- ORDERS
-- -------------------------
CREATE TABLE orders (
    order_id        INT             PRIMARY KEY,
    order_date      DATE            NOT NULL DEFAULT CURRENT_DATE,
    status          VARCHAR(50)     NOT NULL
                        CHECK (status IN ('pending','processing','shipped','delivered','cancelled','returned')),
    total_amount    FLOAT           NOT NULL CHECK (total_amount >= 0),
    customer_id     INT             NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE RESTRICT
);


-- -------------------------
-- ORDER_ITEM
-- -------------------------
CREATE TABLE order_item (
    order_id        INT             NOT NULL,
    item_no         INT             NOT NULL,
    product_id      INT             NOT NULL,
    quantity        INT             NOT NULL CHECK (quantity > 0),
    unit_price      FLOAT           NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (order_id, item_no),
    FOREIGN KEY (order_id)   REFERENCES orders(order_id)   ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE RESTRICT
);


-- -------------------------
-- PAYMENT
-- -------------------------
CREATE TABLE payment (
    payment_id      INT             PRIMARY KEY,
    method          VARCHAR(50)     NOT NULL
                        CHECK (method IN ('UPI','Credit Card','Debit Card','Net Banking','COD')),
    status          VARCHAR(50)     NOT NULL
                        CHECK (status IN ('pending','completed','refunded','failed')),
    amount          FLOAT           NOT NULL CHECK (amount >= 0),
    paid_at         TIMESTAMP,
    order_id        INT             NOT NULL UNIQUE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);


-- -------------------------
-- DELIVERY_AGENT
-- -------------------------
CREATE TABLE delivery_agent (
    agent_id        INT             PRIMARY KEY,
    ag_name         VARCHAR(100)    NOT NULL,
    phone           VARCHAR(15)     NOT NULL,
    vehicle_type    VARCHAR(50)     NOT NULL
                        CHECK (vehicle_type IN ('Bike','Van','Truck')),
    region          VARCHAR(50)     NOT NULL
);


-- -------------------------
-- DELIVERY
-- -------------------------
CREATE TABLE delivery (
    delivery_id     INT             PRIMARY KEY,
    status          VARCHAR(50)     NOT NULL
                        CHECK (status IN ('pending','shipped','in_transit','delivered','cancelled','returned')),
    est_time        TIMESTAMP       NOT NULL,
    actual_time     TIMESTAMP,
    tracking_no     VARCHAR(50)     NOT NULL UNIQUE,
    order_id        INT             NOT NULL UNIQUE,
    agent_id        INT             NOT NULL,
    FOREIGN KEY (order_id)  REFERENCES orders(order_id)          ON DELETE CASCADE,
    FOREIGN KEY (agent_id)  REFERENCES delivery_agent(agent_id)  ON DELETE RESTRICT
);


-- -------------------------
-- REVIEW
-- -------------------------
CREATE TABLE review (
    review_id       INT             PRIMARY KEY,
    rating          INT             NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment         TEXT,
    reviewed_on     DATE            NOT NULL DEFAULT CURRENT_DATE,
    customer_id     INT             NOT NULL,
    product_id      INT             NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id)  REFERENCES product(product_id)   ON DELETE CASCADE
);


-- -------------------------
-- RETURN_REQUEST
-- -------------------------
CREATE TABLE return_request (
    return_id       INT             PRIMARY KEY,
    reason          TEXT            NOT NULL,
    status          VARCHAR(50)     NOT NULL
                        CHECK (status IN ('pending','approved','rejected')),
    requested_on    DATE            NOT NULL DEFAULT CURRENT_DATE,
    order_id        INT             NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);


-- -------------------------
-- REFUND
-- -------------------------
CREATE TABLE refund (
    refund_id       INT             PRIMARY KEY,
    amount          FLOAT           NOT NULL CHECK (amount >= 0),
    status          VARCHAR(50)     NOT NULL
                        CHECK (status IN ('pending','processing','completed','failed')),
    processed_on    DATE,
    return_id       INT             NOT NULL UNIQUE,
    FOREIGN KEY (return_id) REFERENCES return_request(return_id) ON DELETE CASCADE
);


-- -------------------------
-- COUPON
-- -------------------------
CREATE TABLE coupon (
    coupon_id       INT             PRIMARY KEY,
    code            VARCHAR(50)     NOT NULL UNIQUE,
    discount_pct    FLOAT           NOT NULL CHECK (discount_pct > 0 AND discount_pct <= 100),
    valid_from      DATE            NOT NULL,
    valid_to        DATE            NOT NULL,
    CHECK (valid_to >= valid_from)
);


-- -------------------------
-- CAMPAIGN
-- -------------------------
CREATE TABLE campaign (
    campaign_id     INT             PRIMARY KEY,
    c_name          VARCHAR(150)    NOT NULL,
    start_date      DATE            NOT NULL,
    end_date        DATE            NOT NULL,
    target_segment  VARCHAR(100),
    CHECK (end_date >= start_date)
);


-- ============================================================
-- END OF DDL SCRIPTS
-- ============================================================