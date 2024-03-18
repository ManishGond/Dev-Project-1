report 50109 "GA PR Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'GA_PR_Report.rdlc';


    dataset
    {
        dataitem(Header; "PurchaseRequisition Table")
        {
            RequestFilterFields="Document No.";
            dataitem("GA PR Subform Table"; "GA PR Subform Table")
            {
                 DataItemLink = "Document No." = field("Document No.");

                column(Type; Type)
                {

                }
                column(Line_No_; "Line No.")
                {

                }
                column(Item_No; "Item No")
                {

                }
                column(Unit_Of_Measure_Code; "Unit Of Measure Code")
                {

                }
                column(Description; Description)
                {

                }
                column(Document_No_; "Document No.")
                {

                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Item_No; "GA PR Subform Table"."Item No")
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}