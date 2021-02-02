SELECT AVG(asrq.completed_at - asrq.started_at) AS average_assistance_request_duration
FROM assistance_requests asrq;