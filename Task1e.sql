
SELECT P.Id, P.Name, OP.OwnerId, PER.FirstName, PER.LastName,
CAST (TP.PaymentAmount as varchar) + '/' + (TPF.Name) AS [PaymentAmountandFrequency],
CASE
WHEN T.IsActive = 1 THEN 'CURRENT'
ELSE 'NOT CURRENT'
END AS TENANTSTAUS

FROM dbo.Tenant AS T 
LEFT JOIN dbo.Person AS PER ON T.ResidentialAddress = PER.PhysicalAddressId 
LEFT JOIN dbo.TenantProperty AS TP ON T.Id = TP.TenantId 
LEFT JOIN dbo.TenantPaymentFrequencies AS TPF ON TP.PaymentFrequencyId = TPF.Id 
LEFT JOIN dbo.Property AS P ON TP.PropertyId = P.Id  
LEFT JOIN dbo.OwnerProperty AS OP ON P.Id = OP.PropertyId
WHERE  OP.OwnerId= '1426' 







