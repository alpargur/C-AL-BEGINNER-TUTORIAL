table 123456712 "BonusHeader.Table"
{
    Caption = 'BonusHeader.Table';
    DataClassification = CustomerContent;
    DrillDownPageId = "BonusList.Page";
    LookupPageId = "BonusList.Page";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                MNBBonusSetup: Record BonusSetup;
                NoSeriesManagement: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    MNBBonusSetup.Get();
                    MNBBonusSetup.TestField("BonusNos.");
                    NoSeriesManagement.TestManual(MNBBonusSetup."BonusNos.");
                end;
            end;
        }
        field(2; "CustomerNo."; Code[20])
        {
            Caption = 'CustomerNo.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
            trigger OnValidate()
            begin
                CalcFields(CustomerName);
            end;
        }
        field(3; StartDate; Date)
        {
            Caption = 'StartDate';
            DataClassification = CustomerContent;
        }
        field(4; EndDate; Date)
        {
            Caption = 'EndDate';
            DataClassification = CustomerContent;
        }
        field(5; Status; Enum "BonusStatus.Enum")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(6; "CustomerName"; Text[30])
        {
            Caption = 'Customer Name';
            //DataClassification = CustomerContent; !!!NO DATACLASSIFICATION WITH A FLOWFIELD!!!
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("CustomerNo.")));
        }
        field(7; "BonusAmount"; Decimal)
        {
            Caption = 'Bonus Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("BonusEntry.Table".BonusAmount where("BonusNo." = field("No.")));
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        RecBonusSetup: Record BonusSetup;
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            RecBonusSetup.Get();
            RecBonusSetup.TestField("BonusNos.");
            NoSeriesManagement.InitSeries(RecBonusSetup."BonusNos.", RecBonusSetup."BonusNos.", WorkDate(), "No.", RecBonusSetup."BonusNos.");
        end;
    end;

}
