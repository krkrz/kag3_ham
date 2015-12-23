;===============================================================================
; assets/HamRoutines.ks
;
; 共通サブルーチン集
;===============================================================================

;------------------------------------------------------------------------------
; コンテクストメニューの呼び出しラッパー

*rclick_wrapper
	[locksnapshot]
	[eval exp="SystemManager.callContextMenu('default')"]
	[waittrig name="end_contextmenu"]
	[unlocksnapshot]
	[call target="*check_closestate"]
[return]

;-------------------------------------------------------------------------------
; 終了・リセットをチェック
*check_closestate
	[if exp="tf.gotoreset"]
		[eval exp="delete tf.gotoreset;"]
		[gotostart ask="true"]
	[endif]
	[if exp="tf.gotoexit"]
		[eval exp="delete tf.gotoexit"]
		[close]
	[endif]
[return]
