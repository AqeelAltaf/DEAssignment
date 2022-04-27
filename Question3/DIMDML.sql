INSERT into
    Dim.Customer
SELECT
    CUS.CustomerID as CustomerKey,
    CUS.PersonID as PersonKey,
    CUS.StoreID as StoreID,
    CUS.TerritoryID as TerritoryID,
    CUS.AccountNumber as AccountNumber,
    CUS.rowguid as Customerrowguid,
    CUS.ModifiedDate as CustomerModifiedDate,
    PER.PersonType,
    PER.NameStyle,
    PER.Title,
    PER.FirstName,
    PER.MiddleName,
    PER.LastName,
    PER.Suffix,
    PER.EmailPromotion,
    PER.AdditionalContactInfo,
    PER.Demographics,
    PER.rowguid as Personrowguid,
    PER.ModifiedDate as PersonModifiedDate,
    PEM.EmailAddress,
    PEM.EmailAddressID,
    PEM.rowguid as Emailrowguid,
    PEM.ModifiedDate as EmailModifiedDate,
    PPH.PhoneNumber,
    PPH.PhoneNumberTypeID,
    PPH.ModifiedDate as PhoneModifiedDate
FROM
    Sales.Customer CUS
    LEFT JOIN Person.Person PER on CUS.PersonID = PER.BusinessEntityID
    LEFT JOIN Person.EmailAddress PEM on PER.BusinessEntityID = PEM.BusinessEntityID
    LEFT JOIN Person.PersonPhone PPH on PER.BusinessEntityID = PPH.BusinessEntityID