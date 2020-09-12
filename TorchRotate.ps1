$minutesForEachMap = 20


##############Dont edit below this line###################################################################################
function Get-Funky{
    param([string]$Text)

    # Use a random colour for each character
    $Text.ToCharArray() | ForEach-Object{
        switch -Regex ($_){
            # Ignore new line characters
            "`r"{
                break
            }
            # Start a new line
            "`n"{
                Write-Host " ";break
            }
            # Use random colours for displaying this non-space character
            "[^ ]"{
                # Splat the colours to write-host
                $writeHostOptions = @{
                    ForegroundColor = ([system.enum]::GetValues([system.consolecolor])) | get-random
                    # BackgroundColor = ([system.enum]::GetValues([system.consolecolor])) | get-random
                    NoNewLine = $true
                }
                Write-Host $_ @writeHostOptions
                break
            }
            " "{Write-Host " " -NoNewline}

        } 
    }
}

$text = @"
  _____              _     ____       _        _           _____\    _______  
 |_   _|__  _ __ ___| |__ |  _ \ ___ | |_ __ _| |_ ___    /      \  |      /\
   | |/ _ \| '__/ __| '_ \| |_) / _ \| __/ _` | __/ _ \   /_______/  |_____/  \
   | | (_) | | | (__| | | |  _ < (_) | || (_| | ||  __/ |   \   /        /   /
   |_|\___/|_|  \___|_| |_|_| \_\___/ \__\__,_|\__\___|  \   \         \/   /
                                                          \  /          \__/_
                                                           \/  

"@  
Get-Funky $text
Write-host " "
Write-Host "Author: GarretSidzaka https://expanse.2enp.com"
Write-Host " "
$minutesForEachMap = $minutesForEachMap + 1 #padding for server startup
$secondsForEachMap = $minutesForEachMap * 60
start-sleep -s 2
$executableFilePath = $PSScriptRoot + "\Torch.Server.exe"
$map1StorageFilePath =  $PSScriptRoot + "\map1.zip"
$map2StorageFilePath =  $PSScriptRoot + "\map2.zip"
$map3StorageFilePath =  $PSScriptRoot + "\map3.zip"
$map4StorageFilePath =  $PSScriptRoot + "\map4.zip"
$currentLiveMapFilePath = $PSScriptRoot + "\Instance\Saves"
Write-Host "Server executable = " + $executableFilePath
Write-Host "Path for backup map.zip = " + $mapStorageFilePath
Write-Host "Live server map folder = " + $currentLiveMapFilePath
Write-Host "YOU MUST RECOGNIZE THAT THIS PROGRAM WILL COMPLETELY"
Write-Host "DELETE YOUR MAP IN.... DO NOT CONTINUE WITHOUT"
Write-Host "READING THE INSTRUCTIONS AND BACKING UP YOUR MAP"
Read-Host -Prompt "Press Enter to AGREE TO DELETION OF MAP, Control-C to cancel"
Write-Host " "
start-sleep -s 2

Write-Host "Starting server at " + $executableFilePath




while($true){
    Write-Host "Starting fresh map rotation"


	    Write-Host "deleting the map files"
            Start-Sleep -Seconds 1
	     Get-ChildItem -Path $currentLiveMapFilePath -Include *.* -File -Recurse | foreach { $_.Delete()}
		             Start-Sleep -Seconds 1
		 Get-ChildItem -Path $currentLiveMapFilePath -Include * -File -Recurse | foreach { $_.Delete()}
		            Start-Sleep -Seconds 1
          Write-Host "extract the original backup map"
	
		Expand-Archive -LiteralPath $map1StorageFilePath -DestinationPath $currentLiveMapFilePath
		$mapnotifier = $currentLiveMapFilePath+"\map1.txt"
		Write-Host $mapnotifier
		Out-File -FilePath $mapnotifier

	    for ($a=0; $a -le 5; $a++) {
            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
	start-process $executableFilePath
    $ps = get-process | ?  {$_.Path -eq "$executableFilePath"}
    Write-Host $ps
    Write-Host $ps.Name
	Write-Host $ps.Path
	Write-Host $ps.id
	     Write-Host "Starting next map"

		

    Write-Host "Current Map file:" $map1StorageFilePath
        Write-Host " "
        for ($a=0; $a -le $secondsForEachMap; $a++) {

            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		 Write-Host "first killing the server process"


		 #Read-Host -Prompt "Press Enter"
         Stop-Process -Force -Id $ps.id
		 Get-Funky $text
		


		for ($a=0; $a -le 5; $a++) {
            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		
	    Write-Host "delete the map files"
            Start-Sleep -Seconds 1
	     Get-ChildItem -Path $currentLiveMapFilePath -Include *.* -File -Recurse | foreach { $_.Delete()}
		             Start-Sleep -Seconds 1
		 Get-ChildItem -Path $currentLiveMapFilePath -Include * -File -Recurse | foreach { $_.Delete()}
		            Start-Sleep -Seconds 1
          Write-Host "extract the original backup map"
	
		Expand-Archive -LiteralPath $map2StorageFilePath -DestinationPath $currentLiveMapFilePath
        $mapnotifier = $currentLiveMapFilePath+"\map2.txt"
		Write-Host $mapnotifier
		Out-File -FilePath $mapnotifier

	    for ($a=0; $a -le 5; $a++) {
            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		
		
		
		
	     start-process $executableFilePath
    $ps = get-process | ?  {$_.Path -eq "$executableFilePath"}
    Write-Host $ps
    Write-Host $ps.Name
	Write-Host $ps.Path
	Write-Host $ps.id
    Write-Host "Starting next map"
    Write-Host "Current Map file:" $map2StorageFilePath
        Write-Host " "
        for ($a=0; $a -le $secondsForEachMap; $a++) {

            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		 Write-Host "first killing the server process"


		 #Read-Host -Prompt "Press Enter"
         Stop-Process -Force -Id $ps.id
		 Get-Funky $text
		


		for ($a=0; $a -le 5; $a++) {
            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		
	    Write-Host "delete the map files"
            Start-Sleep -Seconds 1
	     Get-ChildItem -Path $currentLiveMapFilePath -Include *.* -File -Recurse | foreach { $_.Delete()}
		             Start-Sleep -Seconds 1
		 Get-ChildItem -Path $currentLiveMapFilePath -Include * -File -Recurse | foreach { $_.Delete()}
		            Start-Sleep -Seconds 1
          Write-Host "extract the original backup map"
	
		Expand-Archive -LiteralPath $map3StorageFilePath -DestinationPath $currentLiveMapFilePath
        $mapnotifier = $currentLiveMapFilePath+"\map3.txt"
		Write-Host $mapnotifier
		Out-File -FilePath $mapnotifier

	    for ($a=0; $a -le 10; $a++) {
            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		
		
		
		
	     start-process $executableFilePath
    $ps = get-process | ?  {$_.Path -eq "$executableFilePath"}
    Write-Host $ps
    Write-Host $ps.Name
	Write-Host $ps.Path
	Write-Host $ps.id
     Write-Host "Starting next map"
    Write-Host "Current Map file:" $map3StorageFilePath

 Write-Host " "
        for ($a=0; $a -le $secondsForEachMap; $a++) {

            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		 Write-Host "first killing the server process"


		 #Read-Host -Prompt "Press Enter"
         Stop-Process -Force -Id $ps.id
		 Get-Funky $text
		


		for ($a=0; $a -le 5; $a++) {
            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		
	    Write-Host "delete the map files"
            Start-Sleep -Seconds 1
	     Get-ChildItem -Path $currentLiveMapFilePath -Include *.* -File -Recurse | foreach { $_.Delete()}
		             Start-Sleep -Seconds 1
		 Get-ChildItem -Path $currentLiveMapFilePath -Include * -File -Recurse | foreach { $_.Delete()}
		            Start-Sleep -Seconds 1
          Write-Host "extract the original backup map"
	
		Expand-Archive -LiteralPath $map4StorageFilePath -DestinationPath $currentLiveMapFilePath
        $mapnotifier = $currentLiveMapFilePath+"\map4.txt"
		Write-Host $mapnotifier
		Out-File -FilePath $mapnotifier

	    for ($a=0; $a -le 10; $a++) {
            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		
		
		
		
	     start-process $executableFilePath
    $ps = get-process | ?  {$_.Path -eq "$executableFilePath"}
    Write-Host $ps
    Write-Host $ps.Name
	Write-Host $ps.Path
	Write-Host $ps.id
	     Write-Host "Starting next map"
    Write-Host "Current Map file:" $map4StorageFilePath

        Write-Host " "
        for ($a=0; $a -le $secondsForEachMap; $a++) {

            Write-Host -NoNewLine "`r0$a"
            Start-Sleep -Seconds 1
        }
		 Write-Host "first killing the server process"


		 #Read-Host -Prompt "Press Enter"
         Stop-Process -Force -Id $ps.id
		 Get-Funky $text

}

Read-Host -Prompt "Press Enter to exit"
