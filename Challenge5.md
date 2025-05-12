# Azure Update Manager Exercises
## Granska uppdateringsstatus
I denna övning kommer du att granska uppdateringsstatusen för dina servrar i Azure Update Manager.

1. Öppna Microsoft Azure Portal.
2. Navigera till **Azure Update Manager**. Använd **Search field** högst upp i Azure-portalen för att snabbt hitta resurser och tjänster.
3. I Azure Update Manager, granska sidan **Overview**. Undersök följande information:
    - Uppdateringsstatus för maskiner
    - Status för installation av uppdateringar
    - Väntande Windows-uppdateringar
    - Väntande Linux-uppdateringar
4. I Azure Update Manager, klicka på **Manage > Pending updates**.

---

## Konfigurera underhållskonfiguration
I denna övning kommer du att konfigurera en schemalagd uppdatering för alla Windows-maskiner två dagar efter den andra tisdagen varje månad.

1. Öppna Microsoft Azure Portal.
2. Navigera till **Azure Update Manager** med hjälp av **Search field**.
3. I Azure Update Manager, klicka på **Overview**.
4. På sidan Overview, klicka på **Schedule updates**.
5. På sidan **Create a maintenance configuration**, fyll i följande:
    - **Resource Group**: Skapa en ny resursgrupp med namnet `arcbox-MaintConf`.
    - **Configuration name**: `MonthlyUpdate`.
    - **Region**: Använd samma region som din ArcBox-miljö.
    - **Maintenance scope**: Välj **Guest including Arc-enabled servers**.
    - **Reboot setting**: Reboot if required.
6. Klicka på **Add a schedule**.
7. På sidan **Add/Modify schedule**, konfigurera schemat enligt bilden nedan och klicka sedan på **Save**. ![Update](./img/update1.png)

8. På sidan **Create a maintenance configuration**, klicka på **Next** på följande flikar:
    - **Basic**
    - **Resources**
9. På sidan **Dynamic Scopes**:
    - Klicka på **Add a dynamic scope**.
    - På sidan **Select filter by**, välj ett dynamiskt filter för att inkludera alla Arc-servrar med alla OS-typer. Använd eventuellt Azure Tags för att filtrera resurser. Klicka på **Ok**.
    - Klicka på **Save**.
10. På sidan **Updates**, inkludera alla uppdateringar och klicka sedan på **Next**.
11. På sidan **Events**, hoppa över att trigga några händelser (t.ex. skript) före eller efter uppdateringar och klicka sedan på **Next**.
12. På sidan **Tags**, klicka på **Next**.
13. På sidan **Review**, klicka på **Create**.
14. När distributionen är klar:
     - Navigera till resursgruppen `arcbox-MaintConf` och granska den nya resursen som skapats för underhållskonfigurationen.
     - Navigera till **Azure Update Manager** och granska underhållskonfigurationen under **Manage > Maintenance configuration**.

Du har nu konfigurerat en underhållskonfiguration för att uppdatera alla Arc-aktiverade servrar varje månad. Denna konfiguration inkluderar alla uppdateringar med ett maximalt underhållsfönster på två timmar. Eftersom den använder ett dynamiskt omfång kommer alla framtida Arc-aktiverade servrar också att inkluderas.

---

## Distribuera uppdateringar
I denna övning kommer du att köra en engångsuppdatering för dina Windows-servrar. Innan du distribuerar uppdateringar kommer du att kontrollera om det finns nya uppdateringar.

1. Öppna Microsoft Azure Portal.
2. Navigera till **Azure Update Manager** med hjälp av **Search field**.
3. I Azure Update Manager, klicka på **Check for updates**.
4. I fönstret **Select resource and check for updates**, filtrera vyn för att endast visa Arc-aktiverade servrar med Windows OS.
5. Välj alla Arc-aktiverade servrar i listan.
6. Klicka på **Check for updates**.
7. I Microsoft Azure Portal, under **Notifications**, kommer du att se **Assessment in progress**.
8. När bedömningen är klar:
    - Navigera till **Azure Update Manager > History**.
    - Granska bedömningsstatusen för varje maskin.
9. Navigera till sidan **Azure Update Manager Overview**.
10. På sidan Overview, klicka på **One-time update**.
11. I popup-fönstret **Install updates now**, klicka på **Add machines**.
12. På sidan **Install one-time updates**:
     - Klicka på **Add machines**.
     - På sidan **Select resources**, välj alla Windows-maskiner och klicka sedan på **Next**.
     - På sidan **Updates**, inkludera alla klassificeringar för Windows och klicka sedan på **Next**.
     - På sidan **Properties**, använd standardinställningarna och klicka sedan på **Next**.
     - På sidan **Review + install**, granska alla inställningar och klicka på **Install**.
13. I Microsoft Azure Portal, under **Notifications**, verifiera att du ser ett meddelande om **Install updates request submitted**.
14. I Azure Update Manager, klicka på **Manage > History**.
15. På sidan **History**:
     - Filtrera vyn för att endast visa operationer för **Install updates**.
     - Verifiera att uppdateringar pågår.
16. Efter några minuter, bekräfta att alla uppdateringar visar **Succeeded**.

---

## Rapportering
Azure Update Manager inkluderar en uppsättning rapporter. I denna övning kommer du att granska standardrapporterna.

1. Öppna Microsoft Azure Portal.
2. Navigera till **Azure Update Manager** med hjälp av **Search field**.
3. I Azure Update Manager, expandera **Monitoring** och välj **Reports**.
4. Granska varje flik i standardrapporten **Update Compliance Report**.
5. På sidan **Reports > Update Compliance Report**, klicka på **Workbooks**.
6. På sidan **Reports > Gallery**, öppna **Overview workbook**.
7. I Overview workbook:
    - Välj din prenumeration.
    - Granska all information i workbooken.


## Review Update Status (English)
In this exercise, you will review the update status of your servers in Azure Update Manager.

1. Open the Microsoft Azure Portal.
2. Navigate to **Azure Update Manager**. Use the **Search field** in the top of the Azure portal to quickly find resources and services.
3. In Azure Update Manager, review the **Overview** page. Examine the following information:
    - Update status of machines
    - Update installation status
    - Pending Windows updates
    - Pending Linux updates
4. In Azure Update Manager, click **Manage > Pending updates**.

---

## Configure Maintenance Configuration
In this exercise, you will configure a scheduled update for all Windows machines two days after the second Tuesday of each month.

1. Open the Microsoft Azure Portal.
2. Navigate to **Azure Update Manager** using the **Search field**.
3. In Azure Update Manager, click **Overview**.
4. On the Overview page, click **Schedule updates**.
5. On the **Create a maintenance configuration** page, fill in the following:
    - **Resource Group**: Create a new resource group named `arcbox-MaintConf`.
    - **Configuration name**: `MonthlyUpdate`.
    - **Region**: Use the same region as your ArcBox environment.
    - **Maintenance scope**: Select **Guest including Arc-enabled servers**.
    - **Reboot setting**: Reboot if required.
6. Click **Add a schedule**.
7. On the **Add/Modify schedule** page, configure the schedule as shown in the figure below, then click **Save**. ![Update](./img/update1.png)

8. On the **Create a maintenance configuration** page, click **Next** on the following tabs:
    - **Basic**
    - **Resources**
9. On the **Dynamic Scopes** page:
    - Click **Add a dynamic scope**.
    - On the **Select filter by** page, select a dynamic filter to include all Arc Servers with all OS types. Optionally, use Azure Tags to filter resources. Click **Ok**.
    - Click **Save**.
10. On the **Updates** page, include all updates, then click **Next**.
11. On the **Events** page, skip triggering any events (e.g., scripts) before or after updates, then click **Next**.
12. On the **Tags** page, click **Next**.
13. On the **Review** page, click **Create**.
14. Once the deployment is complete:
     - Navigate to the `arcbox-MaintConf` resource group and review the new resource created for the Maintenance configuration.
     - Navigate to **Azure Update Manager** and review the Maintenance configuration under **Manage > Maintenance configuration**.

You have now configured a Maintenance configuration to update all Arc-enabled servers every month. This configuration includes all updates with a maximum maintenance window of two hours. Since it uses a dynamic scope, all future Arc-enabled servers will also be included.

---

## Deploy Updates
In this exercise, you will run a one-time update for your Windows servers. Before deploying updates, you will check for new updates.

1. Open the Microsoft Azure Portal.
2. Navigate to **Azure Update Manager** using the **Search field**.
3. In Azure Update Manager, click **Check for updates**.
4. In the **Select resource and check for updates** window, filter the view to show only Arc-enabled servers with Windows OS.
5. Select all Arc-enabled servers in the list.
6. Click **Check for updates**.
7. In the Microsoft Azure Portal, under **Notifications**, you will see **Assessment in progress**.
8. Once the assessment is completed:
    - Navigate to **Azure Update Manager > History**.
    - Review the assessment status for each machine.
9. Navigate to the **Azure Update Manager Overview** page.
10. On the Overview page, click **One-time update**.
11. In the **Install updates now** popup, click **Add machines**.
12. On the **Install one-time updates** page:
     - Click **Add machines**.
     - On the **Select resources** page, select all Windows machines, then click **Next**.
     - On the **Updates** page, include all classifications for Windows, then click **Next**.
     - On the **Properties** page, use the default settings, then click **Next**.
     - On the **Review + install** page, review all settings and click **Install**.
13. In the Microsoft Azure Portal, under **Notifications**, verify that you see an **Install updates request submitted**.
14. In Azure Update Manager, click **Manage > History**.
15. On the **History** page:
     - Filter the view to show only **Install updates** operations.
     - Verify that updates are in progress.
16. After a few minutes, confirm that all updates show **Succeeded**.

---

## Reporting
Azure Update Manager includes a set of reports. In this exercise, you will review the default reports.

1. Open the Microsoft Azure Portal.
2. Navigate to **Azure Update Manager** using the **Search field**.
3. In Azure Update Manager, expand **Monitoring** and select **Reports**.
4. Review each tab of the default **Update Compliance Report**.
5. On the **Reports > Update Compliance Report** page, click **Workbooks**.
6. On the **Reports > Gallery** page, open the **Overview workbook**.
7. In the Overview workbook:
    - Select your subscription.
    - Review all information in the workbook.
