INSERT into
    Fact.Sales
SELECT
    SOD.SalesOrderDetailID AS SalesOrderDetailKey,
    SOH.SalesOrderID AS SalesOrderKey,
    SOD.ProductID AS ProductKey,
    SOD.SpecialOfferID AS SpecialOfferKey,
    SOH.Status AS SalesOrderStatusKey,
    SOH.OnlineOrderFlag AS SalesOnlineOrderFlag,
    SOH.AccountNumber AS SalesOrderAccountNumber,
    SOH.CustomerID AS SalesOrderCustomerKey,
    ISNULL(SOH.SalesPersonID, 0) AS SalesPersonKey,
    --as it contains null values 
    SOH.TerritoryID AS TerritoryKey,
    SOH.BillToAddressID AS BillToAddressKey,
    SOH.ShipToAddressID AS ShipToAddressKey,
    SOH.ShipMethodID AS ShipMethodKey,
    SOD.ModifiedDate AS SalesOrderDetailModifiedDateKey,
    SOH.OrderDate AS SalesOrderDateKey,
    SOH.DueDate AS SalesOrderDueDateKey,
    SOH.ShipDate AS SalesOrderShipDateKey,
    SOH.ModifiedDate AS SalesOrderModifiedDateKey,
    SOD.OrderQty,
    SOD.UnitPrice,
    SOD.UnitPriceDiscount,
    SOD.LineTotal,
    SOH.SubTotal AS SalesOrderSubTotal,
    SOH.TaxAmt AS SalesOrderTaxAmount,
    SOH.Freight AS SalesOrderFreightAmount,
    SOH.TotalDue AS SalesOrderTotalDueAmount
FROM
    Sales.SalesOrderDetail SOD
    LEFT JOIN Sales.SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID;