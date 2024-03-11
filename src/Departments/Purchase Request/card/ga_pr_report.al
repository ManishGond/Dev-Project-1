report 50109 "GA PR Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'GA_PR_Report.rdlc';
   
    dataset
    {
        dataitem("GA PR Subform Table";"GA PR Subform Table")
        {
            column(Type;Type)
            {
               
            }
            column(Line_No_;"Line No.")
            {
               
            }
            column(Item_No;"Item No")
            {
               
            }
            column(Unit_Of_Measure_Code;"Unit Of Measure Code")
            {
               
            }
            column(Description;Description)
            {
               
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