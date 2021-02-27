page 123456716 "BonusStatistics.Page"
{

    Caption = 'BonusStatistics.Page';
    PageType = CardPart;
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
                    ToolTip = 'No';
                }
                field(BonusAmount; Rec.BonusAmount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Bonus Amount';
                }
            }
        }
    }

}
