report 123456711 "BonusOverview.Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bonus Overview Report';

    dataset
    {
        dataitem("BonusHeader.Table"; "BonusHeader.Table")
        {
            RequestFilterFields = "No.", "CustomerNo.";
            column(No_; "No.")
            {
            }
            column(Customer_No_; "CustomerNo.")
            {
            }
            column(Starting_Date; Format("StartDate", 0))
            {
            }
            column(Ending_Date; Format("EndDate", 0))
            {
            }
            column(BonusNoCaptionLbl; BonusNoCaptionLbl)
            {
            }
            column(CustomerNoCaptionLbl; CustomerNoCaptionLbl)
            {
            }
            column(PostingDateCaptionLbl; PostingDateCaptionLbl)
            {
            }
            column(DocumentNoCaptionLbl; DocumentNoCaptionLbl)
            {
            }
            column(BonusAmountCaptionLbl; BonusAmountCaptionLbl)
            {
            }
            column(ItemNoCaptionLbl; ItemNoCaptionLbl)
            {
            }
            column(StartingDateCaptionLbl; StartingDateCaptionLbl)
            {
            }
            column(EndingDateCaptionLbl; EndingDateCaptionLbl)
            {
            }
            dataitem("MNB Bonus Entry"; "BonusEntry.Table")
            {
                DataItemLink = "BonusNo." = field("No.");
                RequestFilterFields = "PostingDate";
                column(Document_No_; "DocumentNo.")
                {
                }
                column(Posting_Date; Format("PostingDate", 0))
                {
                }
                column(Item_No_; "ItemNo.")
                {
                }
                column(Bonus_Amount; "BonusAmount")
                {
                }
            }
        }
    }

    var
        BonusNoCaptionLbl: Label 'Bonus No.';
        CustomerNoCaptionLbl: Label 'Customer No.';
        PostingDateCaptionLbl: Label 'Posting Date';
        DocumentNoCaptionLbl: Label 'Document No.';
        BonusAmountCaptionLbl: Label 'Amount';
        ItemNoCaptionLbl: Label 'Item No.';
        StartingDateCaptionLbl: Label 'Starting Date';
        EndingDateCaptionLbl: Label 'Ending Date';

}
