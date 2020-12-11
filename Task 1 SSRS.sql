




SELECT 
O.Id, TPF.Name AS [RentalPayment/Frequency], TP.PaymentAmount As [RetalPayment],

 CAST (A.Number AS varchar) + ' '+ A.Street + ' ' + A.City + ' ' + A.Region AS [FullAddress], 
 CAST (P.Bedroom AS varchar) AS [NumofBedroom],
 CAST (P.Bathroom AS varchar) AS [NumofBathroom],
  PE.Amount, PE.Date, PE.Description, OS.Name

 FROM Keys.dbo.OwnerProperty AS OP
 LEFT JOIN dbo.Owners AS O ON OP.OwnerId = O.Id
 LEFT JOIN Keys.dbo.OwnershipStatus AS OS ON OP.OwnershipStatusId = OS.Id 
 LEFT JOIN Keys.dbo.Property AS P ON OP.PropertyId =P.ID
 LEFT JOIN Keys.dbo.Address AS A ON  P.AddressId = A.AddressId

 LEFT JOIN dbo.Person AS PER ON A.AddressId = PER.PhysicalAddressId 
 LEFT JOIN dbo.PropertyExpense AS PE ON P.Id = PE.PropertyId
 LEFT JOIN Keys.dbo.TenantProperty AS TP ON TP.PropertyId = P.Id
 LEFT JOIN Keys.dbo.TenantPaymentFrequencies AS TPF ON TPF.ID = TP.PaymentFrequencyId


 WHERE P.Name ='Property A' AND OS.Name = 'owner' ;