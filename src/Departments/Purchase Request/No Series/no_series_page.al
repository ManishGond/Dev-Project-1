page 50102 "No Series Page"
{
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Navigate';
    Caption = 'No. Series List';
    RefreshOnActivate = true;
    SourceTable = "No. Series Table";
    ApplicationArea = All;
    UsageCategory = Documents;

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
                field("Starting Nos."; StartNo)
                {
                    ApplicationArea = All;
                    Caption = 'Starting Nos.';
                    Editable = false;
                    ToolTip = 'Specifies the first number in the series.';
                    Visible = true;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        DrillDownActionOnPage;
                    end;
                }
                field("Ending No."; EndNo)
                {
                    ApplicationArea = All;
                    Caption = 'Ending No.';
                    DrillDown = true;
                    Editable = false;
                    ToolTip = 'Specifies the last number in the series.';

                    trigger OnDrillDown()
                    begin
                        DrillDownActionOnPage;
                    end;
                }
                // field("Process Type"; Rec."Process Type")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Process Type';
                //     DrillDown = true;
                //     Editable = true;
                //     ToolTip = 'Specifies the last number in the series.';
                // }
                // field("Sub Process Type"; Rec."Sub Process Type")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Sub Process Type';
                //     Editable = true;

                //     ToolTip = 'Specifies the date when a number was most recently assigned from the number series.';
                // }
                field("Last Date Used"; LastDateUsed)
                {
                    ApplicationArea = All;
                    Caption = 'Last Date Used';
                    DrillDown = true;
                    Editable = false;
                    ToolTip = 'Specifies the date when a number was most recently assigned from the number series.';

                    trigger OnDrillDown()
                    begin
                        DrillDownActionOnPage;
                    end;
                }
                field("Last No. Used"; LastNoUsed)
                {
                    ApplicationArea = All;
                    Caption = 'Last No. Used';
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the last number that was used from the number series.';

                    trigger OnDrillDown()
                    begin
                        DrillDownActionOnPage;
                    end;

                }

                field(IncrementByNo; IncrementByNo)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Increment-by No.';
                    Editable = false;
                    ToolTip = 'Specifies the value for incrementing the numeric part of the series.';
                    Visible = false;

                    trigger OnDrillDown()
                    begin
                        DrillDownActionOnPage;
                    end;
                }
                field("Default Nos."; rec."Default Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies whether this number series will be used to assign numbers automatically.';
                }
                field("Manual Nos."; rec."Manual Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that you can enter numbers manually instead of using this number series.';
                }
                field("Date Order"; rec."Date Order")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies to check that numbers are assigned chronologically.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Series")
            {
                Caption = '&Series';
                Image = SerialNo;
                action(Lines)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lines';
                    Image = AllLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "No. Series Lines";
                    RunPageLink = "Series Code" = FIELD("Code 1");
                    ToolTip = 'Define additional information about the number series.';
                }
                action(Relationships)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Relationships';
                    Image = Relationship;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "No. Series Relationships";
                    RunPageLink = Code = FIELD("Code 1");
                    ToolTip = 'Define the relationship between number series.';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        UpdateLine(StartDate, StartNo, EndNo, LastNoUsed, WarningNo, IncrementByNo, LastDateUsed);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        StartDate := 0D;
        StartNo := '';
        EndNo := '';
        LastNoUsed := '';
        WarningNo := '';
        IncrementByNo := 0;
        LastDateUsed := 0D;
    end;

    var
        StartDate: Date;
        StartNo: Code[20];
        EndNo: Code[20];
        LastNoUsed: Code[20];
        WarningNo: Code[20];
        IncrementByNo: Integer;
        LastDateUsed: Date;

    local procedure DrillDownActionOnPage()
    begin
        DrillDown;
        CurrPage.Update();
    end;

    procedure UpdateLine(var StartDate: Date; var StartNo: Code[20]; var EndNo: Code[20]; var LastNoUsed: Code[20]; var WarningNo: Code[20]; var IncrementByNo: Integer; var LastDateUsed: Date)
    var
        NoSeriesLine: Record "No. Series Line";
    begin
        FindNoSeriesLineToShow(NoSeriesLine);
        if not NoSeriesLine.Find('-') then
            NoSeriesLine.Init();
        StartDate := NoSeriesLine."Starting Date";
        StartNo := NoSeriesLine."Starting No.";
        EndNo := NoSeriesLine."Ending No.";
        LastNoUsed := NoSeriesLine.GetLastNoUsed;
        WarningNo := NoSeriesLine."Warning No.";
        IncrementByNo := NoSeriesLine."Increment-by No.";
        LastDateUsed := NoSeriesLine."Last Date Used";
    end;

    procedure FindNoSeriesLineToShow(var NoSeriesLine: Record "No. Series Line")
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        NoSeriesMgt.SetNoSeriesLineFilter(NoSeriesLine, Rec."Code 1", 0D);

        if NoSeriesLine.FindLast then
            exit;

        NoSeriesLine.Reset();
        NoSeriesLine.SetRange("Series Code", rec."Code 1");
    end;

    procedure DrillDown()
    var
        NoSeriesLine: Record "No. Series Line";
    begin
        FindNoSeriesLineToShow(NoSeriesLine);
        if NoSeriesLine.Find('-') then;
        NoSeriesLine.SetRange("Starting Date");
        NoSeriesLine.SetRange(Open);
        PAGE.RunModal(0, NoSeriesLine);
    end;
}