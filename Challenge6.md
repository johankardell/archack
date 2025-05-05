# Monitor

In this exercise we will first configure Azure Monitor to collect events from Arc-enabled Windows machines. We will later in the lab configure an alert rule for the specific event.

## Data Collection Rule

In Azure Monitor, a data collection rule (DCR) defines what data to collect, from where, and where to send it. A data collection rule is like a set of instructions that tells Azure:

- Which resources to watch (e.g. virtual machines)
- What data to collect (e.g. performance metrics, logs)
- Where to send the data (e.g. Log Analytics, Storage, Event Hub)

We will re-configure an existing data collection rule to also collect events from the Application log on Windows servers.

1. Open the Microsoft Azure Portal
2. Navigate to Data Collection rule. Quickest way to find resources and services in the Azure Portal is to use the “Search field” in the top of the Azure portal
3. On the Data Collection Rules page, click **Create**
4. On the Create Data Collection Rule page, Basics, input:
    - **Name**: CollectTestEvents
    - **Subscription**: Choose your ARCBox subscription
    - **Resource Group**: Create a new resource group named ARCBox-DCR
    - **Region**: Same region as the other ARCBox resources
    - **Platform Type**: Windows
5. On the Create Data Collection Rule page, Basics, click **Next**
6. On the Create Data Collection Rule page, Resources, click **Add resources** and select the ARCBox subscription.
    ![Scope](./img/monitor1.png)
7. On the Create Data Collection Rule page, Resources, click **Next**
8. On the Create Data Collection Rule page, Collect and deliver, select **Windows Event Logs** and select **Application, Warning**. Click **Next**
    ![Collect and deliver](./img/monitor2.png)
9. On the Add Data source, Destination, click **Add destination**
10. Under Destination type, select the Arc Jumpbox Log Analytics workspace
    ![Log Analytics](./img/monitor3.png)
11. On the Add Data source, Destination, click **Add data source**
12. On the Create Data Collection Rule page, Collect and deliver, click **Next**
13. On the Create Data Collection Rule page, Tags, click **Next**
14. On the Create Data Collection Rule page, Review + Create, click **Create**

We have now configured the Data collection rule to collect events with Warning severity in the Application log.

## Generate test event

To generate a test event on one of the Windows servers we can use PowerShell.

1. Connect to the ArcBox-Win2K22 server
2. On the ArcBox-Win2K22 server, start Windows PowerShell
3. In Windows PowerShell, run the following command to register a new event source:

    ```powershell
    New-EventLog -LogName Application -Source ARCBox
    ```

4. In Windows PowerShell, run the following command to generate a test event:

    ```powershell
    Write-EventLog -LogName "Application" -Source "ARCBox" -EventID 1000 -EntryType Warning -Message "TEST from ARCBox"
    ```

5. On the ArcBox-Win2K22 server, open Event Viewer and verify that the event is created.
![Event Viewer](./img/monitor4.png)

## Query Logs and create an alert rule

You can query logs in Azure Monitor when you need to analyse, investigate, or troubleshoot what's happening in your environment. Logs contain detailed records of activity, performance, and issues from your resources.

### Common Scenarios:

- Diagnosing issues (e.g. "Why did this VM crash?")
- Tracking events (e.g. "Who accessed this resource?")
- Monitoring performance (e.g. "How is CPU usage trending?")
- Creating alerts or dashboards using custom log queries

Log queries help you turn raw data into useful insights so you can understand and manage your resources better.

1. Open the Microsoft Azure Portal
2. Navigate to Azure Monitor
3. In Azure Monitor, click **Logs**
4. In Logs, run the following query
![Log Query](./img/monitor5.png)
5. Verify that you see the test event generated earlier
6. Now when we have a working log query, we can create an alert rule.
7. In the Logs window, click **New alert rule**
![New Alert Rule](./img/monitor6.png)
8. On the Create an alert rule page, scroll down and change:
    - **Threshold value** to 1
    - **Frequency of evaluation** to 1 minute
9. On the Create an alert rule page, click **Next**
10. On the Create an alert rule, Actions page, configure **None action**, click **Next**
11. On the Create an alert rule, Details page, fill in:
     - **Subscription**: Choose your ARCBox subscription
     - **Resource Group**: Create a new resource group named ARCBox-Alert
     - **Severity**: Warning
     - **Alert rule name**: ARCBox Alert Rule Event ID 1000
     - **Alert rule description**: Event ID generated on server.
     - **Region**: Same region as the other ARCBox resources
12. On the Create an alert rule, Details page, click **Next**
13. On the Create an alert rule, Tags page, click **Next**
14. On the Create an alert rule, Review + Create page, click **Create**
15. Once the new alert rule is created, navigate to Azure Monitor and click **Alerts**
16. In Azure Monitor, Alerts page, click **Alert Rules** and verify the new alert rule is listed
17. Connect to the ArcBox-Win2K22 server
18. On the ArcBox-Win2K22 server, start Windows PowerShell
19. In Windows PowerShell, run the following command to generate a test event:

     ```powershell
     Write-EventLog -LogName "Application" -Source "ARCBox" -EventID 1000 -EntryType Warning -Message "TEST from ARCBox"
     ```

20. On the ArcBox-Win2K22 server, open Event Viewer and verify that the event is created.
21. In the Microsoft Azure portal, navigate to Monitor and the Alerts page.
22. Verify that you see a new alert based on the event on ArcBox-Win2K22.
![Alert](./img/monitor7.png)
![Alert Details](./img/monitor8.png)
In this exercise you have built an alert rule to generate alerts based on an event in the Application log of Windows servers.

---

## Insights and Dashboards

### Insights

Insights in Azure Monitor are pre-built tools that give you deep visibility into the performance, health, and usage of specific Azure services—like virtual machines, containers, applications, and more. Instead of building everything from scratch, Insights provide:

- Dashboards and visualizations tailored to each service
- Smart recommendations and alerts
- Easy-to-read metrics and logs

#### Examples:

- VM Insights shows CPU, memory, disk, and network usage for virtual machines.
- Container Insights monitors Kubernetes clusters.
- Application Insights tracks app performance and user behaviour.

Insights make it faster and easier to monitor and troubleshoot without needing complex setup.

1. Open the Microsoft Azure Portal
2. Navigate to Monitor, expand **Insights**
3. Under Insights, click **Virtual Machines**
4. Under Virtual Machines, click the **Performance** tab
5. Under Virtual Machines, browse through the different default views in Virtual Machines Insights.

### Dashboards

Dashboards in Azure are customizable views that let you visualize and monitor your resources in one place. You can pin charts, metrics, logs, and more to get a quick overview of what's happening in your environment. Dashboards help you:

- Track performance and health
- Spot issues quickly
- Share views with your team

Dashboards are interactive and can be built to show exactly what matters most to you.

6. Under Virtual Machines, on the Performance tab, select one graph and click the **PIN** icon.
![Pin to Dashboard](./img/monitor9.png)
7. On the Pin to dashboard tab, choose to create a new private dashboard named **ARCBox Dashboard**. Click **Create and pin**.
8. In the Azure Portal, navigate to **Dashboards**.
![Dashboard](./img/monitor10.png)

---

## Workbooks

Azure Monitor Workbooks are flexible, interactive reports that let you visualize data from metrics, logs, and alerts in one place. They help you explore, analyse, and share insights about your Azure resources. With Workbooks, you can:

- Combine charts, tables, text, and filters
- Use KQL queries to dig into data
- Create custom monitoring views for teams

They’re perfect for building rich dashboards and investigations without writing code.

1. Open the Microsoft Azure Portal
2. Navigate to Monitor, expand **Workbooks**
3. Under Workbooks, open the **Alerts workbook**
4. In the Alerts workbook, verify that you can see the alert generated in the previous exercise.
5. In the Alerts workbook, use the **PIN** function to pin the Alerts view to the Dashboard created earlier.
![Pin to Dashboard](./img/monitor11.png)
6. Navigate to Monitor, expand **Workbooks**
7. Browse the different Workbooks.

---

## Dependency Mapper

Dependency Mapper is a feature in VM Insights that shows how your virtual machines and processes connect and interact with each other. It helps you:

- Visualize connections between VMs, ports, and processes
- Understand application dependencies
- Troubleshoot network or performance issues

This map gives a clear view of your system architecture, making it easier to manage and optimize your environment.

### Steps:

1. Open the Microsoft Azure Portal
2. Navigate to Monitor, expand **Insights** and click **Virtual Machines**
3. On the Map page, click **Enable**
4. On the Monitoring configuration tab, click **Edit**
5. On the Monitoring configuration tab, click **Create New**
6. On the Create new rule tab, input the following information:
    - **Data collection rule name**: MapDataCollection
    - **Enable process and dependencies (Map)**: Check checkbox
    - **Subscription**: Choose your ARCBox subscription
    - **Log Analytics workspace**: Select your Jumpstart Log Analytic workspace
7. On the Create new rule tab, click **Create**
![New Rule](./img/monitor12.png)
8. On the Monitoring configuration tab, click **Configure**
9. In the Microsoft Azure Portal, under Notifications, verify that you see **Deployment in progress** event. Wait until the deployment is completed.
10. To enable Dependency Map on all your servers, navigate to **Data Collection Rule** and click the **MSVMI-MapDataCollection** data collection rule.

    - MSVMI stands for Microsoft and VM Insights:
      - MS = Microsoft
      - VMI = VM Insights

11. On the MSVMI-MapDataCollection data collection rule, click **Resources** and **Add all your Jumpstart servers**. When adding servers, the DependencyAgent extension is installed on the server. Click **Refresh** to verify that all servers are listed as resources on the data collection rule.
12. It can take “a couple of minutes” before process and connection data is collected. This might be a good opportunity to refill your coffee.
13. To visualize process and dependencies navigate to Monitor, expand **Insights** and click **Virtual Machines**
14. On the Virtual Machine page, click **Map**
15. Review the standard view, select one of your Jumpstart servers, for example ArcBox-Win2K22.
![Map View](./img/monitor13.png)
16. On the Map page, right side, select **Connections**, then click **Connection details**
17. On the Connections page, review the collected data. Note there is a **PIN to dashboard** option on this view too.
![Connections](./img/monitor14.png)

### Challenge:

Log on to one of the Windows servers in Hyper-V, generate network traffic and use the Connections and Map views to review the traffic generated.

---

## Change Tracking and Inventory

### Enable Change Tracking and Inventory

1. Open the Microsoft Azure Portal
2. Navigate to **Change Tracking and Inventory Center**. Quickest way to find resources and services in the Azure Portal is to use the “Search field” in the top of the Azure portal.
3. On the Change Tracking and Inventory Center page, Machines, select all Jumpstart machines and click **Enable Change Tracking & Inventory**
4. On the Enable Change Tracking page, select all machines and click **Enable**
5. It will take “a couple of minutes” before all machines start reporting inventory data.
6. Once data has been collected, browse views in Change Tracking and Inventory Center to see what data is collected by default.
7. In Change Tracking and Inventory Center, click **Inventory** and then **Settings**

### Challenge:

Explore the Windows File feature to monitor changes in a specific file, for example all files in folder `C:\LABFILES\` on all Windows machines.
