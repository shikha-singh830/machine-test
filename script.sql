USE [Testing]
GO
/****** Object:  StoredProcedure [dbo].[Get_Registration]    Script Date: 5/20/2021 1:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Registration]    

(    

@action varchar(250),    

@Employee_id int=0

)    

AS    

BEGIN    

	if(@action = 'all')

	begin

	select Employee_id,Employee_Name, Employee_DOB,Gender,Address,State,Hobbies from Emp_Registration 


	end  



	if(@action = 'edit')

	begin

	select Employee_id,Employee_Name, Employee_DOB,Gender,Address,State,Hobbies from Emp_Registration  

	end 

	end

GO
/****** Object:  StoredProcedure [dbo].[select_NewState]    Script Date: 5/20/2021 1:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[select_NewState]  
AS  
BEGIN  
  
    SET NOCOUNT ON;  
    Select * from State_Master  
END  

GO
/****** Object:  StoredProcedure [dbo].[sp_empRegistration]    Script Date: 5/20/2021 1:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_empRegistration]        
(        
@Employee_id int=0,      
@Employee_Name varchar(150),      
@Employee_DOB datetime,        
@Gender varchar(150),         
@Address varchar(150),      
@State varchar(150),
@Hobbies varchar(150)    
)        
 AS      
 if(@Employee_id=0)      
begin       
 Insert into Emp_Registration (Employee_Name,Employee_DOB,Gender,Address,State,Hobbies) values (@Employee_Name,@Employee_DOB,@Gender,@Address,@State,@Hobbies);      
select SCOPE_IDENTITY() retval      
END      
else      
BEGIN        
     if(@Employee_id!=0)                
 begin     
 update Emp_Registration set      
 Employee_Name=@Employee_Name,Employee_DOB=@Employee_DOB,Gender=@Gender,Address=@Address,State=@State,Hobbies=@Hobbies;         

select @Employee_id as retval
END      
  end 

GO
/****** Object:  Table [dbo].[Emp_Registration]    Script Date: 5/20/2021 1:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emp_Registration](
	[Employee_id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Name] [nvarchar](50) NULL,
	[Employee_DOB] [datetime] NULL,
	[Gender] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Hobbies] [nvarchar](50) NULL,
 CONSTRAINT [PK_Emp_Registration] PRIMARY KEY CLUSTERED 
(
	[Employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State_Master]    Script Date: 5/20/2021 1:38:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State_Master](
	[State_Id] [int] IDENTITY(1,1) NOT NULL,
	[State_Code] [nvarchar](5) NULL,
	[State_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_State_Master] PRIMARY KEY CLUSTERED 
(
	[State_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Emp_Registration] ON 

INSERT [dbo].[Emp_Registration] ([Employee_id], [Employee_Name], [Employee_DOB], [Gender], [Address], [State], [Hobbies]) VALUES (1, N'shikha', CAST(N'2020-05-23 00:00:00.000' AS DateTime), N'Female', N'dgvdfgd', N'2', N'Music</br>')
INSERT [dbo].[Emp_Registration] ([Employee_id], [Employee_Name], [Employee_DOB], [Gender], [Address], [State], [Hobbies]) VALUES (2, N'shikha', CAST(N'2021-05-21 00:00:00.000' AS DateTime), N'Male', N'jgbfggh', N'2', N'Cooking</br>')
INSERT [dbo].[Emp_Registration] ([Employee_id], [Employee_Name], [Employee_DOB], [Gender], [Address], [State], [Hobbies]) VALUES (3, N'supriya', CAST(N'2020-05-27 00:00:00.000' AS DateTime), N'Female', N'jgjkfgh,', N'2', N'Reading</br>')
INSERT [dbo].[Emp_Registration] ([Employee_id], [Employee_Name], [Employee_DOB], [Gender], [Address], [State], [Hobbies]) VALUES (4, N'hema', CAST(N'2021-05-25 00:00:00.000' AS DateTime), N'Female', N'jgjghjfgh', N'1', N'Writing')
INSERT [dbo].[Emp_Registration] ([Employee_id], [Employee_Name], [Employee_DOB], [Gender], [Address], [State], [Hobbies]) VALUES (5, N'hema', CAST(N'2021-05-25 00:00:00.000' AS DateTime), N'Female', N'jgjghjfgh', N'1', N'Writing')
INSERT [dbo].[Emp_Registration] ([Employee_id], [Employee_Name], [Employee_DOB], [Gender], [Address], [State], [Hobbies]) VALUES (6, N'shruti', CAST(N'2021-05-14 00:00:00.000' AS DateTime), N'Female', N'hjfhggh', N'2', N'Writing')
SET IDENTITY_INSERT [dbo].[Emp_Registration] OFF
SET IDENTITY_INSERT [dbo].[State_Master] ON 

INSERT [dbo].[State_Master] ([State_Id], [State_Code], [State_Name]) VALUES (1, N'hr', N'haryana')
INSERT [dbo].[State_Master] ([State_Id], [State_Code], [State_Name]) VALUES (2, N'hm', N'himalaya')
SET IDENTITY_INSERT [dbo].[State_Master] OFF
