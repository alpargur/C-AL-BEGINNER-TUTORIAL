pageextension 123456711 "CustomerList.PageExt" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("Bonuses"; "Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Number of assigned bonuses to a customer';
            }
        }
    }
    actions
    {
        addlast(navigation)
        {
            action(MNBBonuses)
            {
                Caption = 'Bonuses';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "BonusList.Page";
                RunPageLink = "CustomerNo." = field("No.");
            }
        }
    }
}
