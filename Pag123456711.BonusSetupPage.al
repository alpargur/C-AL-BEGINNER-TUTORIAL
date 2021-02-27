page 123456711 "BonusSetup.Page"
{

    Caption = 'BonusSetupPage';
    PageType = Card;
    SourceTable = BonusSetup;
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("BonusNos."; Rec."BonusNos.")
                {
                    ApplicationArea = All;
                    Caption = 'Bonus Nos.';
                    ToolTip = 'Specifies number series what will be used for bonus numbers.';
                }
            }
        }
    }

}
