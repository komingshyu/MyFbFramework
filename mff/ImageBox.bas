﻿'###############################################################################
'#  ImageBox.bi                                                                #
'#  This file is part of MyFBFramework                                         #
'#  Authors: Nastase Eodor, Xusinboy Bekchanov, Liu XiaLin                     #
'#  Based on:                                                                  #
'#   TStatic.bi                                                                #
'#   FreeBasic Windows GUI ToolKit                                             #
'#   Copyright (c) 2007-2008 Nastase Eodor                                     #
'#   Version 1.0.0                                                             #
'#  Updated and added cross-platform                                           #
'#  by Xusinboy Bekchanov(2018-2019)  Liu XiaLin                               #
'###############################################################################

#include once "ImageBox.bi"

Namespace My.Sys.Forms
	#ifndef ReadProperty_Off
		Private Function ImageBox.ReadProperty(PropertyName As String) As Any Ptr
			Select Case LCase(PropertyName)
			Case "autosize": Return @FAutoSize
			Case "centerimage": Return @FCenterImage
			Case "realsizeimage": Return @FRealSizeImage
			Case "style": Return @FImageStyle
			Case "graphic": Return Cast(Any Ptr, @This.Graphic)
			Case Else: Return Base.ReadProperty(PropertyName)
			End Select
			Return 0
		End Function
	#endif
	
	#ifndef WriteProperty_Off
		Private Function ImageBox.WriteProperty(PropertyName As String, Value As Any Ptr) As Boolean
			Select Case LCase(PropertyName)
			Case "autosize": If Value <> 0 Then This.AutoSize = QBoolean(Value)
			Case "centerimage": If Value <> 0 Then This.CenterImage = QBoolean(Value)
			Case "realsizeimage": If Value <> 0 Then This.RealSizeImage = QBoolean(Value)
			Case "style": If Value <> 0 Then This.Style = *Cast(ImageBoxStyle Ptr, Value)
			Case "graphic": This.Graphic = QWString(Value)
			Case Else: Return Base.WriteProperty(PropertyName, Value)
			End Select
			Return True
		End Function
	#endif
	
	Private Property ImageBox.AutoSize As Boolean
		Return FAutoSize
	End Property
	
	Private Property ImageBox.AutoSize(Value As Boolean)
		FAutoSize = Value
		#ifdef __USE_WINAPI__
			Base.Style = WS_CHILD Or SS_NOTIFY Or AStyle(abs_(FImageStyle)) Or ARealSizeImage(abs_(FRealSizeImage)) Or ARealSizeControl(abs_(FAutoSize)) Or ACenterImage(abs_(FCenterImage AndAlso Not FAutoSize))
		#endif
		RecreateWnd
	End Property
	
	Private Property ImageBox.DesignMode As Boolean
		Return FDesignMode
	End Property
	
	#ifdef __USE_GTK__
		Private Function ImageBox.DesignDraw(widget As GtkWidget Ptr, cr As cairo_t Ptr, data1 As Any Ptr) As Boolean
			#ifdef __USE_GTK3__
				Dim As Integer AllocatedWidth = gtk_widget_get_allocated_width(widget), AllocatedHeight = gtk_widget_get_allocated_height(widget)
			#else
				Dim As Integer AllocatedWidth = widget->allocation.width, AllocatedHeight = widget->allocation.height
			#endif
			cairo_rectangle(cr, 0.0, 0.0, AllocatedWidth, AllocatedHeight)
			Dim As Double Ptr dashed = _Allocate(SizeOf(Double) * 2)
			dashed[0] = 3.0
			dashed[1] = 3.0
			Dim As Integer len1 = SizeOf(dashed) / SizeOf(dashed[0])
			cairo_set_dash(cr, dashed, len1, 1)
			cairo_set_source_rgb(cr, 0.0, 0.0, 0.0)
			cairo_stroke(cr)
			Return False
		End Function
		
		Private Function ImageBox.DesignExposeEvent(widget As GtkWidget Ptr, Event As GdkEventExpose Ptr, data1 As Any Ptr) As Boolean
			Dim As cairo_t Ptr cr = gdk_cairo_create(Event->window)
			DesignDraw(widget, cr, data1)
			cairo_destroy(cr)
			Return False
		End Function
	#endif
	
	Private Property ImageBox.DesignMode(Value As Boolean)
		FDesignMode = Value
		If Value Then
			#ifdef __USE_GTK__
				#ifdef __USE_GTK3__
					g_signal_connect(widget, "draw", G_CALLBACK(@DesignDraw), @This)
				#else
					g_signal_connect(widget, "expose-event", G_CALLBACK(@DesignExposeEvent), @This)
				#endif
			#endif
		End If
	End Property
		
	Private Property ImageBox.Style As ImageBoxStyle
		Return FImageStyle
	End Property
	
	Private Property ImageBox.Style(Value As ImageBoxStyle)
		'If Value <> FImageStyle Then
			FImageStyle = Value
			#ifdef __USE_WINAPI__
				Base.Style = WS_CHILD Or SS_NOTIFY Or AStyle(abs_(FImageStyle)) Or ARealSizeImage(abs_(FRealSizeImage)) Or ARealSizeControl(abs_(FAutoSize)) Or ACenterImage(abs_(FCenterImage AndAlso Not FAutoSize))
			#endif
			RecreateWnd
		'End If
	End Property
	
	Private Property ImageBox.RealSizeImage As Boolean
		Return FRealSizeImage
	End Property
	
	Private Property ImageBox.RealSizeImage(Value As Boolean)
		If Value <> FRealSizeImage Then
			FRealSizeImage = Value
			#ifdef __USE_WINAPI__
				Base.Style = WS_CHILD Or SS_NOTIFY Or AStyle(abs_(FImageStyle)) Or ARealSizeImage(abs_(FRealSizeImage)) Or ARealSizeControl(abs_(FAutoSize))  Or ACenterImage(abs_(FCenterImage AndAlso Not FAutoSize))
			#endif
			RecreateWnd
		End If
	End Property
	
	Private Property ImageBox.CenterImage As Boolean
		Return FCenterImage
	End Property
	
	Private Property ImageBox.CenterImage(Value As Boolean)
		If Value <> FCenterImage Then
			FCenterImage = Value
			#ifdef __USE_WINAPI__
				Base.Style = WS_CHILD Or SS_NOTIFY Or AStyle(abs_(FImageStyle)) Or ARealSizeImage(abs_(FRealSizeImage)) Or ARealSizeControl(abs_(FAutoSize))  Or ACenterImage(abs_(FCenterImage AndAlso Not FAutoSize))
			#elseif defined(__USE_WASM__)
				If Value Then 
					FElementStyle = Replace(FElementStyle, "background-size: cover;", "background-position: center;")
				Else
					FElementStyle = Replace(FElementStyle, "background-position: center;", "background-size: cover;")
				End If
			#endif
			RecreateWnd
		End If
	End Property
	
	Private Sub ImageBox.GraphicChange(ByRef Designer As My.Sys.Object, ByRef Sender As My.Sys.Drawing.GraphicType, Image As Any Ptr, ImageType As Integer)
		With Sender
			If .Ctrl->Child Then
				#ifdef __USE_GTK__
					Select Case ImageType
					Case 0
						gtk_image_set_from_pixbuf(GTK_IMAGE(.Ctrl->widget), .Bitmap.Handle)
					Case 1
						gtk_image_set_from_pixbuf(GTK_IMAGE(.Ctrl->widget), .Icon.Handle)
					End Select
				#elseif defined(__USE_WINAPI__)
					Select Case ImageType
					Case 0
						QImageBox(.Ctrl->Child).Style = ImageBoxStyle.ssBitmap
						QImageBox(.Ctrl->Child).Perform(BM_SETIMAGE,ImageType,CInt(Sender.Bitmap.Handle))
					Case 1
						QImageBox(.Ctrl->Child).Style = ImageBoxStyle.ssIcon
						QImageBox(.Ctrl->Child).Perform(BM_SETIMAGE,ImageType,CInt(Sender.Icon.Handle))
					Case 2
						QImageBox(.Ctrl->Child).Style = ImageBoxStyle.ssCursor
						QImageBox(.Ctrl->Child).Perform(BM_SETIMAGE,ImageType,CInt(Sender.Icon.Handle))
					Case 3
						QImageBox(.Ctrl->Child).Style = ImageBoxStyle.ssEmf
						QImageBox(.Ctrl->Child).Perform(BM_SETIMAGE,ImageType,CInt(0))
					End Select
				#elseif defined(__USE_WASM__)
					Select Case ImageType
					Case 0
						.Ctrl->FElementStyle &= "background-image: url('" & .Bitmap.Handle & "');background-repeat: no-repeat;" & IIf(Cast(ImageBox Ptr, .Ctrl)->FCenterImage, "background-position: center;", "background-size: cover;")
					Case 1
						.Ctrl->FElementStyle &= "background-image: url('" & .Icon.Handle & "');background-repeat: no-repeat;" & IIf(Cast(ImageBox Ptr, .Ctrl)->FCenterImage, "background-position: center;", "background-size: cover;")
					End Select
				#endif
			End If
		End With
	End Sub
	
	#ifndef __USE_GTK__
		Private Sub ImageBox.HandleIsAllocated(ByRef Sender As Control)
			If Sender.Child Then
				With QImageBox(Sender.Child)
					#ifdef __USE_WINAPI__
						.Perform(STM_SETIMAGE, .Graphic.ImageType, CInt(.Graphic.Image))
					#endif
				End With
			End If
		End Sub
		
		Private Sub ImageBox.WndProc(ByRef Message As Message)
		End Sub
	#endif
	
	#ifdef __USE_WASM__
		Private Function ImageBox.GetContent() As UString
			Return ""
		End Function
	#endif
	
	Private Sub ImageBox.ProcessMessage(ByRef Message As Message)
		#ifdef __USE_WINAPI__
			Select Case Message.Msg
			Case WM_SIZE
				InvalidateRect(Handle,NULL,True)
			Case CM_CTLCOLOR
				Static As HDC Dc
				Dc = Cast(HDC,Message.wParam)
				SetBkMode Dc, TRANSPARENT
				SetTextColor Dc, This.Font.Color
				SetBkColor Dc, This.BackColor
				SetBkMode Dc, OPAQUE
'			Case CM_COMMAND
'				If Message.wParamHi = STN_CLICKED Then
'					If OnClick Then OnClick(This)
'				End If
'				If Message.wParamHi = STN_DBLCLK Then
'					If OnDblClick Then OnDblClick(This)
'				End If
			Case CM_DRAWITEM
				Dim As DRAWITEMSTRUCT Ptr diStruct
				Dim As ..Rect R
				Dim As HDC Dc
				diStruct = Cast(DRAWITEMSTRUCT Ptr, Message.lParam)
				R = Cast(..Rect, diStruct->rcItem)
				Dc = diStruct->hDC
				If OnDraw Then
					OnDraw(*Designer, This, *Cast(My.Sys.Drawing.Rect Ptr, @R), Dc)
				Else
				End If
			End Select
		#endif
		Base.ProcessMessage(Message)
	End Sub
	
	Private Operator ImageBox.Cast As Control Ptr
		Return Cast(Control Ptr, @This)
	End Operator
	
	Private Constructor ImageBox
		#ifdef __USE_GTK__
			widget = gtk_image_new()
			eventboxwidget = gtk_event_box_new()
			gtk_container_add(GTK_CONTAINER(eventboxwidget), widget)
			This.RegisterClass "ImageBox", @This
		#elseif defined(__USE_WINAPI__)
			AStyle(0)        = SS_BITMAP
			AStyle(1)        = SS_ICON
			AStyle(2)        = SS_ICON
			AStyle(3)        = SS_ENHMETAFILE
			AStyle(4)        = SS_OWNERDRAW
			ACenterImage(0)  = SS_RIGHTJUST
			ACenterImage(1)  = SS_CENTERIMAGE
			ARealSizeImage(0)= 0
			ARealSizeImage(1) = SS_REALSIZEIMAGE
			ARealSizeControl(0) = SS_REALSIZECONTROL
			ARealSizeControl(1) = 0
		#endif
		FImageStyle = 0
		Graphic.Ctrl = @This
		Graphic.OnChange = @GraphicChange
		FRealSizeImage   = 0
		FCenterImage   = True
		With This
			.Child       = @This
			WLet(FClassName, "ImageBox")
			#ifdef __USE_WINAPI__
				.RegisterClass "ImageBox", "Static"
				.ChildProc   = @WndProc
				Base.ExStyle     = 0
				Base.Style = WS_CHILD Or SS_NOTIFY Or AStyle(abs_(FImageStyle)) Or ARealSizeImage(abs_(FRealSizeImage)) Or ARealSizeControl(abs_(FAutoSize)) Or ACenterImage(abs_(FCenterImage AndAlso Not FAutoSize))
				.BackColor       = GetSysColor(COLOR_BTNFACE)
				FDefaultBackColor = .BackColor
				.OnHandleIsAllocated = @HandleIsAllocated
				WLet(FClassAncestor, "Static")
			#endif
			.Width       = 90
			.Height      = 17
		End With
	End Constructor
	
	Private Destructor ImageBox
	End Destructor
End Namespace
