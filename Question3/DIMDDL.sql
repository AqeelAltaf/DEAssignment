CREATE TABLE [Dim].[Customer](
    [CustomerKey] [int] NOT NULL,
    [PersonKey] [int] NULL,
    [StoreID] [int] NULL,
    [TerritoryID] [int] NULL,
    [AccountNumber] [varchar](10) NOT NULL,
    [Customerrowguid] [uniqueidentifier] NOT NULL,
    [CustomerModifiedDate] [datetime] NOT NULL,
    [PersonType] [nchar](2) NULL,
    [NameStyle] [dbo].[NameStyle] NULL,
    [Title] [nvarchar](8) NULL,
    [FirstName] [dbo].[Name] NULL,
    [MiddleName] [dbo].[Name] NULL,
    [LastName] [dbo].[Name] NULL,
    [Suffix] [nvarchar](10) NULL,
    [EmailPromotion] [int] NULL,
    [AdditionalContactInfo] [xml](
        CONTENT [Person].[AdditionalContactInfoSchemaCollection]
    ) NULL,
    [Demographics] [xml](
        CONTENT [Person].[IndividualSurveySchemaCollection]
    ) NULL,
    [Personrowguid] [uniqueidentifier] NULL,
    [PersonModifiedDate] [datetime] NULL,
    [EmailAddress] [nvarchar](50) NULL,
    [EmailAddressID] [int] NULL,
    [Emailrowguid] [uniqueidentifier] NULL,
    [EmailModifiedDate] [datetime] NULL,
    [PhoneNumber] [dbo].[Phone] NULL,
    [PhoneNumberTypeID] [int] NULL,
    [PhoneModifiedDate] [datetime] NULL
)