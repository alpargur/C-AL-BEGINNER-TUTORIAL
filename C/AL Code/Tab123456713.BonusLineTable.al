table 123456713 "BonusLine.Table"
{
    Caption = 'BonusLine.Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "DocumentNo."; Code[20])
        {
            Caption = 'DocumentNo.';
            DataClassification = CustomerContent;
            TableRelation = "BonusHeader.Table";
        }
        field(2; Typie; Enum "BonusType.Enum")
        {
            Caption = 'Typie';
            DataClassification = CustomerContent;
        }
        field(3; "ItemNo."; Code[20])
        {
            Caption = 'ItemNo.';
            DataClassification = CustomerContent;
            TableRelation = if (Typie = filter(Item)) Item;
        }
        field(4; BonusPerc; Integer)
        {
            Caption = 'BonusPerc';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
        }
    }
    keys
    {
        key(PK; "DocumentNo.", "Typie", "ItemNo.")
        {
            Clustered = true;
        }
    }

}
