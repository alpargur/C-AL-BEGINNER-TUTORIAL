page 123456715 "BonusEntries.ListPage"
{

    Caption = 'BonusEntries.ListPage';
    PageType = List;
    SourceTable = "BonusEntry.Table";
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("EntryNo."; Rec."EntryNo.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies entry number for the ledger.';
                    Caption = 'Entry No';
                }
                field("BonusNo."; Rec."BonusNo.")
                {
                    ApplicationArea = All;
                    Caption = 'Bonus No.';
                    ToolTip = 'Bonus No.';
                }
                field("DocumentNo."; Rec."DocumentNo.")
                {
                    ApplicationArea = All;
                    Caption = 'Document No';
                    ToolTip = 'Specifies sales invoice number.';
                }
                field("ItemNo."; Rec."ItemNo.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No';
                    ToolTip = 'Item No';
                }
                field(PostingDate; Rec.PostingDate)
                {
                    ApplicationArea = All;
                    Caption = 'Posting Date';
                    ToolTip = 'Posting Date';
                }
                field(BonusAmount; Rec.BonusAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Bonus Amount';
                    ToolTip = 'Calculated Bonus';
                }
            }
        }
    }

}
