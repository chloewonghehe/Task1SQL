SELECT P.Id, P.Name, OP.OwnerId, PHV.Value, PRP.Amount, TP.StartDate, TP.EndDate, 
TP.PaymentAmount, TPF.Name, PF.Yield, 
CASE 
WHEN TPF.Name = 'Weekly' THEN (DATEDIFF(ww,TP.StartDate , TP.EndDate)* TP.PaymentAmount)
WHEN TPF.Name = 'Fortnightly' THEN  (DATEDIFF(ww,TP.StartDate , TP.EndDate)* TP.PaymentAmount/2)
Else (DATEDIFF(mm,TP.StartDate , TP.EndDate)* TP.PaymentAmount)
END AS TotalRentPayment
From dbo.Property AS P
INNER JOIN dbo.OwnerProperty AS OP
ON P.Id = OP.PropertyId
INNER JOIN dbo.PropertyHomeValue AS PHV
ON p.Id = PHV.PropertyId
INNER JOIN dbo.PropertyRentalPayment AS PRP
ON PRP.PropertyId = P.Id
INNER JOIN dbo.TenantProperty AS TP
On TP.PropertyId = P.Id
INNER JOIN dbo.TenantPaymentFrequencies AS TPF
ON TPF.Id = TP.PaymentFrequencyId
INNER JOIN dbo.PropertyFinance AS PF 
ON P.Id = PF.PropertyId

WHERE OP.OwnerId= '1426' AND
PHV.IsActive ='1'