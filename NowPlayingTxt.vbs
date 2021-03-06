Option Explicit

Dim strTextFilePath

' Runs on MediaMonkey startup and registers the script events
Sub OnStartup ()
    Script.RegisterEvent SDB, "OnPlay", "UpdateTrackInfo"
    Script.RegisterEvent SDB, "OnPause", "UpdateTrackInfo"
    Script.RegisterEvent SDB, "OnShutdown", "ClearTrackInfo"

    strTextFilePath = "C:\Temp\NowPlaying.txt"

    ClearTrackInfo
End Sub

Sub ClearTrackInfo ()
    WriteTrackInfo "", "", "", ""
End Sub

Sub UpdateTrackInfo ()
    Dim strTrack, strArtist, strAlbum, strSite

    If (SDB.Player.isPaused OR IsEmpty(SDB.Player.CurrentSong)) Then
        WriteTrackInfo "", "", "", ""
    Else
        strTrack = SDB.Player.CurrentSong.Title

        If (IsEmpty(SDB.Player.CurrentSong.Artist)) Then
            strArtist = ""
        Else
            strArtist = SDB.Player.CurrentSong.Artist.Name
        End If

        If (IsEmpty(SDB.Player.CurrentSong.Album)) Then
            strAlbum = ""
        Else
            strAlbum = SDB.Player.CurrentSong.Album.Name
        End If

        If (IsEmpty(SDB.Player.CurrentSong.Custom1)) Then
            strSite = ""
        Else
            strSite = SDB.Player.CurrentSong.Custom1
        End If

        WriteTrackInfo strTrack, strArtist, strAlbum, strSite
    End If
End Sub

Sub WriteTrackInfo (strTrack, strArtist, strAlbum, strSite)

    Dim objStream

    Set objStream = CreateObject("ADODB.Stream")
    objStream.CharSet = "utf-8"
    objStream.Open

    If (strArtist <> "") Then
        objStream.WriteText strArtist & " - "
    End If

    If (strAlbum <> "") Then
        objStream.WriteText strAlbum & " - "
    End If

    objStream.WriteText strTrack

    If (strSite <> "") Then
        objStream.WriteText " (" & strSite & ")"
    End If

    objStream.WriteText "                                               "

    objStream.saveToFile strTextFilePath,2
End Sub
