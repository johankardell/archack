# SQL

Dags att gå in i lite djupare detaljer och titta närmare på data om SQL Server och SQL databaser. När SQL Server är ARC enabled kommer vi åt dessa resurser genom portalen, precis som om dom låg i Azure.

Steg (work in progress)
* Sök upp Azure Arc i portalen, gå till SQL server instances ![SQL Server Instances](img/ch07_01.png)
* (~~Aktivera login med Entra ID~~- - får fel när jag kör den, behövs troligen mer rättigheter - stryka?)
* Kör Best practice analysis och utvärdera några av rekommendationerna ![Best practice analysis](img/ch07_02.png)
* Öppna fliken Defender for cloud för din SQL Server - vad finns det för Rekommendationer, varningar och Vulnerability assessment findings? ![Defender for cloud](img/ch07_03.png) ![Defender for cloud](img/ch07_04.png)
* Öppna fliken Databases och inspektera vilka databaser som finns ![databases](img/ch07_05.png)
* Öppna fliken Backups och konfigurera backuperna för en av databaserna ![Backups](img/ch07_06.png)
* (Öppna fliken Performance dashboard - kräver SQL Server standard/Enterprise)
* (Gå till fliken Assessment under Migration - kräver SQL Server Standard/Enterprise)
