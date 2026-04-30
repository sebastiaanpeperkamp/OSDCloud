$DebugPreference = "Continue"

Start-Transcript -Path "X:\OSDCloud\Debug.log" -Force
Write-Debug "Start Start-OSDCloud script"

# Windows variables
$Product = (Get-MyComputerProduct)
$Model = (Get-MyComputerModel)
$Manufacturer = (Get-CimInstance -ClassName Win32_ComputerSystem).Manufacturer
$OSVersion = 'Windows 11' #Used to Determine Driver Pack
$OSReleaseID = '25H2' #Used to Determine Driver Pack
$OSName = 'Windows 11 25H2 x64'
$OSEdition = 'Enterprise'
$OSActivation = 'Volume'
$OSLanguage = 'en-US'

# OSDVariables
Write-Debug "Set Variables"
$Global:MyOSDCloud = [ordered]@{
    Restart = [bool]$true
    RecoveryPartition = [bool]$true
    OEMActivation = [bool]$true
    WindowsUpdate = [bool]$true          # Install Windows Updates after installing Windows
    WindowsUpdateDrivers = [bool]$true   # Update drivers during Windows Updates after installing Windows
    WindowsDefenderUpdate = [bool]$true  # Update Defender during Windows Updates after installing Windows
    SetTimeZone = [bool]$true
    ClearDiskConfirm = [bool]$False
    ShutdownSetupComplete = [bool]$false
    SyncMSUpCatDriverUSB = [bool]$true
    CheckSHA1 = [bool]$true
}

Write-Debug $($Global:MyOSDCloud | ConvertTo-Json)

Try {

    $DriverPack = Get-OSDCloudDriverPack -Product $Product -OSVersion $OSVersion -OSReleaseID $OSReleaseID
    if ($DriverPack){
    
        $Global:MyOSDCloud.DriverPackName = $DriverPack.Name
        
    }

} Catch {

    Write-Debug "An error occured: $($_)"
    Throw $_
    
}

Try {

    Write-Debug "Start Deployment"
    Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage

} Catch {

    Write-Debug "An error occured: $($_)"
    Throw $_
    
}

Stop-Transcript
