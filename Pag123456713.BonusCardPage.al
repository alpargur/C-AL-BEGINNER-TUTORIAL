page 123456713 "BonusCard.Page"
{

    Caption = 'BonusCard.Page';
    PageType = Card;
    SourceTable = "BonusHeader.Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'No.';
                }
                field("CustomerNo."; Rec."CustomerNo.")
                {
                    ApplicationArea = All;
                    ToolTip = 'CustomerNo.';
                }
                field(StartDate; Rec.StartDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Start Date';
                }
                field(EndDate; Rec.EndDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'End Date';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Status';
                }
            }
            part(Lines; "BonusSubForm.Page")
            {
                ApplicationArea = All;
                SubPageLink = "DocumentNo." = field("No.");
            }
        }
        area(FactBoxes)
        {
            part(BonusStats; "BonusStatistics.Page")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Caption = 'Bonus Statistics';
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                ToolTip = 'Customer Card';
                Caption = 'Customer Card';
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("CustomerNo.");
            }
            action(BonusEntries)
            {
                ApplicationArea = All;
                ToolTip = 'Bonus Entries';
                Caption = 'Bonus Entries';
                Image = Entry;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "BonusEntries.ListPage";
                RunPageLink = "BonusNo." = field("CustomerNo.");
            }
        }
    }

}
