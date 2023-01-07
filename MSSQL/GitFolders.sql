use Canned_mPage;
-- alter table directories add constraint FK_Domain_ID foreign key (domain_id) references domain (id) on delete cascade on update cascade
-- create index d_id on directories (domain_id);
-- alter table domain add active_ind int null constraint active_ind_dom default '1';

-- select * from directories;
-- select * from domain do;

select
	('\\PHX00027\'+lower(do.domain_name)+'\custom\mpages\'+d.foldername+'\') as UNC_Path, ('git clone //bhs/groups/BCC_1/cerner/Millennium/mpage/gitrepositories/'+lower(do.domain_name)+'_'+d.foldername+'.git') as Clone_Path
from
	directories d
join domain do on (d.domain_id = do.id)
and d.active_ind = do.active_ind -- Make sure results have identical active_ind.
and d.active_ind = 1; --Only look for active_ind of 1.

-- Create Directory Table:
USE [Canned_mPage]
GO

/****** Object:  Table [dbo].[directories]    Script Date: 12/22/2016 10:51:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[directories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[foldername] [varchar](200) NOT NULL,
	[domain_id] [int] NOT NULL,
	[active_ind] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[directories]  WITH CHECK ADD  CONSTRAINT [FK_Domain_ID] FOREIGN KEY([domain_id])
REFERENCES [dbo].[domain] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[directories] CHECK CONSTRAINT [FK_Domain_ID]
GO

ALTER TABLE [dbo].[directories] ADD  CONSTRAINT [active_ind_def]  DEFAULT ('1') FOR [active_ind]
GO

-- Create Domain Table:
USE [Canned_mPage]
GO

/****** Object:  Table [dbo].[domain]    Script Date: 12/22/2016 10:53:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[domain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domain_name] [varchar](200) NOT NULL,
	[active_ind] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[domain] ADD  CONSTRAINT [active_ind_dom]  DEFAULT ('1') FOR [active_ind]
GO


