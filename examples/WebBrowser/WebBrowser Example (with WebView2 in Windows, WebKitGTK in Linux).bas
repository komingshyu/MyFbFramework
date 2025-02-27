﻿#ifdef __FB_WIN32__
	#ifdef __FB_64BIT__
		#ifdef __FB_ARM__
			#cmdline "-exx ""WebBrowser Example (with WebView2).rc"" -x ""Release/win-arm64/WebBrowser Example (with WebView2).exe"""
		#else
			#cmdline "-exx ""WebBrowser Example (with WebView2).rc"" -x ""Release/win-x64/WebBrowser Example (with WebView2).exe"""
		#endif
	#else
		#cmdline "-exx ""WebBrowser Example (with WebView2).rc"" -x ""Release/win-x86/WebBrowser Example (with WebView2).exe"""
	#endif
#else
	#cmdline "-exx -x ""Release/linux/WebBrowser Example (with WebKitGTK)"""
#endif
'#Region "Form"
	#define __USE_WEBVIEW2__ ' for Windows
	#define __USE_GTK3__ ' for Linux
	#include once "mff/Form.bi"
	#include once "mff/WebBrowser.bi"
	#include once "mff/CommandButton.bi"
	#include once "mff/TextBox.bi"
	
	Using My.Sys.Forms
	
	Type Form1 Extends Form
		Declare Static Sub cmdPrev_Click_(ByRef Designer As My.Sys.Object, ByRef Sender As Control)
		Declare Sub cmdPrev_Click(ByRef Sender As Control)
		Declare Static Sub cmdNext_Click_(ByRef Designer As My.Sys.Object, ByRef Sender As Control)
		Declare Sub cmdNext_Click(ByRef Sender As Control)
		Declare Static Sub cmdGo_Click_(ByRef Designer As My.Sys.Object, ByRef Sender As Control)
		Declare Sub cmdGo_Click(ByRef Sender As Control)
		Declare Sub WebBrowser1_NewWindowRequested(ByRef Sender As WebBrowser, ByRef e As NewWindowRequestedEventArgs)
		Declare Constructor
		
		Dim As WebBrowser WebBrowser1
		Dim As CommandButton cmdPrev, cmdNext, cmdGo
		Dim As TextBox txtAddress
	End Type
	
	Constructor Form1
		' Form1
		With This
			.Name = "Form1"
			.Text = "Form1"
			.Designer = @This
			.DefaultButton = @cmdGo
			.SetBounds 0, 0, 360, 450
		End With
		' WebBrowser1
		With WebBrowser1
			.Name = "WebBrowser1"
			.Text = "about:blank"
			.TabIndex = 0
			.SetBounds 10, 40, 324, 361
			.Anchor.Top = AnchorStyle.asAnchor
			.Anchor.Right = AnchorStyle.asAnchor
			.Anchor.Left = AnchorStyle.asAnchor
			.Anchor.Bottom = AnchorStyle.asAnchor
			.Designer = @This
			.OnNewWindowRequested = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As WebBrowser, ByRef e As NewWindowRequestedEventArgs), @WebBrowser1_NewWindowRequested)
			.Parent = @This
		End With
		' cmdPrev
		With cmdPrev
			.Name = "cmdPrev"
			.Text = "Prev"
			.TabIndex = 1
			.SetBounds 10, 10, 40, 20
			.Caption = "Prev"
			.Designer = @This
			.OnClick = @cmdPrev_Click_
			.Parent = @This
		End With
		' cmdNext
		With cmdNext
			.Name = "cmdNext"
			.Text = "Next"
			.TabIndex = 2
			.SetBounds 54, 10, 40, 20
			.Caption = "Next"
			.Designer = @This
			.OnClick = @cmdNext_Click_
			.Parent = @This
		End With
		' txtAddress
		With txtAddress
			.Name = "txtAddress"
			.Text = "about:blank"
			.TabIndex = 3
			.SetBounds 100, 10, 190, 20
			.Anchor.Right = AnchorStyle.asAnchor
			.Anchor.Left = AnchorStyle.asAnchor
			.Parent = @This
		End With
		' cmdGo
		With cmdGo
			.Name = "cmdGo"
			.Text = "Go"
			.TabIndex = 4
			.SetBounds 294, 10, 40, 20
			.Caption = "Go"
			.Designer = @This
			.OnClick = @cmdGo_Click_
			.Anchor.Right = AnchorStyle.asAnchor
			.Default = True
			.Parent = @This
		End With
	End Constructor
	
	Dim Shared fForm1 As Form1
	
	#ifndef _NOT_AUTORUN_FORMS_
		fForm1.Show
		
		App.Run
	#endif
'#End Region

Private Sub Form1.cmdPrev_Click_(ByRef Designer As My.Sys.Object, ByRef Sender As Control)
	(*Cast(Form1 Ptr, Sender.Designer)).cmdPrev_Click(Sender)
End Sub
Private Sub Form1.cmdPrev_Click(ByRef Sender As Control)
	WebBrowser1.GoBack
End Sub

Private Sub Form1.cmdNext_Click_(ByRef Designer As My.Sys.Object, ByRef Sender As Control)
	(*Cast(Form1 Ptr, Sender.Designer)).cmdNext_Click(Sender)
End Sub
Private Sub Form1.cmdNext_Click(ByRef Sender As Control)
	WebBrowser1.GoForward
End Sub

Private Sub Form1.cmdGo_Click_(ByRef Designer As My.Sys.Object, ByRef Sender As Control)
	(*Cast(Form1 Ptr, Sender.Designer)).cmdGo_Click(Sender)
End Sub
Private Sub Form1.cmdGo_Click(ByRef Sender As Control)
	#ifdef __USE_WEBVIEW2__
		If InStr(txtAddress.Text, ":") = 0 Then
			txtAddress.Text = "https://" & txtAddress.Text
		End If
	#endif
	WebBrowser1.Navigate txtAddress.Text
End Sub

Private Sub Form1.WebBrowser1_NewWindowRequested(ByRef Sender As WebBrowser, ByRef e As NewWindowRequestedEventArgs)
	MsgBox e.GetURL
End Sub
