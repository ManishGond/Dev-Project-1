page 50102 "No Series Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "No. Series Table";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                ShowCaption = false;
                field("Code 1"; Rec."Code 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a number series code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the number series.';
                }
                field("Starting Nos."; Rec."Starting Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Starting Nos.';
                    Editable = true;
                    ToolTip = 'You use this field if you want to start a new series at the beginning of a new period. You set up a number series line for each period. The program will automatically switch to the new series on the starting date.';
                    Visible = true;
                }
                field("Ending No."; Rec."Ending No.")
                {
                    ApplicationArea = All;
                    Caption = 'Ending No.';
                    DrillDown = true;
                    Editable = true;
                    ToolTip = 'Specifies the first number in the series.';
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = All;
                    Caption = 'Process Type';
                    DrillDown = true;
                    Editable = true;
                    ToolTip = 'Specifies the last number in the series.';
                }
                field("Sub Process Type"; Rec."Sub Process Type")
                {
                    ApplicationArea = All;
                    Caption = 'Sub Process Type';
                    Editable = true;
                    ToolTip = 'Specifies the date when a number was most recently assigned from the number series.';
                }
                field("Last Date Used"; Rec."Last Date Used")
                {
                    ApplicationArea = All;
                    Caption = 'Last Date Used';
                    DrillDown = true;
                    Editable = true;
                    ToolTip = 'Specifies the last number that was used from the number series.';
                }
                field("Last No. Used"; Rec."Last No. Used")
                {
                    ApplicationArea = All;
                    Caption = 'Last No. Used';
                    Editable = true;
                    ToolTip = 'Specifies when you want to receive a warning that the number series is running out. You enter a number from the series. The program will provide a warning when this number is reached. You can enter a maximum of 20 characters, both numbers and letters.';
                    Visible = true;

                }
                field("Default Nos."; Rec."Default Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Default Nos.';
                    Editable = false;
                    ToolTip = 'Specifies the value for incrementing the numeric part of the series.';
                    Visible = false;
                }
                field("Manual Nos."; Rec."Manual Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this number series will be used to assign numbers automatically.';
                    Caption = 'Manual Nos.';
                }
                field("Date Order"; Rec."Date Order")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies to check that numbers are assigned chronologically.';
                    Caption = 'Date Order';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}