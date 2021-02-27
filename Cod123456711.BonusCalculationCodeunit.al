codeunit 123456711 "BonusCalculation.Codeunit"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
    var
        RecBonusHeader: Record "BonusHeader.Table";
    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then exit;
        RecBonusHeader.SetRange("CustomerNo.", SalesInvLine."Bill-to Customer No.");
        RecBonusHeader.SetRange(Status, RecBonusHeader.Status::Released);
        RecBonusHeader.SetFilter("StartDate", '..%1', SalesInvLine."Posting Date");
        RecBonusHeader.SetFilter("EndDate", '%1..', SalesInvLine."Posting Date");
        if RecBonusHeader.IsEmpty() then exit;
        if RecBonusHeader.FindSet() then
            repeat
                //insert data into the bonus entry table
                FindBonusForAllItems(RecBonusHeader, SalesInvLine); //use functions
                FindBonusForOneItem(RecBonusHeader, SalesInvLine);
            until RecBonusHeader.Next() = 0;
    end;

    local procedure FindBonusForAllItems(var RecBonusHeader: Record "BonusHeader.Table"; var SalesInvLine: Record "Sales Invoice Line")
    var
        MNBBonusLine: Record "BonusLine.Table";
    begin
        MNBBonusLine.SetRange("DocumentNo.", RecBonusHeader."No.");
        MNBBonusLine.SetRange(Typie, MNBBonusLine.Typie::"All Items"); //filter all items
        if MNBBonusLine.FindFirst() then
            InsertBonusEntry(MNBBonusLine, SalesInvLine); //using defined function
    end;

    local procedure FindBonusForOneItem(var RecBonusHeader: Record "BonusHeader.Table"; var SalesInvLine: Record "Sales Invoice Line");
    var
        MNBBonusLine: Record "BonusLine.Table";
    begin
        MNBBonusLine.SetRange("DocumentNo.", RecBonusHeader."No.");
        MNBBonusLine.SetRange(Typie, MNBBonusLine.Typie::Item); //filter items
        MNBBonusLine.SetRange("ItemNo.", SalesInvLine."No.");
        if MNBBonusLine.FindFirst() then
            InsertBonusEntry(MNBBonusLine, SalesInvLine); //using defined function
    end;

    local procedure InsertBonusEntry(var MNBBonusLine: Record "BonusLine.Table"; var SalesInvLine: Record "Sales Invoice Line")
    var
        MNBBonusEntry: Record "BonusEntry.Table"; //this record is to insert in bonus entry
        EntryNo: Integer;
    begin
        if MNBBonusEntry.FindLast() then
            EntryNo := MNBBonusEntry."EntryNo." + 1 //setting entry no for future rows
        else
            EntryNo := 1;
        MNBBonusEntry.Init();   //initialuze record / table & add values to the fields
        MNBBonusEntry."EntryNo." := EntryNo;
        MNBBonusEntry."BonusNo." := MNBBonusLine."DocumentNo.";
        MNBBonusEntry."DocumentNo." := SalesInvLine."Document No.";
        MNBBonusEntry."ItemNo." := SalesInvLine."No.";
        MNBBonusEntry."PostingDate" := SalesInvLine."Posting Date";
        MNBBonusEntry."BonusAmount" := SalesInvLine."Line Amount" * MNBBonusLine."BonusPerc" / 100; //calc measure
        MNBBonusEntry.Insert(); //insert row
    end;
}
