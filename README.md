# Business Central AL-Beginner Tutorial
---
This AL Project is an implementation of AL-Beginner Notebook created by "KRZYSZTOF BIALOWAS". The notebook is also included in the docs file. If you want to find more about you can visit his [website](http://www.mynavblog.com/2021/02/16/automated-tests-dont-listen-to-microsoft/).
## Project Notes & Steps
---
### Tables
- **BonusSetupTable**: 
  - Stores BonusNos.

- **CustomerTableExtension**: 
  - Adds a flowfield counts the number of bonuses for customer available at BonusHeaderTable.
  - OnBeforeDelete Trigger: Checks if the customer has a recorded bonus in BonusHeaderTable, if so it cannot be removed.

- **BonusHeaderTable**:
  -  CustomerName is a FlowField and extracted through look up at Customer Table (comparing custno & no)
  -  BonusAmount is also FlowField and its the sum of BonusAmount in BonusEntry table assigbed to BonusNo = No)
  -  Also an OnInsert trigger checks if the No. field is empty in that case gets the BonusNo. from BonusSetup & initializes it.

- **BonusLineTable**:
  - DocNo(FK)(PK)(connected to BonusHeaderTab), Typie(PK), ItemNo(PK)
  - Typie & ItemNo -> User-defined Enum

- **BonusEntryTable**:
  - BonusNo(FK) -> BonusHeaderTable
  - DocumentNo(FK) -> Sales Invoice Header
  - ItemNo(FK) -> Item
---
### Pages
- **CustomerListPageExt**:
  - Adds field Bonuses
  - Adds action(Bonuses) -> runs **BonusListPage**, RunPageLink = "CustomerNo." = field("No.)

- **BonusSetupPage**:
  - BonusNo field
  - UsageCategory = Administration;
  - InsertAllowed = false;
  - DeleteAllowed = false;

- **BonusListPage**:
  - All fields until Status
  - UsageCategory = Lists;
  - Editable = false;
  - CardPageId = "BonusCard.Page";
  - action(CustomerCard) -> RunObject = page "Customer Card", RunPageLink = "No." = field("CustomerNo.")
    - Runs throught customer card to add the related customers

- **BonusCardPage**:
  - All fields until Status
  - SourceTable = "BonusHeader.Table";
  - part(Lines; "BonusSubForm.PAge")
  - area(FactBoxes)
    - part(BonusStats; "BonusStatistics.Page")
  - area(Navigation)
    - action(CustomerCard) -> RunObject = page "Customer Card", RunPageLink = "No." = field("CustomerNo.")
    - action(BonusEntries) -> RunObject = page "BonusEntries.ListPage", RunPageLink = "BonusNo." = field("CustomerNo.")

- **BonusSubFormListPart**:
  - Displays BonusLineTable
  - Embedded in BonusCardPage

- **BonusEntriesListPage**:
  - editable = false;
  - Displays = BonusEntryTable

- **BonusStatisticsCardPart**:
  - Displays -> BonusHEaderTab(No., BonusAmount)
  - Embedded in -> BonusCardPage
---
### User-defined Enums
- enum **BonusType**:
  - 0: All Items
  - 1: Item

- enum **BonusStatus**:
  - 0: Open
  - 1: Released
---
### Codeunit
- **BonusCalculation.Codeunit**:
  - This code unit is an eventsubscriber. Whenever a new sales line insert event takes place, this code unit will be executed righ after the insert operation. It handles the calcualtion and insertion for bonus in the BonusEntryTable according to pre-defined conditions.
---
### Report
**BonusOverview.Report**:
- UsageCategory = ReportAndAnalysis;
- ApplicationArea = All;
- Content:
  - dataitem("BonusHeaderTable"; "BonusHeaderTable") -> RequestFilterFields = "No.", "CustomerNo."
  - dataitem("BonusEntry"; "BonusEntry.Table") -> RequestFilter = "PostingDate"