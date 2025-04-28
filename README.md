# Välkommen
Välkommen till dennna workshop där vi ska gå igenom Azure Arc och dess kapabiliteter. Vi kommer utgå från en grundläggande förståelse av vad Azure Arc är och hur det fungerar, vi kommer vidare se ifall vi kan mappa detta till er verksamhet och era behov genom att testa olika kapabiliteter som låses upp med Azure Arc. Exempelvis updates och övervakning av resurser som är Arc-enabled. 

Vi kommmer genom workshopen att steg för steg bygga på Azure Arc och se vad för möjligheter som finns. Vi kommer utgå från att använda Azure Jumpstart Arcbox för att snabbt komma igång.

In the workshop you will work with an image processing use case where scanned images are converted into web pages, as outlined in the following image.  
![conceptual architecture](./img/conceptual-architecture.png)
You will work as a developer to design and implement the solution with the help of **GitHub Copilot**. 

The following image illustrates the high level architecture of the componts you will use in the workshop.
![high level architecture](./img/high-level-architecture.png)

1. Before you start you should have been given an introduction to the Copilot capabilities that is available for you today. During the day, see if you can fully utilize the regular Copilot autocompletion for writing code, Copilot Chat for a deeper understanding and a dialog about the different challenges, 
the capabilities in Visual Studio Code to explain errors and the integration with Copilot in error dialogs.
2. To get started fast you would ideally use Codespaces as your development environment. Codepaces is a cloud based service where all needed development tools and frameworks are pre-installed. Other options are using devcontainers locally or develop directly on your machine.
3. You will use VS Code as your editor, either installed locally or accessed via the browser.
4. The first challenge will require you to work with the **Azure AI Document Intelligence** service. Make sure you know the basics of this service before getting started. During the workshop you will also provision an App Service in Azure to host your own API.
5. You should also have access to your own GitHub repo where you can make changes and also configure automated deployments using GitHub Actions.
6. Some additional sample images are available for testing but feel free to try out the solution using your own image files. 

> [!TIP]
> Det kommer finns workshop ledare under dagen som kan hjälpa er med frågor och funderingar. Dock kan man använda Azure CoPilot för att få hjälp. Testa! 




## Struktur
Workshoppen är uppdelad att vi först kommer titta på vad som går att göra med Azure Arc enabled server utan att lägga på extensio (framförallt extensions som kommer med kostnad) och sedan titta vidare på de olika möjligheterna som kommer med det. 


> [!IMPORTANT]  
> Huvudpoängen är inte att göra klart samtliga saker, utan att vara nyfiken och lära sig av de olika funktionerna och hur de kan mappa till verkliga scenaries. Använd era coaches eller workshopdeltagare som bollplank för att diskutea.


Med allt sagt, låt oss hoppa till första [Steg 1: Intro Arc](./Challenge1.md)!

### Challenges
- [Challenge 1: Intro Arc](./Challenge1.md)
- [Challenge 2: Resource Graph med Arc](./Challenge2.md)
- [Challenge 3: Tags](./Challenge3.md)
- [Challenge 4: Monitor](./Challenge4.md)
- [Challenge 5: SQL](./Challenge5.md)
- [Challenge 6: Update](./Challenge6.md)




