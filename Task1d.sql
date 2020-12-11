Select P.Name, J.JobDescription, J.JobRequestId, JS.Status AS JobStatus
From dbo.Property As P
INNER JOIN dbo.Job AS J ON J.PropertyId = P.Id 
INNER JOIN dbo.JobStatus AS JS ON JS.Id = J.JobStatusId
where JS.Status in ('Open','Pending','InProgress')