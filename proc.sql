
DROP PROCEDURE STP_Report_Dashboard;
DROP PROCEDURE STP_Report_Graph;
DROP PROCEDURE STP_Report_Pie;
DROP PROCEDURE STP_Request_Dashboard;


create
     procedure STP_Report_Dashboard(IN _start datetime, IN _end datetime)
BEGIN
    SELECT status as Type,
           COUNT(1) as Count
    FROM `analyze` a
     WHERE a.created_at >= _start
     AND a.created_at <= _end
    GROUP BY status;
END;

create
     procedure STP_Report_Graph(IN _start datetime, IN _end datetime)
BEGIN
    SELECT a.created_at as Date, COUNT(*) as Count
    FROM `analyze` a
    WHERE created_at >= _start
    AND created_at <= _end
    GROUP BY DATE(created_at);
END;


create
    procedure STP_Report_Pie(IN _start datetime, IN _end datetime)
BEGIN
    SELECT count(1) as count, status as type
    FROM `analyze` a
    WHERE a.created_at >= _start
    AND a.created_at <= _end
GROUP BY status order by status;
END;


create
     procedure STP_Request_Dashboard()
BEGIN
    SELECT count(1) as count, status as type
    FROM `request` r
    WHERE r.type != 'report'
GROUP BY status order by status;
END;
