﻿#include Once "Panel.bi"
#include Once "Menus.bi"
#include Once "ImageList.bi"

Namespace My.Sys.Forms
    #DEFINE QTabControl(__Ptr__) *Cast(TabControl Ptr,__Ptr__)
    #DEFINE QTabPage(__Ptr__) *Cast(TabPage Ptr, __Ptr__)

    Enum TabStyle
        tsTabs,tsButtons,tsOwnerDrawFixed
    End Enum

    Enum TabPosition
        tpTop,tpBottom,tpLeft,tpRight
    End Enum

    Type PTabControl As TabControl Ptr
    
    Type TabPage Extends Panel
        Protected:
            FCaption   As WString Ptr
            FObject    As Any Ptr
            FImageIndex     As Integer
            FImageKey     As WString Ptr
        Public:  
            TabPageControl As PTabControl
            Declare Property Index As Integer
            Declare Property Caption ByRef As WString
            Declare Property Caption(ByRef Value As WString)
            Declare Property Object As Any Ptr
            Declare Property Object(Value As Any Ptr)
            Declare Property ImageIndex As Integer
            Declare Property ImageIndex(Value As Integer)
            Declare Property ImageKey ByRef As WString
            Declare Property ImageKey(ByRef Value As WString)
            Declare Operator Let(ByRef Value As WString)
            Declare Operator Cast As Control Ptr
            Declare Operator Cast As Any Ptr
            Declare Sub SelectTab()
            Declare Sub Update()
            Declare Constructor
            Declare Destructor
            OnSelected   As Sub(BYREF Sender As TabPage)
            OnDeSelected As Sub(BYREF Sender As TabPage) 
    End Type

    Type TabControl Extends ContainerControl
        Private:
            FTabIndex     As Integer
            FTabCount     As Integer 
            FMultiline    As Boolean
            FFlatButtons  As Boolean
            FTabPosition  As My.Sys.Forms.TabPosition
            FTabStyle     As My.Sys.Forms.TabStyle
            Declare Sub SetMargins()
            Declare Static Sub WndProc(BYREF Message As Message)
            Declare Static Sub HandleIsAllocated(BYREF Sender As Control)
            Declare Sub ProcessMessage(BYREF Message As Message)
        Public:
            Images        As ImageList Ptr
            Tabs             As TabPage Ptr Ptr
            Declare Property TabIndex As Integer
            Declare Property TabIndex(Value As Integer)
            Declare Property TabCount As Integer
            Declare Property TabCount(Value As Integer)
            Declare Property TabPosition As My.Sys.Forms.TabPosition
            Declare Property TabPosition(Value As My.Sys.Forms.TabPosition)
            Declare Property TabStyle As My.Sys.Forms.TabStyle
            Declare Property TabStyle(Value As My.Sys.Forms.TabStyle)
            Declare Property FlatButtons As Boolean
            Declare Property FlatButtons(Value As Boolean)
            Declare Property Multiline As Boolean
            Declare Property Multiline(Value As Boolean)
            Declare Property SelectedTab As TabPage Ptr
            Declare Property SelectedTab(Value As TabPage Ptr)
            Declare Property Tab(Index As Integer) As TabPage Ptr
            Declare Property Tab(Index As Integer, Value As TabPage Ptr)
            Declare Function ItemLeft(Index As Integer) As Integer
            Declare Function ItemTop(Index As Integer) As Integer
            Declare Function ItemWidth(Index As Integer) As Integer
            Declare Function ItemHeight(Index As Integer) As Integer
            Declare Operator Cast As My.Sys.Forms.Control Ptr
            Declare Function IndexOfTab(Value As TabPage Ptr) As Integer
            Declare Function AddTab(ByRef Caption As WString, AObject As Any Ptr = 0, ImageIndex As Integer = -1) As TabPage Ptr
            Declare Function AddTab(ByRef Caption As WString, AObject As Any Ptr = 0, ByRef ImageKey As WString) As TabPage Ptr
            Declare Sub AddTab(ByRef tTab As TabPage Ptr)
            Declare Sub DeleteTab(Index As Integer)
            Declare Sub InsertTab(Index As Integer, ByRef Caption As WString, AObject As Any Ptr = 0)
            Declare Sub Clear
            Declare Constructor
            Declare Destructor
            OnSelChange   As Sub(BYREF Sender As TabControl)
            OnSelChanging As Sub(BYREF Sender As TabControl)
            OnGotFocus   As Sub(BYREF Sender As TabControl)
            OnLostFocus   As Sub(BYREF Sender As TabControl)
    End Type

    Property TabPage.Index As Integer
        If TabPageControl Then
            Return TabPageControl->IndexOfTab(@This)
        End If
        Return -1
    End Property
        
    Sub TabPage.Update()
        If TabPageControl Then
            If TabPageControl->Handle Then
                Dim As TCITEM Ti
                Ti.mask = TCIF_TEXT OR TCIF_IMAGE OR TCIF_PARAM
                TabPageControl->Perform(TCM_GETITEM, Index, CInt(@Ti))
                Ti.cchTextMax = Len(*FText) + 1
                Ti.pszText = FCaption
                If FObject Then Ti.lparam = Cast(LParam, FObject)
                If TabPageControl->Images AndAlso FImageKey <> 0 Then
                    Ti.iImage = TabPageControl->Images->IndexOf(*FImageKey)
                Else
                    Ti.iImage = FImageIndex
                End If
                TabPageControl->Perform(TCM_SETITEM,Index,CInt(@Ti)) 
            End If
        End If
    End Sub
    
    Sub TabPage.SelectTab()
        If TabPageControl Then
            TabPageControl->TabIndex = Index
        End If
    End Sub
    
    Property TabPage.Caption ByRef As WString
        Return *FCaption
    End Property

    Property TabPage.Caption(ByRef Value As WString)
        FCaption = Cast(WString Ptr, ReAllocate(FCaption, (Len(Value) + 1) * SizeOf(WString)))
        *FCaption = Value
        Update
    End Property

    Property TabPage.Object As Any Ptr
        Return FObject
    End Property

    Property TabPage.Object(Value As Any Ptr)
        FObject = Value
        Update
    End Property

    Property TabPage.ImageIndex As Integer
        Return FImageIndex
    End Property

    Property TabPage.ImageIndex(Value As Integer)
        FImageIndex = Value
        Update
    End Property

    Property TabPage.ImageKey ByRef As WString
        Return *FImageKey
    End Property

    Property TabPage.ImageKey(ByRef Value As WString)
        WLet FImageKey, Value
        Update
    End Property

    Operator TabPage.Cast As Any Ptr
        Return @This
    End Operator

    Operator TabPage.Let(ByRef Value As WString)
        Caption = Value
    End Operator
    
    Operator TabPage.Cast As Control Ptr 
        Return Cast(Control Ptr, @This)
    End Operator

    Constructor TabPage
        Caption = ""
        FObject    = 0
        FImageIndex        = 0
        Align = 5
        AnchorLeft = asAnchor
        AnchorTop = asAnchor
        AnchorRight = asAnchor
        AnchorBottom = asAnchor
    End Constructor

    Destructor TabPage
        If FCaption Then Deallocate FCaption
    End Destructor
    
    Property TabControl.TabIndex As Integer
       Return Perform(TCM_GETCURSEL,0,0)
    End Property
        
    Property TabControl.TabIndex(Value As Integer)
        FTabIndex = Value
        If Handle Then
            Perform(TCM_SETCURSEL,FTabIndex,0)
            Dim Id As Integer = TabIndex
            For i As Integer = 0 To TabCount - 1
                ShowWindow(Tabs[i]->Handle, Abs_(i = Id))
            Next i
            RequestAlign
            If OnSelChange Then OnSelChange(This)
        End If
    End Property

    Sub TabControl.SetMargins()
        Select Case FTabPosition
        Case 0: Base.SetMargins 2, 4 + ItemHeight(0), 4, 3
        Case 1: Base.SetMargins 2, 2, 2, 4 + ItemHeight(0)
        Case 2: Base.SetMargins 4 + ItemWidth(0), 2, 4, 3
        Case 3: Base.SetMargins 2, 2, 4 + ItemWidth(0), 3
        End Select
    End Sub
    
    Property TabControl.TabPosition As My.Sys.Forms.TabPosition
        Return FTabPosition 
    End Property
        
    Property TabControl.TabPosition(Value As My.Sys.Forms.TabPosition)
        FTabPosition = Value
        Select Case FTabPosition
           Case 0
            ChangeStyle(TCS_BOTTOM, False)
            ChangeStyle(TCS_RIGHT, False)
            ChangeStyle(TCS_VERTICAL, False)
            If Not FMultiline Then ChangeStyle(TCS_MULTILINE, False)
            If Not FTabStyle = tsOwnerDrawFixed Then ChangeStyle(TCS_OWNERDRAWFIXED, False)
           Case 1
            ChangeStyle(TCS_RIGHT, False)
            ChangeStyle(TCS_VERTICAL, False)
            ChangeStyle(TCS_BOTTOM, True)
            If Not FMultiline Then ChangeStyle(TCS_MULTILINE, False)
            If Not FTabStyle = tsOwnerDrawFixed Then ChangeStyle(TCS_OWNERDRAWFIXED, False)
           Case 2
            ChangeStyle(TCS_BOTTOM, False)
            ChangeStyle(TCS_RIGHT, False)
            ChangeStyle(TCS_MULTILINE, True)
            ChangeStyle(TCS_VERTICAL, True)
            ChangeStyle(TCS_OWNERDRAWFIXED, True)
        Case 3
            ChangeStyle(TCS_BOTTOM, False)
            ChangeStyle(TCS_MULTILINE, True)
            ChangeStyle(TCS_VERTICAL, True)
            ChangeStyle(TCS_RIGHT, True)
            ChangeStyle(TCS_OWNERDRAWFIXED, True)
        End Select
        SetMargins
    End Property
        
    Property TabControl.TabStyle As My.Sys.Forms.TabStyle
       Return FTabStyle
    End Property
        
    Property TabControl.TabStyle(Value As My.Sys.Forms.TabStyle)
        FTabStyle = Value
           Select Case FTabStyle
           Case 0
            ChangeStyle TCS_BUTTONS, False
            ChangeStyle TCS_OWNERDRAWFIXED, False
            ChangeStyle TCS_TABS, True
       Case 1
            ChangeStyle TCS_TABS, False
            ChangeStyle TCS_OWNERDRAWFIXED, False
            ChangeStyle TCS_BUTTONS, True   
       Case 2
               ChangeStyle TCS_TABS, False
            ChangeStyle TCS_BUTTONS, False
            ChangeStyle TCS_OWNERDRAWFIXED, True
       End Select
    End Property
        
    Property TabControl.FlatButtons As Boolean
       Return FFlatButtons
    End Property
        
    Property TabControl.FlatButtons(Value As Boolean)
       FFlatButtons = Value
       Select Case FFlatButtons
       Case True
           If (Style AND TCS_FLATBUTTONS) <> TCS_FLATBUTTONS Then
              Style = Style OR TCS_FLATBUTTONS
           End If
       Case False
           If (Style AND TCS_FLATBUTTONS) = TCS_FLATBUTTONS Then
              Style = Style AND NOT TCS_FLATBUTTONS
           End If
       End Select 
       'RecreateWnd
    End Property
        
    Property TabControl.Multiline As Boolean
       Return FMultiline
    End Property
        
    Property TabControl.Multiline(Value As Boolean)
       FMultiline = Value
       Select Case FMultiline
       Case False
           If (Style AND TCS_MULTILINE) = TCS_MULTILINE Then
              Style = Style AND NOT TCS_MULTILINE
           End If
           If (Style AND TCS_SINGLELINE) <> TCS_SINGLELINE Then
              Style = Style OR TCS_SINGLELINE
           End If
       Case True
           If (Style AND TCS_MULTILINE) <> TCS_MULTILINE Then
              Style = Style OR TCS_MULTILINE
           End If
           If (Style AND TCS_SINGLELINE) = TCS_SINGLELINE Then
              Style = Style AND NOT TCS_SINGLELINE
           End If
       End Select
       RecreateWnd
    End Property
        
    Property TabControl.TabCount As Integer
       If Handle Then
           FTabCount = Perform(TCM_GETITEMCOUNT,0,0)
           Return FTabCount
       Else
           Return FTabCount
       End If
    End Property
        
    Property TabControl.TabCount(Value As Integer)
    End Property
        
    Property TabControl.Tab(Index As Integer) As TabPage Ptr
       Return Tabs[Index]
    End Property
        
    Property TabControl.Tab(Index As Integer,Value As TabPage Ptr)
    End Property
    
    Property TabControl.SelectedTab As TabPage Ptr
        If TabIndex >= 0 And TabIndex <= TabCount - 1 Then
            Return Tabs[TabIndex]
        Else
            Return 0
        End If
    End Property
        
    Property TabControl.SelectedTab(Value As TabPage Ptr)
        TabIndex = IndexOfTab(Value)
    End Property
    
    Function TabControl.ItemHeight(Index As Integer) As Integer
        If Index >= 0 AND Index < TabCount Then
            Dim As Rect R
            Perform(TCM_GETITEMRECT,Index,CInt(@R))
            Return (R.Bottom - R.Top)
        End If
    End Function

    Function TabControl.ItemWidth(Index As Integer) As Integer
        If Index >= 0 AND Index < TabCount Then
            Dim As Rect R
            Perform(TCM_GETITEMRECT,Index,CInt(@R))
            Return (R.Right - R.Left)
        End If
    End Function

    Function TabControl.ItemLeft(Index As Integer) As Integer
        If Index >= 0 AND Index < TabCount Then
            Dim As Rect R
            Perform(TCM_GETITEMRECT,Index,CInt(@R))
            Return R.Left
        End If
    End Function

    Function TabControl.ItemTop(Index As Integer) As Integer
        If Index >= 0 AND Index < TabCount Then
            Dim As Rect R
            Perform(TCM_GETITEMRECT,Index,CInt(@R))
            Return R.Top
        End If
    End Function

    Sub TabControl.WndProc(BYREF Message As Message)
    End Sub

    Sub TabControl.HandleIsAllocated(ByRef Sender As Control)
        If Sender.Child Then
            With QTabControl(Sender.Child)
                If .Images Then .Images->ParentWindow = .Handle
                If .Images AndAlso .Images->Handle Then .Perform(TCM_SETIMAGELIST,0,CInt(.Images->Handle))
                For i As Integer = 0 To .FTabCount - 1
                    Dim As TCITEMW Ti
                    Ti.mask = TCIF_TEXT OR TCIF_IMAGE OR TCIF_PARAM
                    Ti.pszText    = @(.Tabs[i]->Caption)
                    Ti.cchTextMax = Len(.Tabs[i]->Caption) + 1
                    If .Images AndAlso .Tabs[i]->ImageKey <> "" Then
                        Ti.iImage = .Images->IndexOf(.Tabs[i]->ImageKey)
                    Else
                        Ti.iImage = .Tabs[i]->ImageIndex
                    End If
                    'If .Tabs[i]->Object Then Ti.lParam = Cast(LPARAM, .Tabs[i]->Object)
                    Ti.lParam = Cast(LPARAM, .Handle)
                    .Perform(TCM_INSERTITEM, i, CInt(@Ti))
                 Next
                .SetMargins
                If .TabCount > 0 Then .Tabs[0]->BringToFront()
            End With
        End If
    End Sub

    Sub TabControl.ProcessMessage(BYREF Message As Message)
        Select Case Message.Msg
        Case CM_DRAWITEM
            If FTabPosition = tpLeft Or FTabPosition = tpRight Then
                Dim As LogFont LogRec
                  Dim As hFont OldFontHandle, NewFontHandle
                Dim hdc as hdc
                GetObject Font.Handle, SizeOf(LogRec), @LogRec
                  LogRec.lfEscapement = 90 * 10
                  NewFontHandle = CreateFontIndirect(@LogRec)
                hdc = GetDc(FHandle)
                OldFontHandle = SelectObject(hdc, NewFontHandle)
                SetBKMode(hdc,TRANSPARENT)
                For i As Integer = 0 To TabCount - 1
                    .TextOut(hdc,IIF(FTabPosition = tpLeft, 2, This.Width - ItemWidth(i)),ItemTop(i) + ItemHeight(i) - 5,Tabs[i]->Caption,Len(Tabs[i]->Caption))
                Next i
                SetBKMode(hdc,OPAQUE)
                NewFontHandle = SelectObject(hdc, OldFontHandle)
                  ReleaseDc FHandle, hdc
                DeleteObject(NewFontHandle)
            End If
            Message.Result = 0
        Case WM_SIZE
        Case CM_COMMAND
        Case CM_NOTIFY
            Dim As LPNMHDR NM 
            NM = Cast(LPNMHDR,Message.lParam)
            If NM->Code = TCN_SELCHANGE Then
                TabIndex = TabIndex
            End If
        End Select
        Base.ProcessMessage(Message)
    End Sub

    Function TabControl.AddTab(ByRef Caption As WString, aObject As Any Ptr = 0, ImageIndex As Integer = -1) As TabPage Ptr
        FTabCount += 1
        Dim tb As TabPage Ptr = New TabPage
        tb->Caption = Caption
        tb->Object = AObject
        tb->ImageIndex = ImageIndex
        tb->TabPageControl = @This
        Tabs = Reallocate(Tabs, SizeOF(TabPage) * FTabCount)
        Tabs[FTabCount - 1] = tb
        This.Add(tb)
        If Handle Then  
            Dim As TCITEMW Ti
            Dim As Integer LenSt = Len(Caption) + 1
            Dim As WString Ptr St = CAllocate(LenSt * Len(WString))
            St = @Caption
            Ti.mask = TCIF_TEXT OR TCIF_IMAGE OR TCIF_PARAM
            Ti.pszText    = St
            Ti.cchTextMax = LenSt
            If Tabs[FTabCount - 1]->Object Then Ti.lParam = Cast(LPARAM, Tabs[FTabCount - 1]->Object)
            Ti.iImage = Tabs[FTabCount - 1]->ImageIndex
            SendmessageW(FHandle, TCM_INSERTITEMW, FTabCount - 1, CInt(@Ti))
            If FTabCount = 1 Then SetMargins
        End If
        tb->Visible = FTabCount = 1
        Return Tabs[FTabCount - 1]
    End Function
    
    Function TabControl.AddTab(ByRef Caption As WString, aObject As Any Ptr = 0, ByRef ImageKey As WString) As TabPage Ptr
        Dim tb As TabPage Ptr
        If Images Then
            tb = AddTab(Caption, aObject, Images->IndexOf(ImageKey))
        Else
            tb = AddTab(Caption, aObject, -1)
        End If
        If tb Then tb->ImageKey = ImageKey
        Return tb
    End Function
    
    Sub TabControl.AddTab(ByRef tp As TabPage Ptr)
        FTabCount += 1
        tp->TabPageControl = @This
        Tabs = Reallocate(Tabs, SizeOF(TabPage) * FTabCount)
        Tabs[FTabCount - 1] = tp
        If Handle Then
            Dim As TCITEMW Ti
            Dim As WString Ptr St
            WLet St, tp->Caption
            Ti.mask = TCIF_TEXT OR TCIF_IMAGE OR TCIF_PARAM
            Ti.pszText    = St
            Ti.cchTextMax = Len(tp->Caption)
            If tp->Object Then Ti.lParam = Cast(LPARAM, tp->Object)
                Ti.iImage = tp->ImageIndex
                SendmessageW(FHandle, TCM_INSERTITEMW, FTabCount - 1, CInt(@Ti))
                If FTabCount = 1 Then SetMargins
        End If
        This.Add(Tabs[FTabCount - 1])
        tp->Visible = FTabCount = 1
    End Sub
    
    Sub TabControl.DeleteTab(Index As Integer)
        Dim As Integer i
        Dim As TabPage Ptr It
        If Index >= 0 AND Index <= FTabCount -1 Then
            This.Remove(Tabs[Index])
            For i = Index + 1 To FTabCount -1
                It = Tabs[i]
                Tabs[i - 1] = It
            Next i
            FTabCount -= 1 
            Tabs = ReAllocate(Tabs,FTabCount*SizeOF(TabPage))
            Perform(TCM_DELETEITEM,Index,0)
            If Index > 0 then
                TabIndex = Index - 1
            ElseIf Index < TabCount - 1 then
                TabIndex = Index + 1
            End if
            If FTabCount = 0 Then SetMargins
        End If
    End Sub
        
    Sub TabControl.InsertTab(Index As Integer, ByRef Caption As WString, AObject As Any Ptr = 0)
       Dim As Integer i
       Dim As TabPage Ptr It
       Dim As TCITEM Ti
       Ti.mask = TCIF_TEXT OR TCIF_IMAGE OR TCIF_PARAM
       If Index >= 0 AND Index <= FTabCount -1 Then
          FTabCount += 1 
          Tabs = ReAllocate(Tabs,FTabCount*SizeOF(TabPage))
          For i = Index To FTabCount -2
              It = Tabs[i]
              Tabs[i + 1] = It
          Next i
          Tabs[Index] = New TabPage
          Tabs[Index]->Caption = Caption
          Tabs[Index]->Object = aObject
          Tabs[Index]->TabPageControl = @This
          This.Add(Tabs[Index])
          Ti.pszText    = @(Tabs[Index]->Caption)
          Ti.cchTextMax = Len(Tabs[Index]->Caption) + 1
          If Tabs[Index]->Object Then Ti.lParam = Cast(LPARAM, Tabs[Index]->Object)
          Perform(TCM_INSERTITEM, Index, CInt(@Ti))
          If FTabCount = 1 Then SetMargins
       End If
    End Sub

    Operator TabControl.Cast As Control Ptr 
        Return Cast(Control Ptr, @This)
    End Operator

    Function TabControl.IndexOfTab(Value As TabPage Ptr) As Integer
        Dim As Integer i
        For i = 0 To TabCount - 1
            If Tabs[i] = Value Then Return i
        Next i
        Return -1
    End Function

    Constructor TabControl
        SetMargins
        With This
            .ClassName = "TabControl"
            .ClassAncestor = "SysTabControl32"
            .RegisterClass "TabControl", "SysTabControl32"
            .Child       = @This
            .ChildProc   = @WndProc
            Base.ExStyle     = 0
            Base.Style       = WS_CHILD 
            .Width       = 121
            .Height      = 121
            .OnHandleIsAllocated = @HandleIsAllocated
        End With
    End Constructor

    Destructor TabControl
        'UnregisterClass "TabControl", GetModuleHandle(NULL) 
    End Destructor
    
End namespace