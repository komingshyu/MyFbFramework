'            FreeBasic header file, auto-generated by
'                       ### GirToBac ###
' LGPLv2.1 (C) 2013-2022 by Thomas[ dot }Freiherr[ at ]gmx[ dot }net
' Auto-translated from file /usr/share/gir-1.0/SpiceClientGLib-2.0.gir
#INCLUDE ONCE "_GirToBac-0.0.bi"

' Repository version 1.2
#INCLUDE ONCE "GObject-2.0.bi"
#INCLUDE ONCE "Gio-2.0.bi"
TYPE AS _SpiceAudio SpiceAudio
TYPE AS _SpiceAudioClass SpiceAudioClass
TYPE AS _SpiceAudioPrivate SpiceAudioPrivate
TYPE AS _SpiceChannel SpiceChannel
TYPE AS _SpiceChannelClass SpiceChannelClass
TYPE AS LONG SpiceChannelEvent
ENUM
  SPICE_CHANNEL_NONE = 0
  SPICE_CHANNEL_OPENED = 10
  SPICE_CHANNEL_SWITCHING = 11
  SPICE_CHANNEL_CLOSED = 12
  SPICE_CHANNEL_ERROR_CONNECT = 20
  SPICE_CHANNEL_ERROR_TLS = 21
  SPICE_CHANNEL_ERROR_LINK = 22
  SPICE_CHANNEL_ERROR_AUTH = 23
  SPICE_CHANNEL_ERROR_IO = 24
END ENUM
TYPE AS _SpiceChannelPrivate SpiceChannelPrivate
TYPE AS LONG SpiceClientError
ENUM
  SPICE_CLIENT_ERROR_FAILED = 0
  SPICE_CLIENT_USB_DEVICE_REJECTED = 1
  SPICE_CLIENT_USB_DEVICE_LOST = 2
END ENUM
TYPE AS _SpiceCursorChannel SpiceCursorChannel
TYPE AS _SpiceCursorChannelClass SpiceCursorChannelClass
TYPE AS _SpiceCursorChannelPrivate SpiceCursorChannelPrivate
TYPE AS _SpiceDisplayChannel SpiceDisplayChannel
TYPE AS _SpiceDisplayChannelClass SpiceDisplayChannelClass
TYPE AS _SpiceDisplayChannelPrivate SpiceDisplayChannelPrivate
TYPE AS _SpiceDisplayMonitorConfig SpiceDisplayMonitorConfig
TYPE AS _SpiceDisplayPrimary SpiceDisplayPrimary
TYPE AS _SpiceInputsChannel SpiceInputsChannel
TYPE AS _SpiceInputsChannelClass SpiceInputsChannelClass
TYPE AS _SpiceInputsChannelPrivate SpiceInputsChannelPrivate
TYPE AS LONG SpiceInputsLock
ENUM
  SPICE_INPUTS_SCROLL_LOCK = 1
  SPICE_INPUTS_NUM_LOCK = 2
  SPICE_INPUTS_CAPS_LOCK = 4
END ENUM
TYPE AS _SpiceMainChannel SpiceMainChannel
TYPE AS _SpiceMainChannelClass SpiceMainChannelClass
TYPE AS _SpiceMainChannelPrivate SpiceMainChannelPrivate
TYPE AS _SpiceMsgIn SpiceMsgIn
TYPE AS _SpiceMsgOut SpiceMsgOut
TYPE AS _SpicePlaybackChannel SpicePlaybackChannel
TYPE AS _SpicePlaybackChannelClass SpicePlaybackChannelClass
TYPE AS _SpicePlaybackChannelPrivate SpicePlaybackChannelPrivate
TYPE AS _SpicePortChannel SpicePortChannel
TYPE AS _SpicePortChannelClass SpicePortChannelClass
TYPE AS _SpicePortChannelPrivate SpicePortChannelPrivate
TYPE AS _SpiceRecordChannel SpiceRecordChannel
TYPE AS _SpiceRecordChannelClass SpiceRecordChannelClass
TYPE AS _SpiceRecordChannelPrivate SpiceRecordChannelPrivate
TYPE AS _SpiceSession SpiceSession
TYPE AS _SpiceSessionClass SpiceSessionClass
TYPE AS LONG SpiceSessionMigration
ENUM
  SPICE_SESSION_MIGRATION_NONE = 0
  SPICE_SESSION_MIGRATION_SWITCHING = 1
  SPICE_SESSION_MIGRATION_MIGRATING = 2
END ENUM
TYPE AS _SpiceSessionPrivate SpiceSessionPrivate
TYPE AS LONG SpiceSessionVerify
ENUM
  SPICE_SESSION_VERIFY_PUBKEY = 1
  SPICE_SESSION_VERIFY_HOSTNAME = 2
  SPICE_SESSION_VERIFY_SUBJECT = 4
END ENUM
TYPE AS _SpiceSmartcardChannel SpiceSmartcardChannel
TYPE AS _SpiceSmartcardChannelClass SpiceSmartcardChannelClass
TYPE AS _SpiceSmartcardChannelPrivate SpiceSmartcardChannelPrivate
TYPE AS _SpiceSmartcardManager SpiceSmartcardManager
TYPE AS _SpiceSmartcardManagerClass SpiceSmartcardManagerClass
TYPE AS _SpiceSmartcardManagerPrivate SpiceSmartcardManagerPrivate
TYPE AS _SpiceSmartcardReader SpiceSmartcardReader
TYPE AS _SpiceUsbDevice SpiceUsbDevice
TYPE AS _SpiceUsbDeviceManager SpiceUsbDeviceManager
TYPE AS _SpiceUsbDeviceManagerClass SpiceUsbDeviceManagerClass
TYPE AS _SpiceUsbDeviceManagerPrivate SpiceUsbDeviceManagerPrivate
TYPE AS _SpiceUsbredirChannel SpiceUsbredirChannel
TYPE AS _SpiceUsbredirChannelClass SpiceUsbredirChannelClass
TYPE AS _SpiceUsbredirChannelPrivate SpiceUsbredirChannelPrivate
EXTERN "C" LIB "spice-client-glib-2.0"
' P_X

' P_3

TYPE _SpiceAudio
  AS GObject parent
  AS SpiceAudioPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_audio_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_AUDIO (spice_audio_get_type())
#DEFINE SPICECLIENTGLIB_AUDIO(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_AUDIO, SpiceAudio))
#DEFINE SPICECLIENTGLIB_AUDIO_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_AUDIO, SpiceClientGLibAudioClass))
#DEFINE SPICECLIENTGLIB_IS_AUDIO(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_AUDIO))
#DEFINE SPICECLIENTGLIB_IS_CLASS_AUDIO(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_AUDIO))
#DEFINE SPICECLIENTGLIB_AUDIO_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_AUDIO, SpiceClientGLibAudioClass))
DECLARE FUNCTION spice_audio_new(BYVAL AS SpiceSession PTR, BYVAL AS GMainContext PTR, BYVAL AS const char PTR) AS SpiceAudio PTR
DECLARE FUNCTION spice_audio_get(BYVAL AS SpiceSession PTR, BYVAL AS GMainContext PTR) AS SpiceAudio PTR
TYPE _SpiceAudioClass
  AS GObjectClass parent_class
  connect_channel AS FUNCTION CDECL(BYVAL AS SpiceAudio PTR, BYVAL AS SpiceChannel PTR) AS gboolean
  AS gint8 _spice_reserved
END TYPE
TYPE _SpiceChannel
  AS GObject parent
  AS SpiceChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_CHANNEL (spice_channel_get_type())
#DEFINE SPICECLIENTGLIB_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_CHANNEL, SpiceChannel))
#DEFINE SPICECLIENTGLIB_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_CHANNEL, SpiceClientGLibChannelClass))
#DEFINE SPICECLIENTGLIB_IS_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_CHANNEL))
#DEFINE SPICECLIENTGLIB_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_CHANNEL, SpiceClientGLibChannelClass))
DECLARE FUNCTION spice_channel_new(BYVAL AS SpiceSession PTR, BYVAL AS gint /'int'/, BYVAL AS gint /'int'/) AS SpiceChannel PTR
DECLARE FUNCTION spice_channel_string_to_type(BYVAL AS const gchar PTR) AS gint
DECLARE FUNCTION spice_channel_type_to_string(BYVAL AS gint) AS const gchar PTR
DECLARE FUNCTION spice_channel_connect(BYVAL AS SpiceChannel PTR) AS gboolean
DECLARE SUB spice_channel_destroy(BYVAL AS SpiceChannel PTR)
DECLARE SUB spice_channel_disconnect(BYVAL AS SpiceChannel PTR, BYVAL AS SpiceChannelEvent)
DECLARE SUB spice_channel_flush_async(BYVAL AS SpiceChannel PTR, BYVAL AS GCancellable PTR, BYVAL AS GAsyncReadyCallback, BYVAL AS gpointer)
DECLARE FUNCTION spice_channel_flush_finish(BYVAL AS SpiceChannel PTR, BYVAL AS GAsyncResult PTR, BYVAL AS GError PTR PTR) AS gboolean
DECLARE FUNCTION spice_channel_open_fd(BYVAL AS SpiceChannel PTR, BYVAL AS gint /'int'/) AS gboolean
DECLARE SUB spice_channel_set_capability(BYVAL AS SpiceChannel PTR, BYVAL AS guint32)
DECLARE FUNCTION spice_channel_test_capability(BYVAL AS SpiceChannel PTR, BYVAL AS guint32) AS gboolean
DECLARE FUNCTION spice_channel_test_common_capability(BYVAL AS SpiceChannel PTR, BYVAL AS guint32) AS gboolean
TYPE _SpiceChannelClass
  AS GObjectClass parent_class
  channel_event AS SUB CDECL(BYVAL AS SpiceChannel PTR, BYVAL AS SpiceChannelEvent)
  open_fd AS SUB CDECL(BYVAL AS SpiceChannel PTR, BYVAL AS gint /'int'/)
  handle_msg AS SUB CDECL(BYVAL AS SpiceChannel PTR, BYVAL AS SpiceMsgIn PTR)
  channel_up AS SUB CDECL(BYVAL AS SpiceChannel PTR)
  iterate_write AS SUB CDECL(BYVAL AS SpiceChannel PTR)
  iterate_read AS SUB CDECL(BYVAL AS SpiceChannel PTR)
  channel_disconnect AS SUB CDECL(BYVAL AS SpiceChannel PTR)
  channel_reset AS SUB CDECL(BYVAL AS SpiceChannel PTR, BYVAL AS gboolean)
  channel_reset_capabilities AS SUB CDECL(BYVAL AS SpiceChannel PTR)
  channel_send_migration_handshake AS SUB CDECL(BYVAL AS SpiceChannel PTR)
  AS GArray PTR handlers
  AS gint8 _spice_reserved
END TYPE
TYPE _SpiceCursorChannel
  AS SpiceChannel parent
  AS SpiceCursorChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_cursor_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_CURSOR_CHANNEL (spice_cursor_channel_get_type())
#DEFINE SPICECLIENTGLIB_CURSOR_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_CURSOR_CHANNEL, SpiceCursorChannel))
#DEFINE SPICECLIENTGLIB_CURSOR_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_CURSOR_CHANNEL, SpiceClientGLibCursorChannelClass))
#DEFINE SPICECLIENTGLIB_IS_CURSOR_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_CURSOR_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_CURSOR_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_CURSOR_CHANNEL))
#DEFINE SPICECLIENTGLIB_CURSOR_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_CURSOR_CHANNEL, SpiceClientGLibCursorChannelClass))
TYPE _SpiceCursorChannelClass
  AS SpiceChannelClass parent_class
  cursor_set AS SUB CDECL(BYVAL AS SpiceCursorChannel PTR, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint, BYVAL AS gpointer)
  cursor_move AS SUB CDECL(BYVAL AS SpiceCursorChannel PTR, BYVAL AS gint, BYVAL AS gint)
  cursor_hide AS SUB CDECL(BYVAL AS SpiceCursorChannel PTR)
  cursor_reset AS SUB CDECL(BYVAL AS SpiceCursorChannel PTR)
END TYPE
TYPE _SpiceDisplayChannel
  AS SpiceChannel parent
  AS SpiceDisplayChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_display_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_DISPLAY_CHANNEL (spice_display_channel_get_type())
#DEFINE SPICECLIENTGLIB_DISPLAY_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_DISPLAY_CHANNEL, SpiceDisplayChannel))
#DEFINE SPICECLIENTGLIB_DISPLAY_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_DISPLAY_CHANNEL, SpiceClientGLibDisplayChannelClass))
#DEFINE SPICECLIENTGLIB_IS_DISPLAY_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_DISPLAY_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_DISPLAY_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_DISPLAY_CHANNEL))
#DEFINE SPICECLIENTGLIB_DISPLAY_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_DISPLAY_CHANNEL, SpiceClientGLibDisplayChannelClass))
TYPE _SpiceDisplayChannelClass
  AS SpiceChannelClass parent_class
  display_primary_create AS SUB CDECL(BYVAL AS SpiceChannel PTR, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint, BYVAL AS gpointer)
  display_primary_destroy AS SUB CDECL(BYVAL AS SpiceChannel PTR)
  display_invalidate AS SUB CDECL(BYVAL AS SpiceChannel PTR, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint)
  display_mark AS SUB CDECL(BYVAL AS SpiceChannel PTR, BYVAL AS gboolean)
END TYPE
TYPE _SpiceDisplayMonitorConfig
  AS guint id
  AS guint surface_id
  AS guint x
  AS guint y
  AS guint width
  AS guint height
END TYPE
TYPE _SpiceDisplayPrimary
  AS any ptr /'SpiceSurfaceFmt'/ format
  AS gint width
  AS gint height
  AS gint stride
  AS gint shmid
  AS guint8 PTR data
  AS gboolean marked
END TYPE
TYPE _SpiceInputsChannel
  AS SpiceChannel parent
  AS SpiceInputsChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_inputs_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_INPUTS_CHANNEL (spice_inputs_channel_get_type())
#DEFINE SPICECLIENTGLIB_INPUTS_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_INPUTS_CHANNEL, SpiceInputsChannel))
#DEFINE SPICECLIENTGLIB_INPUTS_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_INPUTS_CHANNEL, SpiceClientGLibInputsChannelClass))
#DEFINE SPICECLIENTGLIB_IS_INPUTS_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_INPUTS_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_INPUTS_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_INPUTS_CHANNEL))
#DEFINE SPICECLIENTGLIB_INPUTS_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_INPUTS_CHANNEL, SpiceClientGLibInputsChannelClass))
TYPE _SpiceInputsChannelClass
  AS SpiceChannelClass parent_class
  inputs_modifiers AS SUB CDECL(BYVAL AS SpiceChannel PTR)
END TYPE
TYPE _SpiceMainChannel
  AS SpiceChannel parent
  AS SpiceMainChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_main_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_MAIN_CHANNEL (spice_main_channel_get_type())
#DEFINE SPICECLIENTGLIB_MAIN_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_MAIN_CHANNEL, SpiceMainChannel))
#DEFINE SPICECLIENTGLIB_MAIN_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_MAIN_CHANNEL, SpiceClientGLibMainChannelClass))
#DEFINE SPICECLIENTGLIB_IS_MAIN_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_MAIN_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_MAIN_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_MAIN_CHANNEL))
#DEFINE SPICECLIENTGLIB_MAIN_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_MAIN_CHANNEL, SpiceClientGLibMainChannelClass))
TYPE _SpiceMainChannelClass
  AS SpiceChannelClass parent_class
  mouse_update AS SUB CDECL(BYVAL AS SpiceChannel PTR)
  agent_update AS SUB CDECL(BYVAL AS SpiceChannel PTR)
END TYPE
TYPE _SpicePlaybackChannel
  AS SpiceChannel parent
  AS SpicePlaybackChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_playback_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_PLAYBACK_CHANNEL (spice_playback_channel_get_type())
#DEFINE SPICECLIENTGLIB_PLAYBACK_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_PLAYBACK_CHANNEL, SpicePlaybackChannel))
#DEFINE SPICECLIENTGLIB_PLAYBACK_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_PLAYBACK_CHANNEL, SpiceClientGLibPlaybackChannelClass))
#DEFINE SPICECLIENTGLIB_IS_PLAYBACK_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_PLAYBACK_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_PLAYBACK_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_PLAYBACK_CHANNEL))
#DEFINE SPICECLIENTGLIB_PLAYBACK_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_PLAYBACK_CHANNEL, SpiceClientGLibPlaybackChannelClass))
DECLARE SUB spice_playback_channel_set_delay(BYVAL AS SpicePlaybackChannel PTR, BYVAL AS guint32)
TYPE _SpicePlaybackChannelClass
  AS SpiceChannelClass parent_class
  playback_start AS SUB CDECL(BYVAL AS SpicePlaybackChannel PTR, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint)
  playback_data AS SUB CDECL(BYVAL AS SpicePlaybackChannel PTR, BYVAL AS gpointer PTR, BYVAL AS gint)
  playback_stop AS SUB CDECL(BYVAL AS SpicePlaybackChannel PTR)
END TYPE
TYPE _SpicePortChannel
  AS SpiceChannel parent
  AS SpicePortChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_port_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_PORT_CHANNEL (spice_port_channel_get_type())
#DEFINE SPICECLIENTGLIB_PORT_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_PORT_CHANNEL, SpicePortChannel))
#DEFINE SPICECLIENTGLIB_PORT_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_PORT_CHANNEL, SpiceClientGLibPortChannelClass))
#DEFINE SPICECLIENTGLIB_IS_PORT_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_PORT_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_PORT_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_PORT_CHANNEL))
#DEFINE SPICECLIENTGLIB_PORT_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_PORT_CHANNEL, SpiceClientGLibPortChannelClass))
TYPE _SpicePortChannelClass
  AS SpiceChannelClass parent_class
END TYPE
TYPE _SpiceRecordChannel
  AS SpiceChannel parent
  AS SpiceRecordChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_record_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_RECORD_CHANNEL (spice_record_channel_get_type())
#DEFINE SPICECLIENTGLIB_RECORD_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_RECORD_CHANNEL, SpiceRecordChannel))
#DEFINE SPICECLIENTGLIB_RECORD_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_RECORD_CHANNEL, SpiceClientGLibRecordChannelClass))
#DEFINE SPICECLIENTGLIB_IS_RECORD_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_RECORD_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_RECORD_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_RECORD_CHANNEL))
#DEFINE SPICECLIENTGLIB_RECORD_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_RECORD_CHANNEL, SpiceClientGLibRecordChannelClass))
TYPE _SpiceRecordChannelClass
  AS SpiceChannelClass parent_class
  record_start AS SUB CDECL(BYVAL AS SpiceRecordChannel PTR, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint)
  record_data AS SUB CDECL(BYVAL AS SpiceRecordChannel PTR, BYVAL AS gpointer PTR, BYVAL AS gint)
  record_stop AS SUB CDECL(BYVAL AS SpiceRecordChannel PTR)
END TYPE
TYPE _SpiceSession
  AS GObject parent
  AS SpiceSessionPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_session_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_SESSION (spice_session_get_type())
#DEFINE SPICECLIENTGLIB_SESSION(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_SESSION, SpiceSession))
#DEFINE SPICECLIENTGLIB_SESSION_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_SESSION, SpiceClientGLibSessionClass))
#DEFINE SPICECLIENTGLIB_IS_SESSION(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_SESSION))
#DEFINE SPICECLIENTGLIB_IS_CLASS_SESSION(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_SESSION))
#DEFINE SPICECLIENTGLIB_SESSION_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_SESSION, SpiceClientGLibSessionClass))
DECLARE FUNCTION spice_session_new() AS SpiceSession PTR
DECLARE FUNCTION spice_session_connect(BYVAL AS SpiceSession PTR) AS gboolean
DECLARE SUB spice_session_disconnect(BYVAL AS SpiceSession PTR)
DECLARE FUNCTION spice_session_get_channels(BYVAL AS SpiceSession PTR) AS GList PTR
DECLARE FUNCTION spice_session_get_read_only(BYVAL AS SpiceSession PTR) AS gboolean
DECLARE FUNCTION spice_session_has_channel_type(BYVAL AS SpiceSession PTR, BYVAL AS gint) AS gboolean
DECLARE FUNCTION spice_session_open_fd(BYVAL AS SpiceSession PTR, BYVAL AS gint /'int'/) AS gboolean
TYPE _SpiceSessionClass
  AS GObjectClass parent_class
  channel_new AS SUB CDECL(BYVAL AS SpiceSession PTR, BYVAL AS SpiceChannel PTR)
  channel_destroy AS SUB CDECL(BYVAL AS SpiceSession PTR, BYVAL AS SpiceChannel PTR)
  AS gint8 _spice_reserved
END TYPE
TYPE _SpiceSmartcardChannel
  AS SpiceChannel parent
  AS SpiceSmartcardChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_smartcard_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_SMARTCARD_CHANNEL (spice_smartcard_channel_get_type())
#DEFINE SPICECLIENTGLIB_SMARTCARD_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_CHANNEL, SpiceSmartcardChannel))
#DEFINE SPICECLIENTGLIB_SMARTCARD_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_CHANNEL, SpiceClientGLibSmartcardChannelClass))
#DEFINE SPICECLIENTGLIB_IS_SMARTCARD_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_SMARTCARD_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_CHANNEL))
#DEFINE SPICECLIENTGLIB_SMARTCARD_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_CHANNEL, SpiceClientGLibSmartcardChannelClass))
TYPE _SpiceSmartcardChannelClass
  AS SpiceChannelClass parent_class
END TYPE
TYPE _SpiceSmartcardManager
  AS GObject parent
  AS SpiceSmartcardManagerPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_smartcard_manager_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_SMARTCARD_MANAGER (spice_smartcard_manager_get_type())
#DEFINE SPICECLIENTGLIB_SMARTCARD_MANAGER(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_MANAGER, SpiceSmartcardManager))
#DEFINE SPICECLIENTGLIB_SMARTCARD_MANAGER_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_MANAGER, SpiceClientGLibSmartcardManagerClass))
#DEFINE SPICECLIENTGLIB_IS_SMARTCARD_MANAGER(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_MANAGER))
#DEFINE SPICECLIENTGLIB_IS_CLASS_SMARTCARD_MANAGER(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_MANAGER))
#DEFINE SPICECLIENTGLIB_SMARTCARD_MANAGER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_SMARTCARD_MANAGER, SpiceClientGLibSmartcardManagerClass))
DECLARE FUNCTION spice_smartcard_manager_get() AS SpiceSmartcardManager PTR
DECLARE FUNCTION spice_smartcard_manager_get_readers(BYVAL AS SpiceSmartcardManager PTR) AS GList PTR
DECLARE FUNCTION spice_smartcard_manager_insert_card(BYVAL AS SpiceSmartcardManager PTR) AS gboolean
DECLARE FUNCTION spice_smartcard_manager_remove_card(BYVAL AS SpiceSmartcardManager PTR) AS gboolean
TYPE _SpiceSmartcardManagerClass
  AS GObjectClass parent_class
  reader_added AS SUB CDECL(BYVAL AS SpiceSmartcardManager PTR, BYVAL AS SpiceSmartcardReader PTR)
  reader_removed AS SUB CDECL(BYVAL AS SpiceSmartcardManager PTR, BYVAL AS SpiceSmartcardReader PTR)
  card_inserted AS SUB CDECL(BYVAL AS SpiceSmartcardManager PTR, BYVAL AS SpiceSmartcardReader PTR)
  card_removed AS SUB CDECL(BYVAL AS SpiceSmartcardManager PTR, BYVAL AS SpiceSmartcardReader PTR)
  AS gint8 _spice_reserved
END TYPE
DECLARE FUNCTION spice_smartcard_reader_insert_card(BYVAL AS SpiceSmartcardReader PTR) AS gboolean
DECLARE FUNCTION spice_smartcard_reader_is_software(BYVAL AS SpiceSmartcardReader PTR) AS gboolean
DECLARE FUNCTION spice_smartcard_reader_remove_card(BYVAL AS SpiceSmartcardReader PTR) AS gboolean
DECLARE FUNCTION spice_usb_device_get_description(BYVAL AS SpiceUsbDevice PTR, BYVAL AS const gchar PTR) AS gchar PTR
TYPE _SpiceUsbDeviceManager
  AS GObject parent
  AS SpiceUsbDeviceManagerPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_usb_device_manager_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_USB_DEVICE_MANAGER (spice_usb_device_manager_get_type())
#DEFINE SPICECLIENTGLIB_USB_DEVICE_MANAGER(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_USB_DEVICE_MANAGER, SpiceUsbDeviceManager))
#DEFINE SPICECLIENTGLIB_USB_DEVICE_MANAGER_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_USB_DEVICE_MANAGER, SpiceClientGLibUsbDeviceManagerClass))
#DEFINE SPICECLIENTGLIB_IS_USB_DEVICE_MANAGER(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_USB_DEVICE_MANAGER))
#DEFINE SPICECLIENTGLIB_IS_CLASS_USB_DEVICE_MANAGER(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_USB_DEVICE_MANAGER))
#DEFINE SPICECLIENTGLIB_USB_DEVICE_MANAGER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_USB_DEVICE_MANAGER, SpiceClientGLibUsbDeviceManagerClass))
DECLARE FUNCTION spice_usb_device_manager_get(BYVAL AS SpiceSession PTR, BYVAL AS GError PTR PTR) AS SpiceUsbDeviceManager PTR
DECLARE FUNCTION spice_usb_device_manager_can_redirect_device(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS SpiceUsbDevice PTR, BYVAL AS GError PTR PTR) AS gboolean
DECLARE SUB spice_usb_device_manager_connect_device_async(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS SpiceUsbDevice PTR, BYVAL AS GCancellable PTR, BYVAL AS GAsyncReadyCallback, BYVAL AS gpointer)
DECLARE FUNCTION spice_usb_device_manager_connect_device_finish(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS GAsyncResult PTR, BYVAL AS GError PTR PTR) AS gboolean
DECLARE SUB spice_usb_device_manager_disconnect_device(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS SpiceUsbDevice PTR)
DECLARE FUNCTION spice_usb_device_manager_get_devices(BYVAL AS SpiceUsbDeviceManager PTR) AS gint8
DECLARE FUNCTION spice_usb_device_manager_get_devices_with_filter(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS const gchar PTR) AS gint8
DECLARE FUNCTION spice_usb_device_manager_is_device_connected(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS SpiceUsbDevice PTR) AS gboolean
TYPE _SpiceUsbDeviceManagerClass
  AS GObjectClass parent_class
  device_added AS SUB CDECL(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS SpiceUsbDevice PTR)
  device_removed AS SUB CDECL(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS SpiceUsbDevice PTR)
  auto_connect_failed AS SUB CDECL(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS SpiceUsbDevice PTR, BYVAL AS GError PTR)
  device_error AS SUB CDECL(BYVAL AS SpiceUsbDeviceManager PTR, BYVAL AS SpiceUsbDevice PTR, BYVAL AS GError PTR)
  AS gint8 _spice_reserved
END TYPE
TYPE _SpiceUsbredirChannel
  AS SpiceChannel parent
  AS SpiceUsbredirChannelPrivate PTR priv
END TYPE
DECLARE FUNCTION spice_usbredir_channel_get_type() AS GType
#DEFINE SPICECLIENTGLIB_TYPE_USBREDIR_CHANNEL (spice_usbredir_channel_get_type())
#DEFINE SPICECLIENTGLIB_USBREDIR_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), SPICECLIENTGLIB_TYPE_USBREDIR_CHANNEL, SpiceUsbredirChannel))
#DEFINE SPICECLIENTGLIB_USBREDIR_CHANNEL_CLASS(obj) (G_TYPE_CHECK_CLASS_CAST((obj), SPICECLIENTGLIB_TYPE_USBREDIR_CHANNEL, SpiceClientGLibUsbredirChannelClass))
#DEFINE SPICECLIENTGLIB_IS_USBREDIR_CHANNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), SPICECLIENTGLIB_TYPE_USBREDIR_CHANNEL))
#DEFINE SPICECLIENTGLIB_IS_CLASS_USBREDIR_CHANNEL(obj) (G_TYPE_CHECK_CLASS_TYPE((obj), SPICECLIENTGLIB_TYPE_USBREDIR_CHANNEL))
#DEFINE SPICECLIENTGLIB_USBREDIR_CHANNEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), SPICECLIENTGLIB_TYPE_USBREDIR_CHANNEL, SpiceClientGLibUsbredirChannelClass))
TYPE _SpiceUsbredirChannelClass
  AS SpiceChannelClass parent_class
END TYPE
TYPE spice_msg_handler AS SUB CDECL(BYVAL AS SpiceChannel PTR, BYVAL AS SpiceMsgIn PTR)
' P_4

DECLARE FUNCTION spice_client_error_quark() AS GQuark
DECLARE FUNCTION spice_display_get_primary(BYVAL AS SpiceChannel PTR, BYVAL AS guint32, BYVAL AS SpiceDisplayPrimary PTR) AS gboolean
DECLARE FUNCTION spice_g_signal_connect_object(BYVAL AS gpointer, BYVAL AS const gchar PTR, BYVAL AS GCallback, BYVAL AS gpointer, BYVAL AS GConnectFlags) AS gulong
DECLARE FUNCTION spice_get_option_group() AS GOptionGroup PTR
DECLARE SUB spice_inputs_button_press(BYVAL AS SpiceInputsChannel PTR, BYVAL AS gint, BYVAL AS gint)
DECLARE SUB spice_inputs_button_release(BYVAL AS SpiceInputsChannel PTR, BYVAL AS gint, BYVAL AS gint)
DECLARE SUB spice_inputs_key_press(BYVAL AS SpiceInputsChannel PTR, BYVAL AS guint)
DECLARE SUB spice_inputs_key_press_and_release(BYVAL AS SpiceInputsChannel PTR, BYVAL AS guint)
DECLARE SUB spice_inputs_key_release(BYVAL AS SpiceInputsChannel PTR, BYVAL AS guint)
DECLARE SUB spice_inputs_motion(BYVAL AS SpiceInputsChannel PTR, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint)
DECLARE SUB spice_inputs_position(BYVAL AS SpiceInputsChannel PTR, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint, BYVAL AS gint)
DECLARE SUB spice_inputs_set_key_locks(BYVAL AS SpiceInputsChannel PTR, BYVAL AS guint)
DECLARE FUNCTION spice_main_agent_test_capability(BYVAL AS SpiceMainChannel PTR, BYVAL AS guint32) AS gboolean
DECLARE SUB spice_main_clipboard_grab(BYVAL AS SpiceMainChannel PTR, BYVAL AS guint32 PTR, BYVAL AS gint /'int'/)
DECLARE SUB spice_main_clipboard_notify(BYVAL AS SpiceMainChannel PTR, BYVAL AS guint32, BYVAL AS const guchar PTR, BYVAL AS size_t)
DECLARE SUB spice_main_clipboard_release(BYVAL AS SpiceMainChannel PTR)
DECLARE SUB spice_main_clipboard_request(BYVAL AS SpiceMainChannel PTR, BYVAL AS guint32)
DECLARE SUB spice_main_clipboard_selection_grab(BYVAL AS SpiceMainChannel PTR, BYVAL AS guint, BYVAL AS guint32 PTR, BYVAL AS gint /'int'/)
DECLARE SUB spice_main_clipboard_selection_notify(BYVAL AS SpiceMainChannel PTR, BYVAL AS guint, BYVAL AS guint32, BYVAL AS const guchar PTR, BYVAL AS size_t)
DECLARE SUB spice_main_clipboard_selection_release(BYVAL AS SpiceMainChannel PTR, BYVAL AS guint)
DECLARE SUB spice_main_clipboard_selection_request(BYVAL AS SpiceMainChannel PTR, BYVAL AS guint, BYVAL AS guint32)
DECLARE SUB spice_main_file_copy_async(BYVAL AS SpiceMainChannel PTR, BYVAL AS GFile PTR PTR, BYVAL AS GFileCopyFlags, BYVAL AS GCancellable PTR, BYVAL AS GFileProgressCallback, BYVAL AS gpointer, BYVAL AS GAsyncReadyCallback, BYVAL AS gpointer)
DECLARE FUNCTION spice_main_file_copy_finish(BYVAL AS SpiceMainChannel PTR, BYVAL AS GAsyncResult PTR, BYVAL AS GError PTR PTR) AS gboolean
DECLARE FUNCTION spice_main_send_monitor_config(BYVAL AS SpiceMainChannel PTR) AS gboolean
DECLARE SUB spice_main_set_display(BYVAL AS SpiceMainChannel PTR, BYVAL AS gint /'int'/, BYVAL AS gint /'int'/, BYVAL AS gint /'int'/, BYVAL AS gint /'int'/, BYVAL AS gint /'int'/)
DECLARE SUB spice_main_set_display_enabled(BYVAL AS SpiceMainChannel PTR, BYVAL AS gint /'int'/, BYVAL AS gboolean)
DECLARE SUB spice_main_update_display(BYVAL AS SpiceMainChannel PTR, BYVAL AS gint /'int'/, BYVAL AS gint /'int'/, BYVAL AS gint /'int'/, BYVAL AS gint /'int'/, BYVAL AS gint /'int'/, BYVAL AS gboolean)
DECLARE SUB spice_port_event(BYVAL AS SpicePortChannel PTR, BYVAL AS guint8)
DECLARE SUB spice_port_write_async(BYVAL AS SpicePortChannel PTR, BYVAL AS any ptr /'void'/ PTR, BYVAL AS gsize, BYVAL AS GCancellable PTR, BYVAL AS GAsyncReadyCallback, BYVAL AS gpointer)
DECLARE FUNCTION spice_port_write_finish(BYVAL AS SpicePortChannel PTR, BYVAL AS GAsyncResult PTR, BYVAL AS GError PTR PTR) AS gssize
DECLARE SUB spice_record_send_data(BYVAL AS SpiceRecordChannel PTR, BYVAL AS gpointer, BYVAL AS gsize, BYVAL AS guint32)
DECLARE SUB spice_set_session_option(BYVAL AS SpiceSession PTR)
DECLARE FUNCTION spice_util_get_debug() AS gboolean
DECLARE FUNCTION spice_util_get_version_string() AS const gchar PTR
DECLARE SUB spice_util_set_debug(BYVAL AS gboolean)
DECLARE FUNCTION spice_uuid_to_string(BYVAL AS const guint8) AS gchar PTR
END EXTERN
