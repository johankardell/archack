# SQL

Dags att gå in i lite djupare detaljer och titta närmare på data om SQL Server och SQL databaser. När SQL Server är ARC enabled kommer vi åt dessa resurser genom portalen, precis som om dom låg i Azure.

Steg (work in progress)
* Sök upp Azure Arc i portalen, gå till SQL server instances
* (~~Aktivera login med Entra ID~~- - får fel när jag kör den, behövs troligen mer rättigheter - stryka?)
* Kör Best practice analysis och utvärdera några av rekommendationerna
* Öppna fliken Defender for cloud för din SQL Server - vad finns det för Rekommendationer, varningar och Vulnerability assessment findings?
* Öppna fliken Databases och inspektera vilka databaser som finns
* Öppna fliken Backups och konfigurera backuperna för en av databaserna
* (Öppna fliken Performance dashboard - kräver SQL Server standard/Enterprise)
* (Gå till fliken Assessment under Migration - kräver SQL Server Standard/Enterprise)
