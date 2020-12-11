
SELECT P.Id, P.Name, OP.OwnerId,PHV.Value
FROM dbo.Property AS P
INNER JOIN dbo.OwnerProperty AS OP
ON P.Id = OP.PropertyId
INNER JOIN dbo.PropertyHomeValue AS PHV
ON P.Id= PHV.PropertyId
WHERE OP.OwnerId= '1426'
AND PHV.IsActive= '1'





