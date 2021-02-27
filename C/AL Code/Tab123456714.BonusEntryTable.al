table 123456714 "BonusEntry.Table"
{
    Caption = 'BonusEntry.Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "EntryNo."; Integer)
        {
            Caption = 'EntryNo.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "BonusNo."; Code[20])
        {
            Caption = 'DocumentNo.';
            DataClassification = CustomerContent;
            TableRelation = "BonusHeader.Table";
            Editable = false;
        }

        field(3; "DocumentNo."; Code[20])
        {
            Caption = 'DocumentNo.';
            DataClassification = CustomerContent;
            TableRelation = "Sales Invoice Header";
            Editable = false;
        }
        field(4; "ItemNo."; Code[20])
        {
            Caption = 'ItemNo.';
            DataClassification = CustomerContent;
            TableRelation = Item;
            Editable = false;
        }
        field(5; PostingDate; Date)
        {
            Caption = 'PostingDate';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(6; BonusAmount; Decimal)
        {
            Caption = 'BonusAmount';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "EntryNo.")
        {
            Clustered = true;
        }
    }

}
