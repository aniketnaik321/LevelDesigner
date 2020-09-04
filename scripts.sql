USE [CAPFIRST_ONLINE_TLU]
GO
/****** Object:  StoredProcedure [dbo].[GET_AUTO_KEYS]    Script Date: 9/4/2020 1:06:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_AUTO_KEYS] 
	@ACCOUNTS1 BIGINT OUT,
	@CUSTOMERS1 BIGINT OUT,
	@CONTACT_DETAILS_ID BIGINT OUT,
	@CONTACT_ADDRESS_ID BIGINT OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @ACCOUNTS1=(SELECT ISNULL(MAX(ACCOUNTS1),1) FROM [dbo].[CFL_CC_ACCOUNTDETAILS])

	SET @CUSTOMERS1=(SELECT ISNULL(MAX(@CUSTOMERS1),1) FROM [dbo].[CFL_CC_CUSTOMERDETAILS])

	SET  @CONTACT_DETAILS_ID=(SELECT ISNULL(MAX(ID),1) FROM [dbo].[CONTACTS]);
	SET  @CONTACT_ADDRESS_ID=(SELECT ISNULL(MAX(ID),1) FROM [dbo].[CONTACTADDRESSES]);
   
END
GO
/****** Object:  StoredProcedure [dbo].[GetNextInterfaceFileID]    Script Date: 9/4/2020 1:06:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNextInterfaceFileID](
@result int OUT

)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @result=(SELECT ISNULL(MAX(INTERFACEFILEID)+1,1135) FROM InterfaceLog);


	
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_INTERFACE_TABLE]    Script Date: 9/4/2020 1:06:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_INTERFACE_TABLE] 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO INTERFACES
                         (ID, NAME, TYPE, DELIMITER,CONTACTSKEY, LOGSTATUS)
VALUES        (18, N'Contact_CC_Addresses', 5, N'|','CONTACTS', N'Y')

INSERT INTO INTERFACES
                         (ID, NAME, TYPE, DELIMITER,CONTACTSKEY, LOGSTATUS)
VALUES        (19, N'Contact_CC_Phones', 5, N'|','CONTACTS', N'Y')

INSERT INTO INTERFACES
                         (ID, NAME, TYPE, DELIMITER,CONTACTSKEY, LOGSTATUS)
VALUES        (20, N'Contact CC Email', 5, N'|','CONTACTS', N'Y')


INSERT INTO INTERFACES
                         (ID, NAME,CUSTOMERKEY, TYPE, DELIMITER, LOGSTATUS, DESCRIPTION, EAINAME, RECORDTYPE, ACCOUNTSTATUS)
VALUES        (22, N'CCCustomer','CFL_CC_CUSTOMERDETAILS', 2, N'|', N'Y', N'N', N'N', N'N', 0)


INSERT INTO INTERFACES
                         (ID, NAME,CUSTOMERKEY,ACCOUNTKEY, TYPE, DELIMITER, LOGSTATUS, DESCRIPTION, EAINAME, RECORDTYPE, ACCOUNTSTATUS)
VALUES        (22, N'CCAccount','CFL_CC_CUSTOMERDETAILS','CFL_CC_CUSTOMERDETAILS', 2, N'|', N'Y', N'N', N'N', N'N', 0)
	
END 
GO
