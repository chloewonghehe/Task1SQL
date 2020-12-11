
SELECT Name, dbo.Property.Id, dbo.OwnerProperty.OwnerId
FROM dbo.Property
FULL OUTER JOIN dbo.OwnerProperty
ON dbo.Property.Id = dbo.OwnerProperty.PropertyId
WHERE OwnerId=1426;