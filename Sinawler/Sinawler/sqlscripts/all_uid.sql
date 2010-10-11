if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[all_uid]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[all_uid]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.all_uid
AS
SELECT DISTINCT TOP 100 PERCENT uid, update_time
FROM (SELECT DISTINCT source_uid AS uid, update_time
        FROM user_relation
        UNION ALL
        SELECT DISTINCT target_uid AS uid, update_time
        FROM user_relation) all_uid
ORDER BY update_time, uid

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

