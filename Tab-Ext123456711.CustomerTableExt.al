tableextension 123456711 "Customer.TableExt" extends Customer
{
    fields
    {
        field(123456711; Bonuses; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("BonusHeader.Table" where("CustomerNo." = field("No.")));
            Editable = false;
        }
    }
    var
        txtLabel: Label 'Cannot delete Customer %1, at least one bonus is assigned!';

    trigger OnBeforeDelete()
    var
        Rec12: Record 123456712; //Bonus Header Table Record
    begin
        if not Rec12.IsEmpty() then
            Error(txtLabel, Rec12."No.");
    end;
}
