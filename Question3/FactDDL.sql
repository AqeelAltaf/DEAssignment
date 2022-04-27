CREATE TABLE Fact.Sales (
    SalesOrderDetailKey int PRIMARY KEY,
    SalesOrderKey INT NOT NULL,
    ProductKey INT NOT NULL,
    SpecialOfferKey INT NOT NULL,
    SalesOrderStatusKey INT NOT NULL,
    SalesOnlineOrderFlagKey INT NOT NULL,
    SalesOrderAccountNumber nvarchar(16) NOT NULL,
    SalesOrderCustomerKey INT NOT NULL,
    SalesPersonKey INT NOT NULL,
    TerritoryKey INT NOT NULL,
    BillToAddressKey INT NOT NULL,
    ShipToAddressKey INT NOT NULL,
    ShipMethodKey INT NOT NULL,
    SalesOrderDetailModifiedDateKey DATETIME NOT NULL,
    SalesOrderDateKey DATETIME NOT NULL,
    SalesOrderDueDateKey DATETIME NOT NULL,
    SalesOrderShipDateKey DATETIME NOT NULL,
    SalesOrderModifiedDateKey DATETIME NOT NULL,
    OrderQty INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    UnitPriceDiscount MONEY NOT NULL,
    LineTotal MONEY NOT NULL,
    SalesOrderSubTotal MONEY NOT NULL,
    SalesOrderTaxAmount MONEY NOT NULL,
    SalesOrderFreighAmount MONEY NOT NULL,
    SalesOrderTotalDueAmount MONEY NOT NULL
);

-- We'll create non clusterd indexes for all of the dimension keys
-- that has chance of getting used more
CREATE nonclustered index IN_ProductKey ON Fact.Sales (ProductKey);

CREATE nonclustered index IN_SalesOrderStatusKey ON Fact.Sales (SalesOrderStatusKey);

CREATE nonclustered index IN_SalesOrderCustomerKey ON Fact.Sales (SalesOrderCustomerKey);

CREATE nonclustered index IN_SalesPersonKey ON Fact.Sales (SalesPersonKey);

CREATE nonclustered index IN_TerritoryKey ON Fact.Sales (TerritoryKey);

CREATE nonclustered index IN_SalesOrderDetailModifiedDateKey ON Fact.Sales (SalesOrderDetailModifiedDateKey);

CREATE nonclustered index IN_SalesOrderDateKey ON Fact.Sales (SalesOrderDateKey);

CREATE nonclustered index IN_SalesOrderDueDateKey ON Fact.Sales (SalesOrderDueDateKey);

CREATE nonclustered index IN_SalesOrderShipDateKey ON Fact.Sales (SalesOrderShipDateKey);

CREATE nonclustered index IN_SalesOrderModifiedDateKey ON Fact.Sales (SalesOrderModifiedDateKey);

CREATE nonclustered index IN_BillToAddressKey ON Fact.Sales (BillToAddressKey);

CREATE nonclustered index IN_ShipToAddressKey ON Fact.Sales (ShipToAddressKey);