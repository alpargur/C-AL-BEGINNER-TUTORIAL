page 123456712 "BonusList.Page"
{

    Caption = 'BonusList.Page';
    PageType = Card;
    SourceTable = "BonusHeader.Table";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "BonusCard.Page";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ToolTip = 'No.';
                }
                field("CustomerNo."; Rec."CustomerNo.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                    ToolTip = 'Customer No.';
                }
                field(StartDate; Rec.StartDate)
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                    ToolTip = 'Start';

                }
                field(EndDate; Rec.EndDate)
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                    ToolTip = 'End';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                    ToolTip = 'Status';
                }
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
        }
    }
}
