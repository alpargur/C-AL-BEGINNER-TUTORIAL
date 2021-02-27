page 123456714 "BonusSubForm.Page"
{

    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "BonusLine.Table";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("ItemNo."; Rec."ItemNo.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Item No.';
                }
                field(Typie; Rec.Typie)
                {
                    ApplicationArea = All;
                    ToolTip = 'its type bitch!';
                }
                field(BonusPerc; Rec.BonusPerc)
                {
                    ApplicationArea = All;
                    ToolTip = 'Bonus Percent';
                }
            }
        }
    }

}
